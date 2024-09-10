;;; -*- lexical-biding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               Moving and copying lines                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun move-line-down()
  (interactive)
  (next-line)
  (transpose-lines 1)
  (previous-line))
(global-set-key (kbd "<M-down>") 'move-line-down)

(defun move-line-up()
  (interactive)
  (next-line)
  (transpose-lines -1)
  (previous-line))
(global-set-key (kbd "<M-up>") 'move-line-up)

(defun insert-line-below()
  (interactive)
  (save-excursion
    (move-end-of-line 1)
    (insert "\n")))
(global-set-key (kbd "<M-S-up>") 'insert-line-below)

(defun insert-line-above()
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (insert "\n")))
(global-set-key (kbd "<M-S-down>") 'insert-line-above)

(defun duplicate-line()
  (interactive)
  (save-excursion
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))
    (goto-char (line-beginning-position 2))
    (yank))
  (next-line 1))
(global-set-key (kbd "<C-S-return>") 'duplicate-line)

(defun copy-line()
  (interactive)
  (save-excursion
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))))
(global-set-key (kbd "<C-M-S-backspace>") 'copy-line)

