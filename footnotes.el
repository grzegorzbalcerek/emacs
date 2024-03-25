;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                      footnotes                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun replace-with-consecutive-sup-numbers(regex-before regex-after)
  "replaces footnotes consecutive numbers starting with 1"
  (save-excursion
    (let ((regex (concat regex-before "\\([¹²³⁴⁵⁶⁷⁸⁹⁰]+\\)" regex-after))
          (n 1))
      (goto-char (point-min))
      (while (re-search-forward regex (point-max) t)
        (let ((rep
               (string-replace
                "0" "⁰"
                (string-replace
                 "1" "¹"
                 (string-replace
                  "2" "²"
                  (string-replace
                   "3" "³"
                   (string-replace
                    "4" "⁴"
                    (string-replace
                     "5" "⁵"
                     (string-replace
                      "6" "⁶"
                      (string-replace
                       "7" "⁷"
                       (string-replace
                        "8" "⁸"
                        (string-replace
                         "9" "⁹"
                         (format "%d" n)))))))))))))
          (replace-match rep nil nil nil 1)
          (setq n (1+ n))
          )))))

(defun renumber-footnotes()
  (interactive)
  "Number footnotes in the document starting with 1"
  (replace-with-consecutive-sup-numbers "^" " ")
  (replace-with-consecutive-sup-numbers "[^¹²³⁴⁵⁶⁷⁸⁹⁰]" "\\($\\|[^¹²³⁴⁵⁶⁷⁸⁹⁰ ]\\)"))

(defun next-footnote()
  (interactive)
  "Find next footnote"
  (search-forward-regexp "[^¹²³⁴⁵⁶⁷⁸⁹⁰]+"))

(defun previous-footnote()
  (interactive)
  "Find previous footnote"
  (search-backward-regexp "[^¹²³⁴⁵⁶⁷⁸⁹⁰]+"))

(global-set-key (kbd "C-c ! r") 'renumber-footnotes)
(global-set-key (kbd "C-c ! n") 'next-footnote)
(global-set-key (kbd "C-c ! p") 'previous-footnote)
