;;; -*- lexical-biding: t -*-

(provide 'htmlxmlplus)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                        Format                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun collapse-elem(tag)
  "Collapse elements and all markup between them"
  (goto-char (point-min))
  (let ((inelem nil))
    (while (< (point) (point-max))
      (cond
       ((and (not inelem) (looking-at (concat "<" tag)))
        (setq inelem t)
        (while (not (looking-at ">")) (forward-char 1)))
       ((and inelem (looking-at (concat "</" tag ">")))
        (setq inelem nil)
        (while (not (looking-at ">")) (forward-char 1)))
       ((and inelem (looking-back ">") (looking-at "[ \n]"))
        (delete-char 1))
       (t (forward-char 1))))))

(defun collapse-passages()
  (interactive)
  (collapse-elem "passage"))

(defun collapse-subparts()
  (interactive)
  (collapse-elem "subpart"))

(defun collapse-parts()
  (interactive)
  (collapse-elem "part"))

(defun collapse-pieces()
  (interactive)
  (collapse-elem "piece"))

(defun collapse-segments()
  (interactive)
  (collapse-elem "segment"))

(defun collapse-members()
  (interactive)
  (collapse-elem "member"))

(defun collapse-terms()
  (interactive)
  (collapse-elem "term"))

(defun xmllint-format-buffer(p)
  "Collapse members and all markup between them"
  (interactive "P")
  (let ((cmd "xmllint --format --encode utf-8 -"))
    (if p
        (shell-command-on-region (point-min) (point-max) cmd t "*err*")
      (shell-command-on-region (point-min) (point-max) cmd))))

(defun xmlhtml-modes-customizations()
  (interactive)
  (message "xmlhtml-modes-customizations")
  (local-set-key (kbd "C-c f") 'xmllint-format-buffer)
  (local-set-key (kbd "C-c p") 'collapse-passages)
  (local-set-key (kbd "C-c r") 'collapse-parts)
  (local-set-key (kbd "C-c q") 'collapse-subparts)
  (local-set-key (kbd "C-c i") 'collapse-pieces)
  (local-set-key (kbd "C-c s") 'collapse-segments)
  (local-set-key (kbd "C-c m") 'collapse-members)
  (local-set-key (kbd "C-c t") 'collapse-terms)
  )

(add-hook 'mhtml-mode-hook 'xmlhtml-modes-customizations)
(add-hook 'nxml-mode-hook 'xmlhtml-modes-customizations)
