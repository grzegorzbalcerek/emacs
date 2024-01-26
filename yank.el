
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
(global-set-key [tool-bar isearch-forward] 'yank-replace-region)

