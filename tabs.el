;;; -*- lexical-biding: t -*-

(defun set-tabs-times-n(n)
  "set the variable tab-stop-list at 2, 4 and then at n, n*2, n*3…"
  (interactive "p")
  (if (equal n 1)
      (error "Set the prefix to a value > 1"))
  (let ((new-tab-stop-list (list 2 4 n (* n 2)(* n 3)(* n 4)(* n 5)(* n 6)(* n 7)(* n 8)(* n 9)(* n 10)(* n 11)(* n 12)(* n 13)(* n 14))))
    (setq-local tab-stop-list new-tab-stop-list)
    (message "tab-stop-list set to %s" new-tab-stop-list)))
(global-set-key (kbd "<escape> <tab>") 'set-tabs-times-n)

(defun join-next-word()
 "Join next world by replacing multiple spaces with one space"
  (interactive)
  (replace-next-re " +" " "))
(global-set-key [C-tab] 'join-next-word)

