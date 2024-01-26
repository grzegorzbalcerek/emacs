(defun move-line-down()
  (interactive)
  (next-line)
  (transpose-lines 1)
  (previous-line))

(defun move-line-up()
  (interactive)
  (next-line)
  (transpose-lines -1)
  (previous-line))

(defun duplicate-line()
  (interactive)
  (save-excursion
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))
    (goto-char (line-beginning-position 2))
    (yank))
  (next-line 1))

(defun copy-line()
  (interactive)
  (save-excursion
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))))

(global-set-key (kbd "<M-down>") 'move-line-down)
(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "<C-S-return>") 'duplicate-line)
(global-set-key (kbd "<C-M-S-backspace>") 'copy-line)
