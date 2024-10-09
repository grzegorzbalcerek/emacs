(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(buffers-menu-max-size 30)
 '(calendar-date-style 'european)
 '(calendar-week-start-day 1)
 '(current-language-environment "English")
 '(fill-column 90)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
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
 '(outline-minor-mode-prefix [3])
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")))
 '(package-selected-packages
   '(tree-sitter-langs typescript-mode tree-sitter company multiple-cursors lsp-mode rust-mode))
 '(safe-local-variable-values '((lexical-biding . t)))
 '(speedbar-show-unknown-files t)
 '(tab-stop-list
   '(2 4 25 50 75 100 125 150 175 200 225 250 275 300 325 350 375 400))
 '(truncate-lines t)
 '(typescript-mode-hook '(display-line-numbers-mode lsp))
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'default-frame-alist
                       '(font . "Liberation Mono-10"))

(setq w32-lwindow-modifier 'super)
(if (functionp 'w32-register-hot-key)
    (w32-register-hot-key [s-]))
(prefer-coding-system 'utf-8-unix)
(column-number-mode +1)
(put 'narrow-to-region 'disabled nil)
(set-scroll-bar-mode 'right)
(global-tab-line-mode)

(set-register ?. '(file . "~/repos/emacs/.emacs"))
(set-register ?2 '(file . "~/.emacs2"))
(set-register ?b '(file . "~/bin"))
(set-register ?e '(file . "~/doc/emacs/"))
(set-register ?p '(file . "~/pub/"))
(set-register ?r '(file . "~/doc/rbs/"))
(set-register ?E '(file . "~/repos/emacs/"))

(add-to-list 'load-path "~/repos/emacs")
(require 'camel)
(require 'control)
(require 'convert)
(require 'ediffplus)
(require 'enrichedplus)
(require 'facesplus)
(require 'footnotes)
(require 'greek)
(require 'mlplus)
(require 'orgplus)
(require 'rbs)
(require 'separators)
(require 'tabs)
(require 'unicode)
(require 'yankreplace)

(if (file-exists-p "~/.emacs2")
    (load-file "~/.emacs2"))

(set-buffer "*scratch*")
(insert "\n")
