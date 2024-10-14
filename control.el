;;; -*- lexical-biding: t -*-

(provide 'control)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                      Global Keys                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-M-|") 'toggle-truncate-lines)
(global-set-key (kbd "M-o m") 'enriched-toggle-markup)

(global-set-key (kbd "s-j") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-s-j") 'mc/mark-all-like-this)
(global-set-key (kbd "S-s-j") 'mc/unmark-previous-like-this)

;(global-set-key (kbd "<M-left>") (lambda ()(interactive) (left-char (get-register ?h))))
;(global-set-key (kbd "<M-right>") (lambda ()(interactive) (right-char (get-register ?h))))

(global-set-key (kbd "C-c <left>") 'windmove-delete-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "<s-M-left>") 'windmove-left)
(global-set-key (kbd "<s-M-right>") 'windmove-right)
(global-set-key (kbd "<s-M-up>") 'windmove-up)
(global-set-key (kbd "<s-M-down>") 'windmove-down)
(global-set-key (kbd "<s-M-return>") 'other-window)

(global-set-key [f1] 'save-buffer)
;(global-set-key [f5] 'compile)
;(global-set-key [f6] 'recompile)
;(global-set-key [f7] 'previous-error)
;(global-set-key [f8] 'next-error)
(global-set-key [M-f8] 'edit-tab-stops)
(global-set-key [f9] 'delete-whitespace-rectangle)
(global-set-key [C-f9] 'delete-trailing-whitespace)
(global-set-key [f10] 'open-rectangle)
(global-set-key [f11] 'picture-mode)
(global-set-key [C-f11] 'picture-mode-exit)

(global-set-key (kbd "<M-insert>") 'delete-selection-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                        Buffers                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(global-set-key (kbd "<C-M-s-up>") (lambda()(interactive)(dired ".")))
(global-set-key (kbd "<C-M-s-down>") 'buffer-menu)
(global-set-key (kbd "<s-backspace>") (lambda()(interactive)(kill-buffer nil)))
(global-set-key [M-f4] (lambda()(interactive)(kill-buffer nil)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                      Scrolling                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar xscroll-horizontally-step 1)

(defun xscroll-right(n)
  (interactive "P")
  (if n (setq xscroll-horizontally-step n))
  (scroll-right xscroll-horizontally-step))
(global-set-key (kbd "<C-s-left>") 'xscroll-right)

(defun xscroll-left(n)
  (interactive "P")
  (if n (setq xscroll-horizontally-step n))
  (scroll-left xscroll-horizontally-step))
(global-set-key (kbd "<C-s-right>") 'xscroll-left)

(defvar xscroll-vertically-step 1)

(defun xscroll-up(n)
  (interactive "P")
  (if n (setq xscroll-vertically-step n))
  (scroll-up xscroll-vertically-step))
(global-set-key (kbd "<C-s-down>") 'xscroll-up)

(defun xscroll-down(n)
  (interactive "P")
  (if n (setq xscroll-vertically-step n))
  (scroll-down xscroll-vertically-step))
(global-set-key (kbd "<C-s-up>") 'xscroll-down)

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

