
(setq rbs-opening-quotation-mark "“")
(setq rbs-closing-quotation-mark "”")

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
        (message "d1:%s" n)
        (if (looking-back "[a-zA-Zα-ωΑ-Ω].*")
            (setq n (1+ n))))
      (format "%s%c" (buffer-substring (match-beginning 2) (match-end 2)) (+ 96 n)))))


(defun kill-new-region-and-address(b e)
  (interactive "r")
  (let* ((str (format "%s%s%s (%s)"
                      rbs-opening-quotation-mark
                      (buffer-substring b e)
                      rbs-closing-quotation-mark
                      (position-address b)))
         (str2 (replace-regexp-in-string "  +" " " str)))
    (message str2)
    (kill-new str2)))

(defun rbs-enriched-mode-customizations()
  (interactive)
  (local-set-key [f2] 'kill-new-region-and-address))

(add-hook 'enriched-mode-hook 'rbs-enriched-mode-customizations)
