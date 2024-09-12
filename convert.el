;;; -*- lexical-biding: t -*-

(provide 'convert)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                 convert-text-region                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun convert-text-region(table beg end)
  "convert a region of text to a different text using the table of replacements"
  (let ((case-fold-search nil)
        (begm (copy-marker beg nil))
        (endm (copy-marker end t)))
    (save-excursion
      (goto-char begm)
      (while (< (point) endm)
                                        ; convert next character
        (let ((p table))
          (while p
            (if (looking-at (caar p))
                (progn
                  (let ((b (match-beginning 0))
                        (e (match-end 0)))
                    (goto-char e)
                    (dolist (c (split-string (cdar p) "" t))
                      (self-insert-command 1 (string-to-char c)))
                    (delete-region b e)
                    (left-char)
                    (setq p nil)))
              (setq p (cdr p)))))
        (right-char)))
    (goto-char begm)))

