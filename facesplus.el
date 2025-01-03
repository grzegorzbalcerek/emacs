;;; -*- lexical-biding: t -*-

(provide 'facesplus)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   face definitions                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro def-face-fg (letter color)
  `(defface ,(intern (concat "f" letter)) '((t (:foreground ,color :weight bold))) (concat "foreground " ,color " bold")))

(defmacro def-face-bg (letter color)
  `(defface ,(intern (concat "f" letter)) '((t (:background ,color))) (concat "background " ,color)))

(def-face-fg "a" "#8000ff") ; F violet
(def-face-fg "b" "#0000ff") ; F blue
(def-face-fg "c" "#00eeee") ; F cyan (aqua)
(def-face-fg "d" "#00bfff") ; F deep blue sky
(def-face-fg "e" "#000080") ; F navy
(def-face-fg "f" "#009999") ; F teal
(def-face-fg "g" "#008000") ; F green
(def-face-fg "h" "#00ee00") ; F lime
(def-face-fg "i" "#808000") ; F olive
(def-face-fg "j" "#eeee00") ; F yellow
(def-face-fg "k" "#ffbc00") ; F gold
(def-face-fg "l" "#800000") ; F marron
(def-face-fg "m" "#ff00ff") ; F fuchsia/magenta
(def-face-fg "n" "#ff8080") ; F salmon
(def-face-fg "o" "#ff8000") ; F dark orange
(def-face-fg "p" "#ff80ff") ; F pink
(def-face-fg "q" "#808080") ; F gray
(def-face-fg "r" "#ff0000") ; F red
(def-face-bg "s" "#c0c0c0") ; B silver
(def-face-bg "t" "#8080ff") ; B white blue
(def-face-bg "u" "#80ffff") ; B white cyan (aqua)
(def-face-bg "v" "#80ff80") ; B white green
(def-face-bg "w" "#ffbc80") ; B white gold
(def-face-bg "x" "#ffff80") ; B white yellow
(def-face-bg "y" "#ffa0ff") ; B white pink
(def-face-bg "z" "#ffa0a0") ; B white red

(defface header1 '((t (:weight bold :height 1.15))) "weight bold height 1.15")
(defface header2 '((t (:weight bold :height 1.10))) "weight bold height 1.10")
(defface header3 '((t (:weight bold :height 1.05))) "weight bold height 1.05")
(defface grayheader1 '((t (:weight bold :height 1.15 :foreground "#bfbfbf"))) "weight bold height 1.15 foreground gray75")
(defface grayheader2 '((t (:weight bold :height 1.10 :foreground "#bfbfbf"))) "weight bold height 1.10 foreground gray75")
(defface grayheader3 '((t (:weight bold :height 1.05 :foreground "#bfbfbf"))) "weight bold height 1.05 foreground gray75")
(defface half '((t (:height 0.5))) "height 0.5")
(defface small '((t (:height 0.75))) "height 0.75")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                      list faces                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun list-face(name suffix)
  (insert name suffix)
  (facemenu-set-face (intern name) (- (point) (length name) (length suffix)) (point)))

(defun list-two-letter-face(prefix letter)
  (list-face (concat prefix letter) (concat " " prefix letter " " prefix letter)))

(defun list-f-face(letter)
  (interactive)
  (insert letter " ")
  (list-face (concat "f" letter) (concat " " letter letter letter letter))
  (insert " ")
  (insert (face-documentation (intern (concat "f" letter))))
  (insert "\n"))

(defun list-faces()
  (interactive)
  (switch-to-buffer "*FacesF*")
  (delete-region (point-min) (point-max))
  (list-face "header1" "  ") (list-face "grayheader1" "  ") (insert "\n")
  (list-face "header2" "  ") (list-face "grayheader3" "  ") (insert "\n")
  (list-face "header3" "  ") (list-face "grayheader2" "  ") (insert "\n")
  (list-face "small" "") (insert "\n")
  (list-face "half" "") (insert "\n")
  (dolist (letter (list "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"))
             (list-f-face letter)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   face translations                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq enriched-translations
      '((face
         (header1 "header1")(header2 "header2")(header3 "header3")
         (grayheader1 "grayheader1")(grayheader2 "grayheader2")(grayheader3 "grayheader3")
         (small "small")(half "half")
         (fa "fa")
         (fb "fb")
         (fc "fc")
         (fd "fd")
         (fe "fe")
         (ff "ff")
         (fg "fg")
         (fh "fh")
         (fi "fi")
         (fj "fj")
         (fk "fk")
         (fl "fl")
         (fm "fm")
         (fn "fn")
         (fo "fo")
         (fp "fp")
         (fq "fq")
         (fr "fr")
         (fs "fs")
         (ft "ft")
         (fu "fu")
         (fv "fv")
         (fw "fw")
         (fx "fx")
         (fy "fy")
         (fz "fz")
         (bold-italic "bold" "italic")
         (bold "bold")
         (italic "italic")
         (underline "underline")
         (fixed "fixed")
         (excerpt "excerpt")
         (default)
         (nil enriched-encode-other-face))
        (left-margin
         (4 "indent"))
        (right-margin
         (4 "indentright"))
        (justification
         (none "nofill")
         (right "flushright")
         (left "flushleft")
         (full "flushboth")
         (center "center"))
        (PARAMETER
         (t "param"))
        (FUNCTION
         (enriched-decode-foreground "x-color")
         (enriched-decode-background "x-bg-color")
         (enriched-decode-display-prop "x-display")
         (enriched-decode-charset "x-charset"))
        (read-only
         (t "x-read-only"))
        (display
         (nil enriched-handle-display-prop))
        (charset
         (nil enriched-handle-charset-prop))
        (unknown
         (nil format-annotate-value))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                    face functions                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
(defun show-face()
  (interactive)
  (message "face: %s" (get-text-property (point) 'face)))
(global-set-key (kbd "C-x _") 'show-face)

(defun defaultify-blanks-region(beg end)
  "set the default face for spaces and newlines in region"
  (interactive "r")
  (let ((begm (copy-marker beg nil))
        (endm (copy-marker end t)))
    (save-excursion
      (goto-char begm)
      (while (< (point) endm)
        (if (looking-at " [ \n]")
            (facemenu-set-face 'default (point) (+ 2 (point))))
        (right-char)))))
(global-set-key (kbd "M-o DEL") 'defaultify-blanks-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                      face keys                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "M-o 9") 'facemenu-set-invisible)
(global-set-key (kbd "M-o 0") 'facemenu-remove-special)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                    set face functions                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun set-face-region-or-word(face beg end)
  (interactive)
  (cond
   (mark-active
    (progn
      (facemenu-set-face face beg end)))
   ((and (looking-at "[ \n]") (looking-back " ")))
   (t
    (progn
      (save-excursion
        (if (looking-at "[.,;· \n]")
            (left-char 1))
        (forward-word 1)
        (let ((end (point)))
          (backward-word 1)
          (facemenu-set-face face (point) end)))))))

(global-set-key (kbd "M-s-o a") (lambda(b e)(interactive "r")(set-face-region-or-word 'fa b e)))
(global-set-key (kbd "M-s-o b") (lambda(b e)(interactive "r")(set-face-region-or-word 'fb b e)))
(global-set-key (kbd "M-s-o c") (lambda(b e)(interactive "r")(set-face-region-or-word 'fc b e)))
(global-set-key (kbd "M-s-o d") (lambda(b e)(interactive "r")(set-face-region-or-word 'fd b e)))
(global-set-key (kbd "M-s-o e") (lambda(b e)(interactive "r")(set-face-region-or-word 'fe b e)))
(global-set-key (kbd "M-s-o f") (lambda(b e)(interactive "r")(set-face-region-or-word 'ff b e)))
(global-set-key (kbd "M-s-o g") (lambda(b e)(interactive "r")(set-face-region-or-word 'fg b e)))
(global-set-key (kbd "M-s-o h") (lambda(b e)(interactive "r")(set-face-region-or-word 'fh b e)))
(global-set-key (kbd "M-s-o i") (lambda(b e)(interactive "r")(set-face-region-or-word 'fi b e)))
(global-set-key (kbd "M-s-o j") (lambda(b e)(interactive "r")(set-face-region-or-word 'fj b e)))
(global-set-key (kbd "M-s-o k") (lambda(b e)(interactive "r")(set-face-region-or-word 'fk b e)))
(global-set-key (kbd "M-s-o l") (lambda(b e)(interactive "r")(set-face-region-or-word 'fl b e)))
(global-set-key (kbd "M-s-o m") (lambda(b e)(interactive "r")(set-face-region-or-word 'fm b e)))
(global-set-key (kbd "M-s-o n") (lambda(b e)(interactive "r")(set-face-region-or-word 'fn b e)))
(global-set-key (kbd "M-s-o o") (lambda(b e)(interactive "r")(set-face-region-or-word 'fo b e)))
(global-set-key (kbd "M-s-o p") (lambda(b e)(interactive "r")(set-face-region-or-word 'fp b e)))
(global-set-key (kbd "M-s-o q") (lambda(b e)(interactive "r")(set-face-region-or-word 'fq b e)))
(global-set-key (kbd "M-s-o r") (lambda(b e)(interactive "r")(set-face-region-or-word 'fr b e)))
(global-set-key (kbd "M-s-o s") (lambda(b e)(interactive "r")(set-face-region-or-word 'fs b e)))
(global-set-key (kbd "M-s-o t") (lambda(b e)(interactive "r")(set-face-region-or-word 'ft b e)))
(global-set-key (kbd "M-s-o u") (lambda(b e)(interactive "r")(set-face-region-or-word 'fu b e)))
(global-set-key (kbd "M-s-o v") (lambda(b e)(interactive "r")(set-face-region-or-word 'fv b e)))
(global-set-key (kbd "M-s-o w") (lambda(b e)(interactive "r")(set-face-region-or-word 'fw b e)))
(global-set-key (kbd "M-s-o x") (lambda(b e)(interactive "r")(set-face-region-or-word 'fx b e)))
(global-set-key (kbd "M-s-o y") (lambda(b e)(interactive "r")(set-face-region-or-word 'fy b e)))
(global-set-key (kbd "M-s-o z") (lambda(b e)(interactive "r")(set-face-region-or-word 'fz b e)))

(defun set-face-region-or-row(face beg end)
  (interactive)
  (cond
   (mark-active
    (progn
      (facemenu-set-face face beg end)))
   ((and (looking-at "[ \n]") (looking-back " ")))
   (t
    (progn
      (facemenu-set-face face (line-beginning-position) (line-end-position))))))

(global-set-key (kbd "M-o 1") (lambda(b e)(interactive "r")(set-face-region-or-row 'header1 b e)))
(global-set-key (kbd "M-o 2") (lambda(b e)(interactive "r")(set-face-region-or-row 'header2 b e)))
(global-set-key (kbd "M-o 3") (lambda(b e)(interactive "r")(set-face-region-or-row 'header3 b e)))
(global-set-key (kbd "M-o !") (lambda(b e)(interactive "r")(set-face-region-or-row 'grayheader1 b e)))
(global-set-key (kbd "M-o @") (lambda(b e)(interactive "r")(set-face-region-or-row 'grayheader2 b e)))
(global-set-key (kbd "M-o #") (lambda(b e)(interactive "r")(set-face-region-or-row 'grayheader3 b e)))
(global-set-key (kbd "M-o 4") (lambda(b e)(interactive "r")(set-face-region-or-row 'small b e)))
(global-set-key (kbd "M-o 5") (lambda(b e)(interactive "r")(set-face-region-or-row 'half b e)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                                 set faces modes                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-minor-mode set-f-faces-minor-mode
  "Toggle set foreground faces minor mode. When mode is enabled, certain letter keys set foreground faces"
  nil
  " SetF"
  '(
    ("a" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fa b e)))
    ("b" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fb b e)))
    ("c" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fc b e)))
    ("d" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fd b e)))
    ("e" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fe b e)))
    ("f" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ff b e)))
    ("g" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fg b e)))
    ("h" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fh b e)))
    ("i" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fi b e)))
    ("j" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fj b e)))
    ("k" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fk b e)))
    ("l" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fl b e)))
    ("m" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fm b e)))
    ("n" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fn b e)))
    ("o" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fo b e)))
    ("p" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fp b e)))
    ("q" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fq b e)))
    ("r" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fr b e)))
    ("s" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fs b e)))
    ("t" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ft b e)))
    ("v" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fv b e)))
    ("w" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fw b e)))
    ("x" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fx b e)))
    ("y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fy b e)))
    ("z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fz b e)))
    ("[" . (lambda()(interactive)))
    (" " . (lambda()(interactive)(facemenu-set-default)))
    ("," . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
    ("/" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
    ("\\" . (lambda()(interactive)(set-f-faces-minor-mode -1)))
    )
  (if set-f-faces-minor-mode
      (set-face-background 'cursor "#ff00ff")
    (set-face-background 'cursor "black")))
(global-set-key (kbd "M-o f") 'set-f-faces-minor-mode)

