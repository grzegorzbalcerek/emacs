
(defvar xscroll-horizontally-step 1)

(defun xscroll-right(n)
  (interactive "P")
  (if n (setq xscroll-horizontally-step n))
  (scroll-right xscroll-horizontally-step))
(global-set-key (kbd "<C-M-s-left>") 'xscroll-right)

(defun xscroll-left(n)
  (interactive "P")
  (if n (setq xscroll-horizontally-step n))
  (scroll-left xscroll-horizontally-step))
(global-set-key (kbd "<C-M-s-right>") 'xscroll-left)

(defvar xscroll-vertically-step 1)

(defun xscroll-up(n)
  (interactive "P")
  (if n (setq xscroll-horizontally-step n))
  (scroll-up xscroll-horizontally-step))
(global-set-key (kbd "<C-M-s-down>") 'xscroll-up)

(defun xscroll-down(n)
  (interactive "P")
  (if n (setq xscroll-horizontally-step n))
  (scroll-down xscroll-horizontally-step))
(global-set-key (kbd "<C-M-s-up>") 'xscroll-down)
