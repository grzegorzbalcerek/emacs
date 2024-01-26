

(defun solid-separator()
  "Insert (with overwrite) a line of 90 characters —"
  (interactive)
  (let ((k 90))
    (while (and (> k 0) (not (equal (following-char) 10)) (not (equal (following-char) 13)))
      (setq k (- k 1))
      (delete-char 1)))
  (insert "——————————————————————————————————————————————————————————————————————————————————————————"))

(defun dotted-separator()
  "Insert (with overwrite) a line of 90 characters ·"
  (interactive)
  (let ((k 90))
    (while (and (> k 0) (not (equal (following-char) 10)) (not (equal (following-char) 13)))
      (setq k (- k 1))
      (delete-char 1)))
  (insert "··························································································"))

(defun bullet-separator()
  "Insert (with overwrite) a line of 90 characters •"
  (interactive)
  (let ((k 90))
    (while (and (> k 0) (not (equal (following-char) 10)) (not (equal (following-char) 13)))
      (setq k (- k 1))
      (delete-char 1)))
  (insert "••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••"))

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
(global-set-key [S-return] 'bullet-separator)
(global-set-key [C-M-return] 'clear-separator)
