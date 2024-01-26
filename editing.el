(defun solid-line()
  (interactive)
  (let ((k 90))
    (while (and (> k 0) (not (equal (following-char) 10)) (not (equal (following-char) 10)))
      (setq k (- k 1))
      (delete-char 1)))
  (insert "——————————————————————————————————————————————————————————————————————————————————————————"))

(defun dotted-line()
  (interactive)
  (let ((k 90))
    (while (and (> k 0) (not (equal (following-char) 10)) (not (equal (following-char) 10)))
      (setq k (- k 1))
      (delete-char 1)))
  (insert "··························································································"))

(defun bullet-line()
  (interactive)
  (let ((k 90))
    (while (and (> k 0) (not (equal (following-char) 10)) (not (equal (following-char) 10)))
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

(defun ucode-to-char()
  (interactive)
  (set-mark-command nil)
  (search-backward-regexp "[^0-9a-fA-F]")
  (forward-char 1)
  (let ((v (buffer-substring (region-beginning)(region-end))))
    (kill-region(region-beginning)(region-end))
    (insert-char (string-to-number v 16))))

(setq buffer-names-to-skip
      '(
        "*Backtrace*"
        "*Buffer List*"
        "*Completions*"
        "*Quail Completions*"
        "*Flymake log*"
        "*Help*"
        "*Messages*"
        "*company-documentation*"
        "*compilation*"
        "*lsp-log*"
        "*ts-ls*"
        "*ts-ls::stderr*"
        ))

(defun intelligent-change-buffer(move-function)
       (let ((this-buffer-name (buffer-name(current-buffer))))
         (funcall move-function)
         (while (and
                 (not (equal this-buffer-name (buffer-name(current-buffer))))
                 (or
                  (member (buffer-name(current-buffer)) buffer-names-to-skip)
                  (equal major-mode 'dired-mode)))
           (funcall move-function))))

(defun intelligent-next-buffer()
  (interactive)
  (intelligent-change-buffer 'next-buffer))

(defun intelligent-previous-buffer()
  (interactive)
  (intelligent-change-buffer 'previous-buffer))

(defun yank-replace-region(beg end)
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

(defun polish-region(beg end)
  (interactive "r")
  (setq end (rereplace-with-bounds beg end " \"" " „"))
  (setq end (rereplace-with-bounds beg end "\" " "” "))
  (setq end (rereplace-with-bounds beg end "“" "„"))
  (setq end (rereplace-with-bounds beg end "«" "„"))
  (setq end (rereplace-with-bounds beg end "»" "”"))
  (setq end (rereplace-with-bounds beg end "'" "’"))
  )

(defun english-region(beg end)
  (interactive "r")
  (setq end (rereplace-with-bounds beg end " \"" " “"))
  (setq end (rereplace-with-bounds beg end "\" " "” "))
  (setq end (rereplace-with-bounds beg end "„" "“"))
  (setq end (rereplace-with-bounds beg end "«" "“"))
  (setq end (rereplace-with-bounds beg end "»" "”"))
  (setq end (rereplace-with-bounds beg end "'" "’"))
  (setq end (rereplace-with-bounds beg end "\\([0-9]\\),\\([0-9]\\)" "\\1:\\2"))
  )

(defun convert-text-region(table beg end)
  "convert a region of text to a different text"
  (let ((case-fold-search nil)
        (begm (copy-marker beg nil))
        (endm (copy-marker end t)))
    (save-excursion
      (goto-char begm)
      (while (< (point) endm)
                                        ; convert next character
        (let ((p table))
          (while p
            ;(message "trying %s" (caar p))
            (if (looking-at (caar p))
                (progn
                  (delete-char (- (match-end 0) (match-beginning 0)))
                  (insert (cdar p))
                  (message "%s → %s" (caar p) (cdar p))
                  (left-char)
                  (setq p nil))
              (setq p (cdr p)))))
        (right-char)))))

(defun region-toggle-camel-case (b e) (interactive "r")
  (let ((dash-found (save-excursion
                      (goto-char b)
                      (search-forward "-" e t)))
        (beg (copy-marker b))
        (end (copy-marker e)))
    (if dash-found
        (progn
         (replace-string "-a" "A" nil beg end)
         (replace-string "-b" "B" nil beg end)
         (replace-string "-c" "C" nil beg end)
         (replace-string "-d" "D" nil beg end)
         (replace-string "-e" "E" nil beg end)
         (replace-string "-f" "F" nil beg end)
         (replace-string "-g" "G" nil beg end)
         (replace-string "-h" "H" nil beg end)
         (replace-string "-i" "I" nil beg end)
         (replace-string "-j" "J" nil beg end)
         (replace-string "-k" "K" nil beg end)
         (replace-string "-l" "L" nil beg end)
         (replace-string "-m" "M" nil beg end)
         (replace-string "-n" "N" nil beg end)
         (replace-string "-o" "O" nil beg end)
         (replace-string "-p" "P" nil beg end)
         (replace-string "-q" "Q" nil beg end)
         (replace-string "-r" "R" nil beg end)
         (replace-string "-s" "S" nil beg end)
         (replace-string "-t" "T" nil beg end)
         (replace-string "-u" "U" nil beg end)
         (replace-string "-w" "W" nil beg end)
         (replace-string "-v" "V" nil beg end)
         (replace-string "-x" "X" nil beg end)
         (replace-string "-y" "Y" nil beg end)
         (replace-string "-z" "Z" nil beg end))
      (progn
        (replace-string "A" "-a" nil beg end)
        (replace-string "B" "-b" nil beg end)
        (replace-string "C" "-c" nil beg end)
        (replace-string "D" "-d" nil beg end)
        (replace-string "E" "-e" nil beg end)
        (replace-string "F" "-f" nil beg end)
        (replace-string "G" "-g" nil beg end)
        (replace-string "H" "-h" nil beg end)
        (replace-string "I" "-i" nil beg end)
        (replace-string "J" "-j" nil beg end)
        (replace-string "K" "-k" nil beg end)
        (replace-string "L" "-l" nil beg end)
        (replace-string "M" "-m" nil beg end)
        (replace-string "N" "-n" nil beg end)
        (replace-string "O" "-o" nil beg end)
        (replace-string "P" "-p" nil beg end)
        (replace-string "Q" "-q" nil beg end)
        (replace-string "R" "-r" nil beg end)
        (replace-string "S" "-s" nil beg end)
        (replace-string "T" "-t" nil beg end)
        (replace-string "U" "-u" nil beg end)
        (replace-string "W" "-w" nil beg end)
        (replace-string "V" "-v" nil beg end)
        (replace-string "X" "-x" nil beg end)
        (replace-string "Y" "-y" nil beg end)
        (replace-string "Z" "-z" nil beg end)))))

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
