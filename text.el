
(defun replace-re(regex str beg end)
  "replaces regular expressions with a string within a region"
  (save-excursion
    (goto-char beg)
    (while (re-search-forward regex end t)
      (replace-match str))))

(defun replace-next-re(regex str)
  "replaces next regular expression found with a string"
  (if (re-search-forward regex (point-max) t)
      (replace-match str)))

