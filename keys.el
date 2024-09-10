;;; -*- lexical-biding: t -*-

(global-set-key (kbd "C-M-|") 'toggle-truncate-lines)
(global-set-key (kbd "M-o m") 'enriched-toggle-markup)

(global-set-key (kbd "s-j") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-s-j") 'mc/mark-all-like-this)
(global-set-key (kbd "S-s-j") 'mc/unmark-previous-like-this)

;(global-set-key (kbd "<M-left>") (lambda ()(interactive) (left-char (get-register ?h))))
;(global-set-key (kbd "<M-right>") (lambda ()(interactive) (right-char (get-register ?h))))

(global-set-key (kbd "C-c <left>") 'windmove-delete-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "<s-M-left>") 'windmove-left)
(global-set-key (kbd "<s-M-right>") 'windmove-right)
(global-set-key (kbd "<s-M-up>") 'windmove-up)
(global-set-key (kbd "<s-M-down>") 'windmove-down)
(global-set-key (kbd "<s-M-return>") 'other-window)

(global-set-key [f1] 'save-buffer)
;(global-set-key [f5] 'compile)
;(global-set-key [f6] 'recompile)
;(global-set-key [f7] 'previous-error)
;(global-set-key [f8] 'next-error)
(global-set-key [M-f8] 'edit-tab-stops)
(global-set-key [f9] 'delete-whitespace-rectangle)
(global-set-key [C-f9] 'delete-trailing-whitespace)
(global-set-key [f10] 'open-rectangle)
(global-set-key [f11] 'picture-mode)
(global-set-key [C-f11] 'picture-mode-exit)

(global-set-key (kbd "<M-insert>") 'delete-selection-mode)

