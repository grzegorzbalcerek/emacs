;;; -*- lexical-biding: t -*-

(provide 'rbsapp)

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

(defun nxml-indent-buffer()
  "Indent the whole buffer"
  (interactive)
  (goto-char (point-min))
  (while (< (point) (point-max))
    (nxml-indent-line)
    (next-line)))
(global-set-key (kbd "C-c r i") 'nxml-indent-buffer)

(define-skeleton comment-around "Inserts around: comment" nil "<!-- " _ " -->")
(define-skeleton tag-around-en "Inserts tag around: en" nil "<en>" _ "</en>")
(define-skeleton tag-around-fr "Inserts tag around: fr" nil "<fr>" _ "</fr>")
(define-skeleton tag-around-gr "Inserts tag around: gr" nil "<gr>" _ "</gr>")
(define-skeleton tag-around-member "Inserts tag around: member" nil "<member>" _ "</member>")
(define-skeleton tag-around-pl "Inserts tag around: pl" nil "<pl>" _ "</pl>")
(define-skeleton tag-around-segment "Inserts tag around: segment" nil "<segment>" _ "</segment>")
(define-skeleton tag-around-span "Inserts tag around: span" nil "<span>" _ "</span>")
(define-skeleton tag-around-term "Inserts tag around: term" nil "<term>" _ "</term>")
(define-skeleton tag-around-verse "Inserts tag around: verse" nil "<verse>" _ "</verse>")

(define-skeleton tag-insert-en "Inserts tags closing and opening: en" nil "</en><en>")
(define-skeleton tag-insert-fr "Inserts tags closing and opening: fr" nil "</fr><fr>")
(define-skeleton tag-insert-gr "Inserts tags closing and opening: gr" nil "</gr><gr>")
(define-skeleton tag-insert-member "Inserts tags closing and opening: member" nil "</member><member>")
(define-skeleton tag-insert-pl "Inserts tags closing and opening: pl" nil "</pl><pl>")
(define-skeleton tag-insert-segment "Inserts tags closing and opening: segment" nil "</segment><segment>")
(define-skeleton tag-insert-span "Inserts tags closing and opening: span" nil "</span><span>")
(define-skeleton tag-insert-term "Inserts tags closing and opening: term" nil "</term><term>")
(define-skeleton tag-insert-verse "Inserts tags closing and opening: verse" nil "</verse><verse>")


(defun rbsapp-text-to-xml(beg end)
  (interactive "r")
  (let ((e (copy-marker end)))
    (save-excursion
      (goto-char beg)
      (save-excursion (while (re-search-forward "[^\n]+" e t)(replace-match "<member>\\&</member>")))
      (save-excursion (while (re-search-forward "[0-9]+" e t)(replace-match "<verse>\\&</verse>")))
      (save-excursion (while (re-search-forward "\\([,.·;:()]*\\)\\([ΆΈ-ώἀ-ῼ’]+\\)\\([,.·;:()]*\\)" e t)(replace-match "<span>\\1</span><word><gr>\\2</gr><pl></pl></word><span>\\3</span>" t)))
      (save-excursion (while (re-search-forward "<span></span>" e t)(replace-match "" t)))
      (save-excursion (while (re-search-forward "</verse> +" e t)(replace-match "</verse>" t)))
      (save-excursion (while (re-search-forward "</word> +" e t)(replace-match "</word>" t)))
      (save-excursion (while (re-search-forward " +<word>" e t)(replace-match "<word>" t)))
      (save-excursion (while (re-search-forward "<member>" e t)(replace-match "<member><term>" t)))
      (save-excursion (while (re-search-forward "</member>" e t)(replace-match "</term></member>" t)))
      )))

(global-set-key (kbd "C-c r t") 'rbsapp-text-to-xml)

(defun rbsapp-split-xml-elements(beg end)
  (interactive "r")
  (let ((e (copy-marker end)))
    (save-excursion
      (goto-char beg)
      (save-excursion (while (re-search-forward "><\\(passage\\|part\\|subpart\\|piece\\|segment\\|member\\|term\\|word\\|verse\\|span\\)" e t)(replace-match ">\n<\\1")))
      (save-excursion (while (re-search-forward "></\\(passage\\|part\\|subpart\\|piece\\|segment\\|member\\|term\\)>" e t)(replace-match ">\n</\\1>")))
      )))

(global-set-key (kbd "C-c r s") 'rbsapp-split-xml-elements)

(define-minor-mode rbs-skeletons-minor-mode
  "Toggle rbs skeletons minor mode."
  nil
  " RbsSkeletons"
  '(
    ("e" . insert-tag-en)
    ("f" . insert-tag-fr)
    ("g" . insert-tag-gr)
    ("m" . insert-tag-member)
    ("p" . insert-tag-pl)
    ("n" . insert-tag-span)
    ("s" . insert-tag-segment)
    ("t" . insert-tag-term)
    ("v" . insert-tag-verse)
    ("c" . insert-comment)
    ("G" . insert-term-span-gr)
    ("`" . (lambda()(interactive)(rbs-skeletons-minor-mode -1)))
    ))
(global-set-key (kbd "C-c m k") 'rbs-skeletons-minor-mode)
(defun insert-split-tags(tag)
  (interactive)
  (message "insert-split-tags")
  (previous-line)
  (move-end-of-line 1)
  (insert "\n")
  (insert "</" tag ">")
  (indent-for-tab-command)
  (insert "\n")
  (insert "<" tag ">")
  (indent-for-tab-command)
  )

(defun insert-split-tags-term() (interactive) (insert-split-tags "term"))
(defun insert-split-tags-member() (interactive) (insert-split-tags "member"))
(defun insert-split-tags-segment() (interactive) (insert-split-tags "segment"))
(defun insert-split-tags-piece() (interactive) (insert-split-tags "piece"))
(defun insert-split-tags-subpart() (interactive) (insert-split-tags "subpart"))
(defun insert-split-tags-part() (interactive) (insert-split-tags "part"))


(define-minor-mode rbsapp-split-tags-mode
  "Toggle rbs skeletons minor mode."
  nil
  " RbsAppSplitTags"
  '(
    ("`" . (lambda()(interactive)(rbsapp-split-tags-mode -1)))
    ("a" . insert-split-tags-part)
    ("d" . kill-whole-line)
    ("m" . insert-split-tags-member)
    ("p" . insert-split-tags-piece)
    ("q" . (lambda()(interactive)(rbsapp-split-tags-mode -1)))
    ("s" . insert-split-tags-segment)
    ("t" . insert-split-tags-term)
    ("u" . insert-split-tags-subpart)
    ))
(global-set-key (kbd "C-c m s") 'rbsapp-split-tags-mode)

(defun xmlhtml-modes-customizations()
  (interactive)
  (message "xmlhtml-modes-customizations")
  (local-set-key (kbd "C-c f") 'xmllint-format-buffer)
  (local-set-key (kbd "C-c c p") 'collapse-passages)
  (local-set-key (kbd "C-c c r") 'collapse-parts)
  (local-set-key (kbd "C-c c q") 'collapse-subparts)
  (local-set-key (kbd "C-c c i") 'collapse-pieces)
  (local-set-key (kbd "C-c c s") 'collapse-segments)
  (local-set-key (kbd "C-c c m") 'collapse-members)
  (local-set-key (kbd "C-c c t") 'collapse-terms)
  (local-set-key (kbd "C-c a c") 'comment-around)
  (local-set-key (kbd "C-c a e") 'tag-around-en)
  (local-set-key (kbd "C-c a f") 'tag-around-fr)
  (local-set-key (kbd "C-c a g") 'tag-around-gr)
  (local-set-key (kbd "C-c a m") 'tag-around-member)
  (local-set-key (kbd "C-c a p") 'tag-around-pl)
  (local-set-key (kbd "C-c a n") 'tag-around-span)
  (local-set-key (kbd "C-c a s") 'tag-around-segment)
  (local-set-key (kbd "C-c a t") 'tag-around-term)
  (local-set-key (kbd "C-c a v") 'tag-around-verse)
  (local-set-key (kbd "C-c i e") 'tag-insert-en)
  (local-set-key (kbd "C-c i f") 'tag-insert-fr)
  (local-set-key (kbd "C-c i g") 'tag-insert-gr)
  (local-set-key (kbd "C-c i m") 'tag-insert-member)
  (local-set-key (kbd "C-c i p") 'tag-insert-pl)
  (local-set-key (kbd "C-c i n") 'tag-insert-span)
  (local-set-key (kbd "C-c i s") 'tag-insert-segment)
  (local-set-key (kbd "C-c i t") 'tag-insert-term)
  (local-set-key (kbd "C-c i v") 'tag-insert-verse)
  (local-set-key (kbd "C-c s t") 'insert-split-tags-term)
  (local-set-key (kbd "C-c s m") 'insert-split-tags-member)
  (local-set-key (kbd "C-c s s") 'insert-split-tags-segment)
  (local-set-key (kbd "C-c s x") 'rbsapp-split-xml-elements)
  (local-set-key (kbd "C-c 0") 'insert-span-inside-term)
  (local-set-key (kbd "C-c 1") 'extract-first-words-into-span)
  (local-set-key (kbd "C-c SPC") (lambda()(interactive)(insert "&#32;")))
  (local-set-key (kbd "C-c m s") 'rbsapp-split-tags-mode)
  (local-set-key (kbd "C-c m k") 'rbs-skeletons-minor-mode)
  (local-set-key [tab] 'indent-for-tab-command)
  )

(add-hook 'mhtml-mode-hook 'xmlhtml-modes-customizations)
(add-hook 'nxml-mode-hook 'xmlhtml-modes-customizations)
