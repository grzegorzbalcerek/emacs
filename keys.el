
(global-set-key (kbd "C-s-|") 'toggle-truncate-lines)

(global-set-key (kbd "s-j") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-s-j") 'mc/mark-all-like-this)
(global-set-key (kbd "S-s-j") 'mc/unmark-previous-like-this)

(global-set-key (kbd "C-s-\\") 'split-window-right)
(global-set-key (kbd "C-s-`") 'split-window-below)
(global-set-key (kbd "<C-s-left>") (lambda (arg)(interactive "P") (if arg (windmove-delete-left)(windmove-left))))
(global-set-key (kbd "<C-s-right>") (lambda (arg)(interactive "P") (if arg (windmove-delete-right)(windmove-right))))
(global-set-key (kbd "<C-s-up>") (lambda (arg)(interactive "P") (if arg (windmove-delete-up)(windmove-up))))
(global-set-key (kbd "<C-s-down>") (lambda (arg)(interactive "P") (if arg (windmove-delete-down)(windmove-down))))
(global-set-key (kbd "<C-s-return>") 'delete-other-windows)

(global-set-key (kbd "<s-left>") 'intelligent-previous-buffer)
(global-set-key (kbd "<s-right>") 'intelligent-next-buffer)
(global-set-key (kbd "<s-up>") (lambda()(interactive)(dired ".")))
(global-set-key (kbd "<s-down>") 'buffer-menu)
(global-set-key (kbd "<s-backspace>") (lambda()(interactive)(kill-buffer nil)))

(global-set-key [f1] 'save-buffer)
(global-set-key [f2] 'delete-trailing-whitespace)
(global-set-key [f5] 'compile)
(global-set-key [f6] 'recompile)
(global-set-key [f7] 'previous-error)
(global-set-key [f8] 'next-error)
(global-set-key [f9] 'delete-whitespace-rectangle)
(global-set-key [f10] 'open-rectangle)

(global-set-key (kbd "C-M-y") 'yank-replace-region)

(global-set-key (kbd "<M-down>") 'move-line-down)
(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "<C-S-return>") 'duplicate-line)
(global-set-key (kbd "<C-M-S-backspace>") 'copy-line)
(global-set-key (kbd "s-x") 'ucode-to-char)

(global-set-key (kbd "s-<") (lambda()(interactive)(insert "«")))
(global-set-key (kbd "s->") (lambda()(interactive)(insert "»")))
(global-set-key (kbd "s-,") (lambda()(interactive)(insert "«")))
(global-set-key (kbd "s-.") (lambda()(interactive)(insert "»")))

(global-set-key (kbd "s-'") (lambda()(interactive)(insert "‚")))
(global-set-key (kbd "s-\"") (lambda()(interactive)(insert "„")))
(global-set-key (kbd "s-]") (lambda()(interactive)(insert "’")))
(global-set-key (kbd "s-}") (lambda()(interactive)(insert "”")))

(global-set-key (kbd "s-|") (lambda()(interactive)(insert "‛")))
(global-set-key (kbd "s-\\") (lambda()(interactive)(insert "‟")))
(global-set-key (kbd "s-[") (lambda()(interactive)(insert "‘")))
(global-set-key (kbd "s-{") (lambda()(interactive)(insert "“")))

(global-set-key (kbd "s-:") (lambda()(interactive)(insert "…")))
(global-set-key (kbd "s-;") (lambda(n)(interactive "p") (insert (make-string n ?·))))
(global-set-key (kbd "s--") (lambda(n)(interactive "p") (insert (make-string n ?−))))
(global-set-key (kbd "s-_") (lambda(n)(interactive "p") (insert (make-string n ?—))))
(global-set-key (kbd "s-=") (lambda(n)(interactive "p") (insert (make-string n ?–))))

(global-set-key (kbd "<M-insert>") 'delete-selection-mode)
