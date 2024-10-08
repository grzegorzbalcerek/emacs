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

(defun set-or-replace-term-or-span-class(lvl color)
  "Find the beginning of a tag, skip it,
   find the class attribute or add it,
   remove any lvl attribute value if any,
   add the lvl plus color attribute value if color is not nil"
  (while (not (looking-at "<term\\|<span")) (backward-char))
  (if (looking-at "<term\\|<span")
      (progn
        (forward-word)
        (while (not (looking-at " class=\\|>")) (forward-char))
        (if (looking-at ">")
            (progn (insert " class=\"\"") (backward-char))
          (forward-char 8))
        (while (not (looking-at "['\"]"))
          (cond
           ((looking-at (concat lvl "[a-z][a-z][ '\"]"))
            (delete-char 5))
           ((looking-at "  ")
            (delete-char 1))
           (t (forward-char))))
        (while (looking-back " ") (delete-char -1))
        (if color
            (progn
              (if (not (looking-back "['\"]")) (insert " "))
              (insert lvl color))))))

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

(define-minor-mode piece-colors-minor-mode
  "Toggle set piece colors minor mode. When mode is enabled, certain letter keys add piece-level classes"
  nil
  " PieceColors"
  '(
    ("a" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fa")))
    ("b" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fb")))
    ("c" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fc")))
    ("d" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fd")))
    ("e" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fe")))
    ("f" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "ff")))
    ("g" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fg")))
    ("h" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fh")))
    ("i" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fi")))
    ("j" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fj")))
    ("k" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fk")))
    ("l" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fl")))
    ("m" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fm")))
    ("n" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fn")))
    ("o" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fo")))
    ("p" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fp")))
    ("q" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fq")))
    ("r" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fr")))
    ("s" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fs")))
    ("t" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "ft")))
    ("v" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fv")))
    ("w" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fw")))
    ("x" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fx")))
    ("y" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fy")))
    ("z" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" "fz")))
    (";" . (lambda()(interactive)(set-or-replace-term-or-span-class "pie" nil)))
    ("`" . (lambda()(interactive)(piece-colors-minor-mode -1)))
    ))
(global-set-key (kbd "C-M-s-'") 'piece-colors-minor-mode)
