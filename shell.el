
(defun send-line-to-shell () (interactive)
  (let ((beg (save-excursion (move-beginning-of-line nil)(point)))
        (end (save-excursion (move-end-of-line nil)(point))))
    (let ((line (buffer-substring beg end)))
      (other-window 1)
      (insert line)
      (comint-send-input)
      (other-window 1)
      (next-line 1 nil))))

(defun send-region-to-shell (b e) (interactive "r")
  (let ((cmd (buffer-substring b e)))
    (let ((cmd-lines (split-string cmd "\n")))
      (other-window 1)
      (dolist (line cmd-lines)
        (if (not (equal line ""))
            (progn
              (insert line)
              (comint-send-input)
              (sleep-for 2))))
      (other-window 1))))

(defun doc-word-in-shell () (interactive)
  (let ((beg (save-excursion (search-backward-regexp "[ ()\n]" nil)(forward-char 1)(point)))
        (end (save-excursion (search-forward-regexp "[ ()\n]" nil)(backward-char 1)(point))))
    (let ((word (buffer-substring beg end)))
      (save-excursion
        (other-window 1)
        (insert "(doc " word ")")
        (comint-send-input)
        (other-window 1)
        (next-line 1 nil)))))

