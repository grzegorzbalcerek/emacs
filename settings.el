
(custom-set-variables
'(buffers-menu-max-size 30)
'(calendar-date-style 'european)
'(calendar-week-start-day 1)
'(fill-column 90)
'(indent-tabs-mode nil)
'(inhibit-startup-screen t)
'(make-backup-files nil)
'(max-lisp-eval-depth 999999)
'(max-specpdl-size 999999)
'(mouse-drag-copy-region t)
'(org-time-stamp-rounding-minutes '(0 1))
'(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")))
'(package-selected-packages
   '(tree-sitter-langs typescript-mode tree-sitter company multiple-cursors lsp-mode rust-mode))
'(speedbar-show-unknown-files t)
'(tab-stop-list '(1 25 50 75 100 125 150))
'(typescript-mode-hook '(display-line-numbers-mode lsp)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(prefer-coding-system 'utf-8-unix)
(column-number-mode +1)
(toggle-truncate-lines 0)
(put 'narrow-to-region 'disabled nil)
(set-scroll-bar-mode 'right)
(global-tab-line-mode)
