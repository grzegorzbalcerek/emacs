;;; -*- lexical-biding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             yank with replacing a region                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                copy to the kill ring fragments of rewritten RBS text                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq rbs-opening-quotation-mark "“")
(setq rbs-closing-quotation-mark "”")
(setq rbs-register "")

(defun rbs-customize-language-environment()
  (interactive)
  (cond
   ((equal current-language-environment "English")
    (setq rbs-opening-quotation-mark "“")
    (setq rbs-closing-quotation-mark "”"))
   ((equal current-language-environment "French")
    (setq rbs-opening-quotation-mark "« ")
    (setq rbs-closing-quotation-mark " »"))
   ((equal current-language-environment "Polish")
    (setq rbs-opening-quotation-mark "„")
    (setq rbs-closing-quotation-mark "”"))))

(add-hook 'set-language-environment-hook 'rbs-customize-language-environment)
(rbs-customize-language-environment)

(defun position-address(pos)
  "Return the line number of the position pos within a verse.
   A verse starts with its number"
  (save-excursion
    (goto-char pos)
    (let ((n 1))
      (while (not (looking-back "\\(^\\|[^0-9]\\)\\([0-9]+\\)[^0-9]*" (pos-bol)))
        (previous-line)(move-end-of-line nil)
        (if (looking-back "[a-zA-Zα-ωΑ-Ω].*")
            (setq n (1+ n))))
      (format "%s%c" (buffer-substring (match-beginning 2) (match-end 2)) (+ 96 n)))))


(defun region-and-address(b e)
  (interactive "r")
  (replace-regexp-in-string "  +" " " (format "%s%s%s (%s)"
                      rbs-opening-quotation-mark
                      (buffer-substring b e)
                      rbs-closing-quotation-mark
                      (position-address b))))

(defun register-new-region-and-address(b e)
  (interactive "r")
  (setq rbs-register (region-and-address b e))
  (kill-new rbs-register t)
  (message rbs-register))

(defun register-append-region-and-address(b e)
  (interactive "r")
  (setq rbs-register (format "%s, %s" rbs-register (region-and-address b e)))
  (kill-new rbs-register t)
  (message rbs-register))

(defun register-append-address(b e)
  (interactive "r")
  (setq rbs-register (format "%s, %s)" (substring rbs-register 0 -1) (position-address b)))
  (kill-new rbs-register t)
  (message rbs-register))

(defun rbs-enriched-mode-customizations()
  (interactive)
  (local-set-key [f2] 'register-new-region-and-address)
  (local-set-key [C-f2] 'register-append-region-and-address)
  (local-set-key [s-f2] 'register-append-address)
  (local-set-key [M-f2] 'register-append-address)
  )

(add-hook 'enriched-mode-hook 'rbs-enriched-mode-customizations)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                           kill ring save without newlines                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun kill-ring-save-clean-whitespace(beg end)
  "Return the line number of the position pos within a verse.
   A verse starts with its number"
  (interactive "r")
  (let ((text (buffer-substring beg end)))
    (kill-new (string-clean-whitespace text))))

(global-set-key (kbd "s-w") 'kill-ring-save-clean-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            comparisons with libre office                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun prepare-ediff-emacs(beg end)
  "Save the text from region into a new buffer called *emacs* and fill paragraph"
  (interactive "r")
  (let ((msg
         (if (get-buffer "*emacs*")
             (progn
               (kill-buffer "*emacs*")
               "Previous buffer was killed")
           "")))
    (kill-ring-save-clean-whitespace beg end)
    (get-buffer-create "*emacs*")
    (set-buffer "*emacs*")
    (yank)
    (fill-paragraph)
    (message "Buffer *emacs* ready. %s" msg))
  (if (get-buffer "*other*")
      (ediff-buffers "*emacs*" "*other*")))

(global-set-key (kbd "C-c e") 'prepare-ediff-emacs)

(defun prepare-ediff-other()
  "Save the text from the clipboard into a new buffer called *other* and fill paragraph"
  (interactive)
  (let ((msg
         (if (get-buffer "*other*")
             (progn
               (kill-buffer "*other*")
               "Previous buffer was killed")
           "")))
    (get-buffer-create "*other*")
    (set-buffer "*other*")
    (yank)
    (fill-paragraph)
    (message "Buffer *other* ready. %s" msg))
  (if (get-buffer "*emacs*")
      (ediff-buffers "*emacs*" "*other*")))

(global-set-key (kbd "C-c o") 'prepare-ediff-other)

(defun start-ediff-emacs-other()
  (interactive)
  (ediff-buffers "*emacs*" "*other*"))

(global-set-key (kbd "C-c s") 'start-ediff-emacs-other)

(defun quit-ediff-buffers()
  (interactive)
  (kill-buffer "*emacs*")
  (kill-buffer "*other*")
  (delete-other-windows))

(global-set-key (kbd "C-c q") 'quit-ediff-buffers)
