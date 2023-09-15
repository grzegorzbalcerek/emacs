(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(org-babel-load-languages '((js . t) (awk . t) (python . t) (emacs-lisp . t)))
 '(org-babel-python-command "python3")
 '(org-confirm-babel-evaluate nil)
 '(org-file-apps
   '((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "evince %s")))
 '(org-latex-compiler "xelatex")
 '(org-latex-packages-alist
   '(("left=10mm,top=10mm,right=10mm,bottom=15mm" "geometry" nil)))
 '(org-time-stamp-rounding-minutes '(0 1))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")))
 '(package-selected-packages
   '(tree-sitter-langs typescript-mode tree-sitter company multiple-cursors lsp-mode rust-mode))
 '(speedbar-show-unknown-files t)
 '(tab-stop-list '(2 25 50 75 100 125 150))
 '(truncate-lines t)
 '(typescript-mode-hook '(display-line-numbers-mode lsp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq w32-lwindow-modifier 'super)
(w32-register-hot-key [s-])
(prefer-coding-system 'utf-8-unix)
(column-number-mode +1)
(put 'narrow-to-region 'disabled nil)
(set-scroll-bar-mode 'right)
(global-tab-line-mode)

(set-register ?. '(file . "~/.emacs"))
(set-register ?e '(file . "~/doc/emacs/"))
(set-register ?m '(file . "~/Makefile"))
(set-register ?p '(file . "~/pub/"))
(set-register ?r '(file . "~/doc/rbs/"))
(set-register ?E '(file . "~/repos/emacs/"))

(load-file "~/repos/emacs/editing.el")
(load-file "~/repos/emacs/text.el")
(load-file "~/repos/emacs/greek.el")
(load-file "~/repos/emacs/enriched.el")
(load-file "~/repos/emacs/org.el")
(load-file "~/repos/emacs/keys.el")

(find-file "~/repos/emacs/org.org")

(set-buffer "*scratch*")
(insert "\n")
