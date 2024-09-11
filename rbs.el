;;; -*- lexical-biding: t -*-

(provide 'rbs)

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

(define-minor-mode verse-position-minor-mode
  "Toggle minor mode for including only the verse number into the position address." nil " VerseOnly" nil)

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
      (if verse-position-minor-mode
          (format "%s" (buffer-substring (match-beginning 2) (match-end 2)))
        (format "%s%c" (buffer-substring (match-beginning 2) (match-end 2)) (+ 96 n))))))

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
  (local-set-key [C-s-f2] 'verse-position-minor-mode)
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

