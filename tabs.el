

(defun set-tabs-times-n(n)
  "set the variable tab-stop-list at 2 and then at n, n*2, n*3…"
  (interactive "p")
  (let ((new-tab-stop-list (list 2 n (* n 2)(* n 3)(* n 4)(* n 5)(* n 6)(* n 7)(* n 8)(* n 9)(* n 10)(* n 11)(* n 12)(* n 13)(* n 14))))
    (setq-local tab-stop-list new-tab-stop-list)
    (message "tab-stop-list set to %s" new-tab-stop-list)))


(defun tab-fill-region(b e)
  "relocates pieces of text that are separated by at least 2 spaces
   accodring to the tab list"
  (interactive "r")
  (let ((beg (copy-marker b nil))
        (end (copy-marker e t)))
    (save-excursion
      (goto-char beg)
      (while (re-search-forward "  +\\| *\t+[ \t]*" end t)
        (replace-match "  ")
        (tab-to-tab-stop)))))


(defun join-next-word()
  (interactive)
  (replace-next-re " +" " "))


(global-set-key [C-tab] 'join-next-word)
(global-set-key [f8] 'tab-fill-region)
(global-set-key [C-f8] 'set-tabs-times-n)
