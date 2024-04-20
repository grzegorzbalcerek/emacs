;;; -*- lexical-biding: t -*-

(defun org-mode-customizations()
  (interactive)
  (local-set-key [return] 'newline)
  (local-set-key [C-S-return] 'duplicate-line)
  (local-set-key [tab] 'org-cycle)
  )

(add-hook 'org-mode-hook 'org-mode-customizations)

