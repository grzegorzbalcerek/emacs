;;; -*- lexical-biding: t -*-

(provide 'rbsapp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                        Format                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


(defun rbsapp-split-tags(tag)
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

(define-minor-mode rbsapp-split-tags-mode
  "Toggle rbs skeletons minor mode."
  nil
  " RbsAppSplitTags"
  '(
    ("`" . (lambda()(interactive)(rbsapp-split-tags-mode -1)))
    ("a" . (lambda()(interactive)(rbsapp-split-tags "part")))
    ("d" . kill-whole-line)
    ("m" . (lambda()(interactive)(rbsapp-split-tags "member")))
    ("p" . (lambda()(interactive)(rbsapp-split-tags "piece")))
    ("q" . (lambda()(interactive)(rbsapp-split-tags-mode -1)))
    ("s" . (lambda()(interactive)(rbsapp-split-tags "segment")))
    ("t" . (lambda()(interactive)(rbsapp-split-tags "term")))
    ("u" . (lambda()(interactive)(rbsapp-split-tags "subpart")))
    ))
(global-set-key (kbd "C-c m s") 'rbsapp-split-tags-mode)

