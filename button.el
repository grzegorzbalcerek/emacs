;;; -*- lexical-biding: t -*-

(global-set-key [C-f1] (lambda(b e)(interactive "r")(make-button b e 'face 'eww-form-submit 'action 'org-clock-in)))
