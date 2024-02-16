
(defun insert-newline()
  (reindent-then-newline-and-indent)
  (beginning-of-line)
  (delete-whitespace-rectangle (line-beginning-position) (line-end-position)))

(defun prefixed-newline(prefix)
  (interactive "P")
  (cond
   ((equal prefix '(4)) (newline-and-solid-line))
   ((equal prefix 0) (newline-and-dotted-line))
   (t (insert-newline))))

(defun tab-cycle(prefix)
  (interactive "P")
  (let ((cycle
         (save-excursion
           (beginning-of-line)
           (if (looking-at outline-regexp) t nil))))
    (if cycle
        (if (functionp 'outline-cycle)
            (outline-cycle prefix)
          (org-cycle))
      (tab-to-tab-stop))))

(defun enriched-mode-customizations()
  (interactive)
  (modify-syntax-entry ?· ".")
  (modify-syntax-entry ?· ".")
  (modify-syntax-entry ?\‚ "(’")
  (modify-syntax-entry ?\’ ")‚")
  (modify-syntax-entry ?\„ "(”")
  (modify-syntax-entry ?\” ")„")
  (setq-local outline-regexp "[*—]+")
  ;(setq-local outline-minor-mode-prefix "")
  (setq-local indent-line-function 'tab-to-tab-stop)
  (outline-minor-mode)
  (local-set-key [tab] 'tab-cycle)
  (local-set-key [return] 'prefixed-newline)
  (local-set-key [?\M-\r] (lambda()(interactive)(insert "\n")))
  (local-set-key (kbd "C-a") 'beginning-of-line)
  )

(add-hook 'enriched-mode-hook 'enriched-mode-customizations)
