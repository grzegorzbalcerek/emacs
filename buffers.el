;;; -*- lexical-biding: t -*-

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

(defun intelligent-previous-buffer()
  (interactive)
  (intelligent-change-buffer 'previous-buffer))
(global-set-key (kbd "<C-M-s-left>") 'intelligent-previous-buffer)

(defun intelligent-next-buffer()
  (interactive)
  (intelligent-change-buffer 'next-buffer))
(global-set-key (kbd "<C-M-s-right>") 'intelligent-next-buffer)
