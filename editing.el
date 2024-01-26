(defun solid-line()
  "Insert (with overwrite) a line of 90 characters —"
  (interactive)
  (let ((k 90))
    (while (and (> k 0) (not (equal (following-char) 10)) (not (equal (following-char) 13)))
      (setq k (- k 1))
      (delete-char 1)))
  (insert "——————————————————————————————————————————————————————————————————————————————————————————"))

(defun dotted-line()
  "Insert (with overwrite) a line of 90 characters ·"
  (interactive)
  (let ((k 90))
    (while (and (> k 0) (not (equal (following-char) 10)) (not (equal (following-char) 13)))
      (setq k (- k 1))
      (delete-char 1)))
  (insert "··························································································"))

(defun bullet-line()
  "Insert (with overwrite) a line of 90 characters •"
  (interactive)
  (let ((k 90))
    (while (and (> k 0) (not (equal (following-char) 10)) (not (equal (following-char) 13)))
      (setq k (- k 1))
      (delete-char 1)))
  (insert "••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••"))

(defun space-out-char()
  (interactive)
  (let ((c (following-char)))
    (save-excursion
      (while (equal c (preceding-char))
        (left-char))
      (while (equal c (following-char))
        (delete-char 1)
        (insert " "))))
  (right-char))

(global-set-key [C-return] 'solid-line)
(global-set-key [M-return] 'dotted-line)
(global-set-key [S-return] 'bullet-line)
(global-set-key [C-M-return] 'space-out-char)

(defun delete-max-n-spaces(n)
  "delete at most n spaces"
  (while (> n 0)
    (when (looking-at " ") (delete-char 1))
    (setq n (- n 1))))

(defun delete-max-n-spaces-but-one(n)
  "delete at most n spaces but keep at least one space undeleted"
  (while (> n 0)
    (when (looking-at "  ") (delete-char 1))
    (setq n (- n 1))))

(defun back-delete-max-n-spaces(n)
  (while (> n 0)
    (when (looking-back " ") (delete-char -1))
    (setq n (- n 1))))

(defun rereplace(regex str)
  (goto-char (point-min))
  (while (re-search-forward regex nil t)
    (replace-match str)))

(defun yank-replace-region(beg end)
  "Replace region with the previous ring value"
  (interactive "r")
  (delete-region beg end)
  (let ((curr-buff (current-buffer))
        (temp-buff (generate-new-buffer "*rbs-deleteme*")))
    (set-buffer temp-buff)
    (yank 2)
    (let ((str (buffer-substring (point-min) (point-max))))
      (kill-buffer temp-buff)
      (set-buffer curr-buff)
      (insert str))))

(global-set-key (kbd "C-M-y") 'yank-replace-region)

(defun col-width (raw-prefix prefix)
  "Based on the values of the prefix and the value stored in register ?6
   return the col-width for the join-remote-lines and split-remote-lines functions
   and store it in ?6 if not yet there.
   Raise an error if the col-width is unknown"
  (if raw-prefix
      (progn
        (set-register ?6 prefix)
        prefix)
    (let ((col-width (get-register ?6)))
      (unless col-width
        (error "Unknown col-width value. Store it into the register ?6 or use a prefix for calling the function"))
      col-width)))

(defun join-remote-lines (raw-prefix prefix b e)
  "Join the line where e is to the line where b is.
  When joining, make sure that the line at b is padded to the mulitple of the value from the ?6 register (col-width).
  To set value 125 into register ?6 use: C-1-2-5 C-x r n 6.
  If no value is provided in the register then join without padding.
  After joining, move b and e one line up."
  (interactive "P\np\nr")
                                        ; set in b0 the beginning of line b
  (let* ((b (copy-marker b))
         (e (copy-marker e))
         (str "")
         (col-width (col-width raw-prefix prefix)))
                                        ; save and delete the line e
    (goto-char e)
    (let ((str (buffer-substring (pos-bol) (pos-eol))))
      (delete-region (pos-bol) (1+ (pos-eol)))
                                        ; delete trailing spaces between b and es
      (delete-trailing-whitespace b e)
                                        ; insert the saved text into line b with padding
      (goto-char b)
      (move-end-of-line nil)
      (if (> col-width 0)
          (let ((pad-spaces (- col-width (mod (- (point) (pos-bol)) col-width))))
            (insert-char ?  pad-spaces)))
      (insert str)
                                        ; set mark to the line after e
      (goto-char e)
      (previous-line 1)
      (set-mark (point))
                                        ; set point to one line below initial position
      (goto-char b)
      (previous-line 1))))

(global-set-key (kbd "C-M-^") 'join-remote-lines)

(defun split-remote-lines (raw-prefix prefix b e)
  "Split the line where b is by keeping the initial ?6  bytes (col-width) and insert the rest into b.
  To set value 125 into register ?6 use: C-1-2-5 C-x r n 6.
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

(global-set-key (kbd "C-M-&") 'split-remote-lines)
