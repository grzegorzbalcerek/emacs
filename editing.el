(defun delete-max-n-spaces(n)
  "delete at most n spaces"
  (while (> n 0)
    (when (looking-at " ") (delete-char 1))
    (setq n (- n 1))))

(defun delete-max-n-spaces-but-one(n)
  "delete at most n spaces but keep at least one space undeleted"
  (while (> n 0)
    (when (looking-at "  ") (delete-char 1))
    (setq n (- n 1))))

(defun back-delete-max-n-spaces(n)
  (while (> n 0)
    (when (looking-back " ") (delete-char -1))
    (setq n (- n 1))))

(defun rereplace(regex str)
  (goto-char (point-min))
  (while (re-search-forward regex nil t)
    (replace-match str)))

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

(defun ucode-to-char()
  (interactive)
  (set-mark-command nil)
  (search-backward-regexp "[^0-9a-fA-F]")
  (forward-char 1)
  (let ((v (buffer-substring (region-beginning)(region-end)))) 
    (kill-region(region-beginning)(region-end))
    (insert-char (string-to-number v 16))))

(setq buffer-names-to-skip
      '(
        "*Backtrace*"
        "*Buffer List*"
        "*Completions*"
        "*Quail Completions*"
        "*Flymake log*"
        "*Help*"
        "*Messages*"
        "*company-documentation*"
        "*compilation*"
        "*lsp-log*"
        "*ts-ls*"
        "*ts-ls::stderr*"
        ))

(defun intelligent-change-buffer(move-function)
       (let ((this-buffer-name (buffer-name(current-buffer))))
         (funcall move-function)
         (while (and
                 (not (equal this-buffer-name (buffer-name(current-buffer))))
                 (or
                  (member (buffer-name(current-buffer)) buffer-names-to-skip)
                  (equal major-mode 'dired-mode)))
           (funcall move-function))))

(defun intelligent-next-buffer()
  (interactive)
  (intelligent-change-buffer 'next-buffer))

(defun intelligent-previous-buffer()
  (interactive)
  (intelligent-change-buffer 'previous-buffer))

(defun yank-replace-region(beg end)
  (interactive "r")
  (delete-region beg end)
  (let ((curr-buff (current-buffer))
        (temp-buff (generate-new-buffer "*rbs-deleteme*")))
    (set-buffer temp-buff)
    (yank 2)
    (let ((str (buffer-substring (point-min) (point-max))))
      (kill-buffer temp-buff)
      (set-buffer curr-buff)
      (insert str))))

(defun polish-region(beg end)
  (interactive "r")
  (setq end (rereplace-with-bounds beg end " \"" " „"))
  (setq end (rereplace-with-bounds beg end "\" " "” "))
  (setq end (rereplace-with-bounds beg end "“" "„"))
  (setq end (rereplace-with-bounds beg end "«" "„"))
  (setq end (rereplace-with-bounds beg end "»" "”"))
  (setq end (rereplace-with-bounds beg end "'" "’"))
  )

(defun english-region(beg end)
  (interactive "r")
  (setq end (rereplace-with-bounds beg end " \"" " “"))
  (setq end (rereplace-with-bounds beg end "\" " "” "))
  (setq end (rereplace-with-bounds beg end "„" "“"))
  (setq end (rereplace-with-bounds beg end "«" "“"))
  (setq end (rereplace-with-bounds beg end "»" "”"))
  (setq end (rereplace-with-bounds beg end "'" "’"))
  (setq end (rereplace-with-bounds beg end "\\([0-9]\\),\\([0-9]\\)" "\\1:\\2"))
  )
