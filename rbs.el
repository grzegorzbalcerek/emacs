
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
  (let ((str (format "« %s » (%s)" (buffer-substring b e)(position-address b))))
    (message str)
    (kill-new str)))

(defun rbs-enriched-mode-customizations()
  (interactive)
  (local-set-key [f6] 'kill-new-region-and-address))

(add-hook 'enriched-mode-hook 'rbs-enriched-mode-customizations)
