
(defun org-mode-customizations()
  (interactive)
  (local-set-key [return] 'newline)
  (local-set-key [C-S-return] 'duplicate-line)
  )

(add-hook 'org-mode-hook 'org-mode-customizations)
