;;; -*- lexical-biding: t -*-

(global-set-key [C-f1] (lambda(b e)(interactive "r")(make-button b e 'face 'eww-form-submit 'action 'org-clock-in)))

(defun activate-urls()
  "make buttons for urls"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "http[s]?://[^ \n]+" nil t)
      (let ((b (match-beginning 0))
            (e (match-end 0)))
        (make-button b e 'action (lambda (x) (browse-url (buffer-substring b e))))))))

