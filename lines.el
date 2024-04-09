;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               Moving and copying lines                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun move-line-down()
  (interactive)
  (next-line)
  (transpose-lines 1)
  (previous-line))

(defun move-line-up()
  (interactive)
  (next-line)
  (transpose-lines -1)
  (previous-line))

(defun duplicate-line()
  (interactive)
  (save-excursion
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))
    (goto-char (line-beginning-position 2))
    (yank))
  (next-line 1))

(defun copy-line()
  (interactive)
  (save-excursion
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))))

(global-set-key (kbd "<M-down>") 'move-line-down)
(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "<C-S-return>") 'duplicate-line)
(global-set-key (kbd "<C-M-S-backspace>") 'copy-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                      Registers                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set-register ?s 90) ; set register ?s to the default of 90 columns
(set-register ?c 125) ; set register ?c to the default of 125 columns

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                      Separators                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun delete-up-to-s-chars()
  "Delete up to (get-register ?s) chars"
  (interactive)
  (let ((k (get-register ?s)))
    (while (and (> k 0) (not (equal (following-char) 10)) (not (equal (following-char) 13)))
      (setq k (- k 1))
      (delete-char 1))))

(defun insert-spaces-up-to-col-width()
  "Insert spaces up to the col-width or its multiplication"
  (interactive)
  (insert (make-string (mod (- (get-register ?c) (mod (current-column) (get-register ?c))) (get-register ?c)) ? )))

(defun single-s-separator(separator-char)
  "Insert (with overwrite) a line of (get-register ?s) characters separator-char"
  (delete-up-to-s-chars)
  (insert (make-string (get-register ?s) separator-char)))

(defun multi-s-separator(raw-prefix prefix separator-char)
  "If no prefix is given
   then insert (with overwrite) a line of (get-register ?s) characters separator-char
   otherwise a prefix is given then insert the prefix number of such separators,
   left-aligned with the col-width (register ?c) multiplies"
  (if raw-prefix
      (if (> prefix 0)
          (progn
            (insert-spaces-up-to-col-width)
            (single-s-separator separator-char)
            (multi-s-separator raw-prefix (1- prefix) separator-char)))
    (single-s-separator separator-char)))

(defun solid-separator(raw-prefix prefix)
  "Call multi-s-separator with character —"
  (interactive "P\np")
  (multi-s-separator raw-prefix prefix ?—))

(defun dotted-separator(raw-prefix prefix)
  "Call multi-s-separator with character ·"
  (interactive "P\np")
  (multi-s-separator raw-prefix prefix ?·))

(defun clear-separator()
  "remove the character at point and the same charaters to the left and right"
  (interactive)
  (let ((c (following-char)))
    (save-excursion
      (while (equal c (preceding-char))
        (left-char))
      (while (equal c (following-char))
        (delete-char 1)
        (insert " "))))
  (right-char))

(global-set-key [C-return] 'solid-separator)
(global-set-key [M-return] 'dotted-separator)
(global-set-key [C-M-return] 'clear-separator)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  Join, split lines                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun col-width (raw-prefix prefix)
  "Based on the values of the prefix and the value stored in register ?c
   return the col-width for the join-remote-lines and split-remote-lines functions
   and store it in ?c if not yet there.
   Raise an error if the col-width is unknown"
  (if raw-prefix
      (progn
        (set-register ?c prefix)
        prefix)
    (let ((col-width (get-register ?c)))
      (unless col-width
        (error "Unknown col-width value. Store it into the register ?c or use a prefix for calling the function"))
      col-width)))

(defun join-two-lines (raw-prefix prefix rmin rmax)
  "Join the line where mark is to the line where point is.
  When joining, make sure that the line at point is padded to the mulitple of the value from the ?c register (col-width).
  To set value 125 into register ?c use: C-1-2-5 C-x r n 6.
  If no value is provided in the register then join without padding.
  After joining, move point and mark one line up."
  (interactive "P\np\nr")
  (let* ((rmin (copy-marker rmin))
         (rmax (copy-marker rmax))
         (b (copy-marker (point)))
         (e (copy-marker (mark)))
         (str "")
         (col-width (col-width raw-prefix prefix)))
                                        ; save and delete the line e
    (goto-char e)
    (let ((str (buffer-substring (pos-bol) (pos-eol))))
      (delete-region (pos-bol) (1+ (pos-eol)))
                                        ; delete trailing spaces between b and e
      (delete-trailing-whitespace rmin rmax)
                                        ; insert the saved text into line b with padding
      (goto-char b)
      (move-end-of-line nil)
      (if (> col-width 0)
          (let ((pad-spaces (- col-width (mod (- (point) (pos-bol)) col-width))))
            (insert-char ?  pad-spaces)))
      (insert str)
                                        ; set mark to the line after e
      (goto-char e)
      (set-mark (point))
                                        ; set point to one line below initial position
      (goto-char b)
      (next-line 1)
      )))

(global-set-key (kbd "C-M-^") 'join-two-lines)

(defun split-two-lines (raw-prefix prefix b e)
  "Split the line where b is by keeping the initial ?c  bytes (col-width) and insert the rest into b.
  To set value 125 into register ?c use: C-1-2-5 C-x r n 6.
  If no value is provided in the register then do nothing.
  After joining, move b one line down and add a new line after e."
  (interactive "P\np\nr")
                                        ; check if col-width is available
  (let* ((b (copy-marker b))
         (e (copy-marker e))
         (str "")
         (col-width (col-width raw-prefix prefix)))
    (if (> col-width 0)
        (progn
                                        ; check if line is longer than col-width
          (goto-char b)
          (if (> (- (pos-eol) (pos-bol)) col-width)
                                        ; save and delete the first col-width characters on the line
              (progn
                (setq str (buffer-substring (+ (pos-bol) col-width) (pos-eol)))
                (delete-region (+ (pos-bol) col-width) (pos-eol))))
                                        ; insert the saved line (if it was saved) and a new line at e
          (goto-char e)
          (insert str)
          (insert "\n")
          (set-mark (point))
          (goto-char b)
          (next-line 1)))))

(global-set-key (kbd "C-M-&") 'split-two-lines)
