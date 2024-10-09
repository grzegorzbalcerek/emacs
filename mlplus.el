;;; -*- lexical-biding: t -*-

(provide 'mlplus)

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

(defun insert-span-inside-term()
  (interactive)
  (while (not (looking-back "<term")) (backward-char))
  (while (not (looking-at ">")) (forward-char))
  (forward-char)
  (save-excursion
    (insert "<span>")
    (while (not (looking-at "</term>")) (forward-char))
    (insert "</span>")))

(defun buffer-substring-until-end-of-word()
  (let ((end (save-excursion
               (re-search-forward "[ <]"))))
    (buffer-substring-no-properties (point) (- end 1))))

(defun extract-first-words-into-span()
  (interactive)
  (let ((str "<span>"))
    (save-excursion
      (while (not (looking-at "<[a-z][a-z]>")) (forward-char))
      (while (looking-at "<[a-z][a-z]>")
        (setq str (concat str (buffer-substring-no-properties (point) (+ 4 (point)))))
        (forward-char 4)
        (let ((w (buffer-substring-until-end-of-word)))
          (delete-char (length w))
          (if (looking-at " ") (delete-char 1))
          (setq str (concat str w)))
        (while (not (looking-at "</[a-z][a-z]>")) (forward-char))
        (setq str (concat str (buffer-substring-no-properties (point) (+ 5 (point)))))
        (forward-char 5)
        
      )
      )
    (setq str (concat str "</span>"))
    (insert str)
    ))

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
  (local-set-key (kbd "C-c 0") 'insert-span-inside-term)
  (local-set-key (kbd "C-c 1") 'extract-first-words-into-span)
  )

(add-hook 'mhtml-mode-hook 'xmlhtml-modes-customizations)
(add-hook 'nxml-mode-hook 'xmlhtml-modes-customizations)

(define-minor-mode passage-colors-minor-mode
  "Toggle set passage colors minor mode. When mode is enabled, certain letter keys add passage-level classes"
  nil
  " PassageColors"
  '(
    ("a" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fa")))
    ("b" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fb")))
    ("c" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fc")))
    ("d" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fd")))
    ("e" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fe")))
    ("f" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "ff")))
    ("g" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fg")))
    ("h" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fh")))
    ("i" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fi")))
    ("j" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fj")))
    ("k" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fk")))
    ("l" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fl")))
    ("m" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fm")))
    ("n" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fn")))
    ("o" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fo")))
    ("p" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fp")))
    ("q" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fq")))
    ("r" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fr")))
    ("s" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fs")))
    ("t" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "ft")))
    ("v" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fv")))
    ("w" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fw")))
    ("x" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fx")))
    ("y" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fy")))
    ("z" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" "fz")))
    (";" . (lambda()(interactive)(set-or-replace-term-or-span-class "pas" nil)))
    ("`" . (lambda()(interactive)(passage-colors-minor-mode -1)))
    ("=" . (lambda()(interactive)))
    ("]" . (lambda()(interactive)(passage-colors-minor-mode -1)(part-colors-minor-mode nil)))
    ("'" . (lambda()(interactive)(passage-colors-minor-mode -1)(piece-colors-minor-mode nil)))
    ("/" . (lambda()(interactive)(passage-colors-minor-mode -1)(segment-colors-minor-mode nil)))
    ))
(global-set-key (kbd "C-M-s-=") 'passage-colors-minor-mode)

(define-minor-mode part-colors-minor-mode
  "Toggle set part colors minor mode. When mode is enabled, certain letter keys add part-level classes"
  nil
  " PartColors"
  '(
    ("a" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fa")))
    ("b" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fb")))
    ("c" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fc")))
    ("d" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fd")))
    ("e" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fe")))
    ("f" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "ff")))
    ("g" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fg")))
    ("h" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fh")))
    ("i" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fi")))
    ("j" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fj")))
    ("k" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fk")))
    ("l" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fl")))
    ("m" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fm")))
    ("n" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fn")))
    ("o" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fo")))
    ("p" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fp")))
    ("q" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fq")))
    ("r" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fr")))
    ("s" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fs")))
    ("t" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "ft")))
    ("v" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fv")))
    ("w" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fw")))
    ("x" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fx")))
    ("y" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fy")))
    ("z" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fz")))
    (";" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" nil)))
    ("`" . (lambda()(interactive)(part-colors-minor-mode -1)))
    ("=" . (lambda()(interactive)(part-colors-minor-mode -1)(passage-colors-minor-mode nil)))
    ("]" . (lambda()(interactive)))
    ("'" . (lambda()(interactive)(part-colors-minor-mode -1)(piece-colors-minor-mode nil)))
    ("/" . (lambda()(interactive)(part-colors-minor-mode -1)(segment-colors-minor-mode nil)))
    ))
(global-set-key (kbd "C-M-s-]") 'part-colors-minor-mode)

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
    ("=" . (lambda()(interactive)(piece-colors-minor-mode -1)(passage-colors-minor-mode nil)))
    ("]" . (lambda()(interactive)(piece-colors-minor-mode -1)(part-colors-minor-mode nil)))
    ("'" . (lambda()(interactive)))
    ("/" . (lambda()(interactive)(piece-colors-minor-mode -1)(segment-colors-minor-mode nil)))
    ))
(global-set-key (kbd "C-M-s-'") 'piece-colors-minor-mode)

(define-minor-mode segment-colors-minor-mode
  "Toggle set segment colors minor mode. When mode is enabled, certain letter keys add segment-level classes"
  nil
  " SegmentColors"
  '(
    ("a" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fa")))
    ("b" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fb")))
    ("c" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fc")))
    ("d" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fd")))
    ("e" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fe")))
    ("f" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "ff")))
    ("g" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fg")))
    ("h" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fh")))
    ("i" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fi")))
    ("j" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fj")))
    ("k" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fk")))
    ("l" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fl")))
    ("m" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fm")))
    ("n" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fn")))
    ("o" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fo")))
    ("p" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fp")))
    ("q" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fq")))
    ("r" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fr")))
    ("s" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fs")))
    ("t" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "ft")))
    ("v" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fv")))
    ("w" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fw")))
    ("x" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fx")))
    ("y" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fy")))
    ("z" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" "fz")))
    (";" . (lambda()(interactive)(set-or-replace-term-or-span-class "seg" nil)))
    ("`" . (lambda()(interactive)(segment-colors-minor-mode -1)))
    ("=" . (lambda()(interactive)(segment-colors-minor-mode -1)(passage-colors-minor-mode nil)))
    ("]" . (lambda()(interactive)(segment-colors-minor-mode -1)(part-colors-minor-mode nil)))
    ("'" . (lambda()(interactive)(segment-colors-minor-mode -1)(piece-colors-minor-mode nil)))
    ("/" . (lambda()(interactive)))
    ))
(global-set-key (kbd "C-M-s-/") 'segment-colors-minor-mode)

