;;; -*- lexical-biding: t -*-

(provide 'rbsapp)

(defun rbsapp-convert(beg end)
  (interactive "r")
  (let ((e (copy-marker end)))
    (save-excursion
      (goto-char beg)
      (save-excursion (while (re-search-forward "[^\n]+" e t)(replace-match "<segment>\\&</segment>")))
      (save-excursion (while (re-search-forward "[^ <>\n]+[ ]+[^ <>\n]+[ ]+[^ <>\n]+[ ]+[^ <>\n]+[ ]+[^ <>\n]+[ ]+[^ <>\n]+" e t)(replace-match "<member>\\&</member>")))
      (save-excursion (while (re-search-forward "</member>\\([^<]+\\)</segment>" e t)(replace-match "\\1</member></segment>")))
      (save-excursion (while (re-search-forward "<segment><member>" e t)(replace-match "<segment>\n<member>")))
      (save-excursion (while (re-search-forward "</member></segment>" e t)(replace-match "</member>\n</segment>")))
      (save-excursion (while (re-search-forward "</member> <member>" e t)(replace-match "</member>\n<member>")))
      (save-excursion (while (re-search-forward "[0-9]+" e t)(replace-match "<verse>\\&</verse>")))
      (save-excursion (while (re-search-forward "\\([,.·;:()]*\\)\\([ΆΈ-ώἀ-ῼ]+\\)\\([,.·;:()]*\\)" e t)(replace-match "\\1<word><gr>\\2</gr><pl></pl></word>\\3" t)))
      (save-excursion (while (re-search-forward "</verse> +" e t)(replace-match "</verse>" t)))
      (save-excursion (while (re-search-forward "</word> +" e t)(replace-match "</word>" t)))
      (save-excursion (while (re-search-forward " +<word>" e t)(replace-match "<word>" t)))
      (save-excursion (while (re-search-forward "<member>" e t)(replace-match "<member><term>" t)))
      (save-excursion (while (re-search-forward "</member>" e t)(replace-match "</term></member>" t)))
      )))

(global-set-key (kbd "C-c r c") 'rbsapp-convert)
