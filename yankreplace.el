;;; -*- lexical-biding: t -*-

(provide 'yankreplace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             yank with replacing a region                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun yank-replace-region(beg end)
  "Replace region with the previous ring value"
  (interactive "r")
  (delete-region beg end)
  (let ((curr-buff (current-buffer))
        (temp-buff (generate-new-buffer "*yank-replace-deleteme*")))
    (set-buffer temp-buff)
    (yank 2)
    (let ((str (buffer-substring (point-min) (point-max))))
      (kill-buffer temp-buff)
      (set-buffer curr-buff)
      (insert str))))
(global-set-key (kbd "C-M-y") 'yank-replace-region)
(global-set-key [tool-bar isearch-forward] 'yank-replace-region)

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
