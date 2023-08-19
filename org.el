
(defun org-mode-customizations()
  (interactive)
  (local-set-key [return] 'newline)
  )

(add-hook 'org-mode-hook 'org-mode-customizations)
