;;; -*- lexical-biding: t -*-

(provide 'ediffplus)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                            comparisons with libre office                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun prepare-ediff-emacs(beg end)
  "Save the text from region into a new buffer called *emacs* and fill paragraph"
  (interactive "r")
  (let ((msg
         (if (get-buffer "*emacs*")
             (progn
               (kill-buffer "*emacs*")
               "Previous buffer was killed")
           "")))
    (kill-ring-save-clean-whitespace beg end)
    (get-buffer-create "*emacs*")
    (set-buffer "*emacs*")
    (yank)
    (fill-paragraph)
    (message "Buffer *emacs* ready. %s" msg))
  (if (get-buffer "*other*")
      (ediff-buffers "*emacs*" "*other*")))
(global-set-key (kbd "C-c e") 'prepare-ediff-emacs)

(defun prepare-ediff-other()
  "Save the text from the clipboard into a new buffer called *other* and fill paragraph"
  (interactive)
  (let ((msg
         (if (get-buffer "*other*")
             (progn
               (kill-buffer "*other*")
               "Previous buffer was killed")
           "")))
    (get-buffer-create "*other*")
    (set-buffer "*other*")
    (yank)
    (fill-paragraph)
    (message "Buffer *other* ready. %s" msg))
  (if (get-buffer "*emacs*")
      (ediff-buffers "*emacs*" "*other*")))
(global-set-key (kbd "C-c o") 'prepare-ediff-other)

(defun start-ediff-emacs-other()
  (interactive)
  (ediff-buffers "*emacs*" "*other*"))
(global-set-key (kbd "C-c s") 'start-ediff-emacs-other)

(defun quit-ediff-buffers()
  (interactive)
  (kill-buffer "*emacs*")
  (kill-buffer "*other*")
  (delete-other-windows))
(global-set-key (kbd "C-c q") 'quit-ediff-buffers)
