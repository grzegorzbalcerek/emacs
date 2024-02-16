
(set-register ?s 90) ; set register ?s to the default of 90 columns
(set-register ?c 125) ; set register ?c to the default of 125 columns

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
