;;; -*- lexical-biding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   face definitions                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro def-four-faces (letter fg-color bg-color name)
  `(progn
     (defface ,(intern (concat "b" letter)) '((t (:background ,bg-color))) (concat "background " ,name))
     (defface ,(intern (concat "f" letter)) '((t (:foreground ,fg-color :weight bold))) (concat "foreground " ,name))
     (defface ,(intern (concat "u" letter)) '((t (:underline ,fg-color))) (concat "underline " ,name))
     (defface ,(intern (concat "x" letter)) '((t (:box (:line-width (-2 . -2) :color ,fg-color)))) (concat "box " ,name))
     ))

;; b background ;; f foreground ;; q quit ;; u underline ;; x box
(def-four-faces "a" "#00ffff" "#00ffff" "aqua")
(def-four-faces "c" "#0000ff" "#6060ff" "blue")
(def-four-faces "e" "#6495ed" "#6495ed" "cornflower blue")
(def-four-faces "g" "#008000" "#00c000" "green")
(def-four-faces "h" "#ffd700" "#ffd700" "gold")
(def-four-faces "i" "#808000" "#bfbf00" "olive")
(def-four-faces "j" "#ff00ff" "#ff00ff" "fuchsia")
(def-four-faces "k" "#7fffd4" "#7fffd4" "aquamarine")
(def-four-faces "l" "#00ff00" "#00ff00" "lime")
(def-four-faces "m" "#bfbfbf" "#bfbfbf" "gray")
;(def-four-faces "n" "#f4a460" "#f4a460" "sandybrown")
(def-four-faces "n" "#deb887" "#deb887" "burlywood")
(def-four-faces "o" "#ff8000" "#ff8000" "orange")
(def-four-faces "p" "#ff80ff" "#ff80ff" "pink")
(def-four-faces "r" "#ff0000" "#ff6868" "red")
(def-four-faces "s" "#0080ff" "#00a0ff" "sky blue")
(def-four-faces "t" "#008080" "#00bfbf" "teal")
(def-four-faces "w" "#800000" "#c07070" "brown")
(def-four-faces "v" "#8000ff" "#b000ff" "violet")
(def-four-faces "y" "#ffff00" "#ffff60" "yellow")
(def-four-faces "z" "#000000" "#000000" "black")

(defface bnil '((t (:background unspecified))) "background nil")
(defface fnil '((t (:foreground unspecified :weight normal))) "foreground nil")
(defface unil '((t (:underline unspecified))) "underline nil")
(defface xnil '((t (:box nil))) "box nil")

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

(defun list-four-faces(letter)
  (interactive)
  (insert letter " ")
  (list-two-letter-face "b" letter) (insert "  ")
  (list-two-letter-face "f" letter) (insert "  ")
  (list-two-letter-face "u" letter) (insert "  ")
  (list-two-letter-face "x" letter) (insert "  ")
  (insert (substring (face-documentation (intern (concat "x" letter))) 4))
  (insert "\n"))

(defun list-faces()
  (interactive)
  (switch-to-buffer "*FacesFour*")
  (delete-region (point-min) (point-max))
  (list-face "header1" "  ") (list-face "grayheader1" "  ") (insert "\n")
  (list-face "header2" "  ") (list-face "grayheader3" "  ") (insert "\n")
  (list-face "header3" "  ") (list-face "grayheader2" "  ") (insert "\n")
  (list-face "small" "") (insert "\n")
  (list-face "half" "") (insert "\n")
  (dolist (letter (list "a" "c" "e" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "r" "s" "t" "w" "v" "y" "z"))
             (list-four-faces letter)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   face translations                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq enriched-translations
      '((face
         (header1 "header1")(header2 "header2")(header3 "header3")
         (grayheader1 "grayheader1")(grayheader2 "grayheader2")(grayheader3 "grayheader3")
         (small "small")(half "half")
         (ba "ba")(fa "fa")(ua "ua")(xa "xa")
         (bc "bc")(fc "fc")(uc "uc")(xc "xc")
         (be "be")(fe "fe")(ue "ue")(xe "xe")
         (bg "bg")(fg "fg")(ug "ug")(xg "xg")
         (bh "bh")(fh "fh")(uh "uh")(xh "xh")
         (bi "bi")(fi "fi")(ui "ui")(xi "xi")
         (bj "bj")(fj "fj")(uj "uj")(xj "xj")
         (bk "bk")(fk "fk")(uk "uk")(xk "xk")
         (bl "bl")(fl "fl")(ul "ul")(xl "xl")
         (bm "bm")(fm "fm")(um "um")(xm "xm")
         (bn "bn")(fn "fn")(un "un")(xn "xn")
         (bo "bo")(fo "fo")(uo "uo")(xo "xo")
         (bp "bp")(fp "fp")(up "up")(xp "xp")
         (br "br")(fr "fr")(ur "ur")(xr "xr")
         (bs "bs")(fs "fs")(us "us")(xs "xs")
         (bt "bt")(ft "ft")(ut "ut")(xt "xt")
         (bw "bw")(fw "fw")(uw "uw")(xw "xw")
         (bv "bv")(fv "fv")(uv "uv")(xv "xv")
         (by "by")(fy "fy")(uy "uy")(xy "xy")
         (bz "bz")(fz "fz")(uz "uz")(xz "xz")
         (bnil "bnil")(fnil "fnil")(unil "unil")(xnil "xnil")
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    face functions                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                      face keys                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "M-o 9") 'facemenu-set-invisible)
(global-set-key (kbd "M-o 0") 'facemenu-remove-special)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    set face functions                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(global-set-key (kbd "M-o M-b a") (lambda(b e)(interactive "r")(set-face-region-or-word 'ba b e)))
                                        ; b background
(global-set-key (kbd "M-o M-b c") (lambda(b e)(interactive "r")(set-face-region-or-word 'bc b e)))
                                        ; d default
(global-set-key (kbd "M-o M-b e") (lambda(b e)(interactive "r")(set-face-region-or-word 'be b e)))
                                        ; f foreground
(global-set-key (kbd "M-o M-b g") (lambda(b e)(interactive "r")(set-face-region-or-word 'bg b e)))
(global-set-key (kbd "M-o M-b h") (lambda(b e)(interactive "r")(set-face-region-or-word 'bh b e)))
(global-set-key (kbd "M-o M-b i") (lambda(b e)(interactive "r")(set-face-region-or-word 'bi b e)))
(global-set-key (kbd "M-o M-b j") (lambda(b e)(interactive "r")(set-face-region-or-word 'bj b e)))
(global-set-key (kbd "M-o M-b k") (lambda(b e)(interactive "r")(set-face-region-or-word 'bk b e)))
(global-set-key (kbd "M-o M-b l") (lambda(b e)(interactive "r")(set-face-region-or-word 'bl b e)))
(global-set-key (kbd "M-o M-b m") (lambda(b e)(interactive "r")(set-face-region-or-word 'bm b e)))
(global-set-key (kbd "M-o M-b n") (lambda(b e)(interactive "r")(set-face-region-or-word 'bn b e)))
(global-set-key (kbd "M-o M-b o") (lambda(b e)(interactive "r")(set-face-region-or-word 'bo b e)))
(global-set-key (kbd "M-o M-b p") (lambda(b e)(interactive "r")(set-face-region-or-word 'bp b e)))
                                        ; q quit
(global-set-key (kbd "M-o M-b r") (lambda(b e)(interactive "r")(set-face-region-or-word 'br b e)))
(global-set-key (kbd "M-o M-b s") (lambda(b e)(interactive "r")(set-face-region-or-word 'bs b e)))
(global-set-key (kbd "M-o M-b t") (lambda(b e)(interactive "r")(set-face-region-or-word 'bt b e)))
                                        ; u underline
(global-set-key (kbd "M-o M-b w") (lambda(b e)(interactive "r")(set-face-region-or-word 'bw b e)))
(global-set-key (kbd "M-o M-b v") (lambda(b e)(interactive "r")(set-face-region-or-word 'bv b e)))
                                        ; x box
(global-set-key (kbd "M-o M-b y") (lambda(b e)(interactive "r")(set-face-region-or-word 'by b e)))
(global-set-key (kbd "M-o M-b z") (lambda(b e)(interactive "r")(set-face-region-or-word 'bz b e)))
(global-set-key (kbd "M-o M-b .") (lambda(b e)(interactive "r")(set-face-region-or-word 'bnil b e)))


(global-set-key (kbd "M-o M-f a") (lambda(b e)(interactive "r")(set-face-region-or-word 'fa b e)))
                                        ; b background
(global-set-key (kbd "M-o M-f c") (lambda(b e)(interactive "r")(set-face-region-or-word 'fc b e)))
                                        ; d default
(global-set-key (kbd "M-o M-f e") (lambda(b e)(interactive "r")(set-face-region-or-word 'fe b e)))
                                        ; f foreground
(global-set-key (kbd "M-o M-f g") (lambda(b e)(interactive "r")(set-face-region-or-word 'fg b e)))
(global-set-key (kbd "M-o M-f h") (lambda(b e)(interactive "r")(set-face-region-or-word 'fh b e)))
(global-set-key (kbd "M-o M-f i") (lambda(b e)(interactive "r")(set-face-region-or-word 'fi b e)))
(global-set-key (kbd "M-o M-f j") (lambda(b e)(interactive "r")(set-face-region-or-word 'fj b e)))
(global-set-key (kbd "M-o M-f k") (lambda(b e)(interactive "r")(set-face-region-or-word 'fk b e)))
(global-set-key (kbd "M-o M-f l") (lambda(b e)(interactive "r")(set-face-region-or-word 'fl b e)))
(global-set-key (kbd "M-o M-f m") (lambda(b e)(interactive "r")(set-face-region-or-word 'fm b e)))
(global-set-key (kbd "M-o M-f n") (lambda(b e)(interactive "r")(set-face-region-or-word 'fn b e)))
(global-set-key (kbd "M-o M-f o") (lambda(b e)(interactive "r")(set-face-region-or-word 'fo b e)))
(global-set-key (kbd "M-o M-f p") (lambda(b e)(interactive "r")(set-face-region-or-word 'fp b e)))
                                        ; q quit
(global-set-key (kbd "M-o M-f r") (lambda(b e)(interactive "r")(set-face-region-or-word 'fr b e)))
(global-set-key (kbd "M-o M-f s") (lambda(b e)(interactive "r")(set-face-region-or-word 'fs b e)))
(global-set-key (kbd "M-o M-f t") (lambda(b e)(interactive "r")(set-face-region-or-word 'ft b e)))
                                        ; u underline
(global-set-key (kbd "M-o M-f w") (lambda(b e)(interactive "r")(set-face-region-or-word 'fw b e)))
(global-set-key (kbd "M-o M-f v") (lambda(b e)(interactive "r")(set-face-region-or-word 'fv b e)))
                                        ; x box
(global-set-key (kbd "M-o M-f y") (lambda(b e)(interactive "r")(set-face-region-or-word 'fy b e)))
(global-set-key (kbd "M-o M-f z") (lambda(b e)(interactive "r")(set-face-region-or-word 'fz b e)))
(global-set-key (kbd "M-o M-f .") (lambda(b e)(interactive "r")(set-face-region-or-word 'fnil b e)))


(global-set-key (kbd "M-o M-u a") (lambda(b e)(interactive "r")(set-face-region-or-word 'ua b e)))
                                        ; b background
(global-set-key (kbd "M-o M-u c") (lambda(b e)(interactive "r")(set-face-region-or-word 'uc b e)))
                                        ; d default
(global-set-key (kbd "M-o M-u e") (lambda(b e)(interactive "r")(set-face-region-or-word 'ue b e)))
                                        ; f foreground
(global-set-key (kbd "M-o M-u g") (lambda(b e)(interactive "r")(set-face-region-or-word 'ug b e)))
(global-set-key (kbd "M-o M-u h") (lambda(b e)(interactive "r")(set-face-region-or-word 'uh b e)))
(global-set-key (kbd "M-o M-u i") (lambda(b e)(interactive "r")(set-face-region-or-word 'ui b e)))
(global-set-key (kbd "M-o M-u j") (lambda(b e)(interactive "r")(set-face-region-or-word 'uj b e)))
(global-set-key (kbd "M-o M-u k") (lambda(b e)(interactive "r")(set-face-region-or-word 'uk b e)))
(global-set-key (kbd "M-o M-u l") (lambda(b e)(interactive "r")(set-face-region-or-word 'ul b e)))
(global-set-key (kbd "M-o M-u m") (lambda(b e)(interactive "r")(set-face-region-or-word 'um b e)))
(global-set-key (kbd "M-o M-u n") (lambda(b e)(interactive "r")(set-face-region-or-word 'un b e)))
(global-set-key (kbd "M-o M-u o") (lambda(b e)(interactive "r")(set-face-region-or-word 'uo b e)))
(global-set-key (kbd "M-o M-u p") (lambda(b e)(interactive "r")(set-face-region-or-word 'up b e)))
                                        ; q quit
(global-set-key (kbd "M-o M-u r") (lambda(b e)(interactive "r")(set-face-region-or-word 'ur b e)))
(global-set-key (kbd "M-o M-u s") (lambda(b e)(interactive "r")(set-face-region-or-word 'us b e)))
(global-set-key (kbd "M-o M-u t") (lambda(b e)(interactive "r")(set-face-region-or-word 'ut b e)))
                                        ; u underline
(global-set-key (kbd "M-o M-u w") (lambda(b e)(interactive "r")(set-face-region-or-word 'uw b e)))
(global-set-key (kbd "M-o M-u v") (lambda(b e)(interactive "r")(set-face-region-or-word 'uv b e)))
                                        ; x box
(global-set-key (kbd "M-o M-u y") (lambda(b e)(interactive "r")(set-face-region-or-word 'uy b e)))
(global-set-key (kbd "M-o M-u z") (lambda(b e)(interactive "r")(set-face-region-or-word 'uz b e)))
(global-set-key (kbd "M-o M-u .") (lambda(b e)(interactive "r")(set-face-region-or-word 'unil b e)))


(global-set-key (kbd "M-o M-x a") (lambda(b e)(interactive "r")(set-face-region-or-word 'xa b e)))
                                        ; b background
(global-set-key (kbd "M-o M-x c") (lambda(b e)(interactive "r")(set-face-region-or-word 'xc b e)))
                                        ; d default
(global-set-key (kbd "M-o M-x e") (lambda(b e)(interactive "r")(set-face-region-or-word 'xe b e)))
                                        ; f foreground
(global-set-key (kbd "M-o M-x g") (lambda(b e)(interactive "r")(set-face-region-or-word 'xg b e)))
(global-set-key (kbd "M-o M-x h") (lambda(b e)(interactive "r")(set-face-region-or-word 'xh b e)))
(global-set-key (kbd "M-o M-x i") (lambda(b e)(interactive "r")(set-face-region-or-word 'xi b e)))
(global-set-key (kbd "M-o M-x j") (lambda(b e)(interactive "r")(set-face-region-or-word 'xj b e)))
(global-set-key (kbd "M-o M-x k") (lambda(b e)(interactive "r")(set-face-region-or-word 'xk b e)))
(global-set-key (kbd "M-o M-x l") (lambda(b e)(interactive "r")(set-face-region-or-word 'xl b e)))
(global-set-key (kbd "M-o M-x m") (lambda(b e)(interactive "r")(set-face-region-or-word 'xm b e)))
(global-set-key (kbd "M-o M-x n") (lambda(b e)(interactive "r")(set-face-region-or-word 'xn b e)))
(global-set-key (kbd "M-o M-x o") (lambda(b e)(interactive "r")(set-face-region-or-word 'xo b e)))
(global-set-key (kbd "M-o M-x p") (lambda(b e)(interactive "r")(set-face-region-or-word 'xp b e)))
                                        ; q quit
(global-set-key (kbd "M-o M-x r") (lambda(b e)(interactive "r")(set-face-region-or-word 'xr b e)))
(global-set-key (kbd "M-o M-x s") (lambda(b e)(interactive "r")(set-face-region-or-word 'xs b e)))
(global-set-key (kbd "M-o M-x t") (lambda(b e)(interactive "r")(set-face-region-or-word 'xt b e)))
                                        ; u underline
(global-set-key (kbd "M-o M-x w") (lambda(b e)(interactive "r")(set-face-region-or-word 'xw b e)))
(global-set-key (kbd "M-o M-x v") (lambda(b e)(interactive "r")(set-face-region-or-word 'xv b e)))
                                        ; x box
(global-set-key (kbd "M-o M-x y") (lambda(b e)(interactive "r")(set-face-region-or-word 'xy b e)))
(global-set-key (kbd "M-o M-x z") (lambda(b e)(interactive "r")(set-face-region-or-word 'xz b e)))
(global-set-key (kbd "M-o M-x .") (lambda(b e)(interactive "r")(set-face-region-or-word 'xnil b e)))


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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                 set faces modes                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-minor-mode set-b-faces-minor-mode
  "Toggle set background faces minor mode. When mode is enabled, certain letter keys set background faces"
  nil
  " SetB"
  '(
    ("a" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ba b e)))
    ("b" . (lambda()(interactive)))
    ("c" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bc b e)))
    ("d" . (lambda()(interactive)(facemenu-set-default)))
    ("e" . (lambda(b e)(interactive "r")(set-face-region-or-word 'be b e)))
    ("f" . (lambda()(interactive)(set-b-faces-minor-mode -1)(set-f-faces-minor-mode nil)))
    ("g" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bg b e)))
    ("h" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bh b e)))
    ("i" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bi b e)))
    ("j" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bj b e)))
    ("k" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bk b e)))
    ("l" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bl b e)))
    ("m" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bm b e)))
    ("n" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bn b e)))
    ("o" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bo b e)))
    ("p" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bp b e)))
    ("q" . (lambda()(interactive)(set-b-faces-minor-mode -1)))
    ("r" . (lambda(b e)(interactive "r")(set-face-region-or-word 'br b e)))
    ("s" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bs b e)))
    ("t" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bt b e)))
    ("u" . (lambda()(interactive)(set-b-faces-minor-mode -1)(set-u-faces-minor-mode nil)))
    ("w" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bw b e)))
    ("v" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bv b e)))
    ("x" . (lambda()(interactive)(set-b-faces-minor-mode -1)(set-x-faces-minor-mode nil)))
    ("y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'by b e)))
    ("z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bz b e)))
    ("," . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
    ("." . (lambda(b e)(interactive "r")(set-face-region-or-word 'bnil b e)))
    ("/" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
    )
  (if set-b-faces-minor-mode
      (set-face-background 'cursor "blue")
    (set-face-background 'cursor "black")))


(define-minor-mode set-f-faces-minor-mode
  "Toggle set foreground faces minor mode. When mode is enabled, certain letter keys set foreground faces"
  nil
  " SetF"
  '(
    ("a" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fa b e)))
    ("b" . (lambda()(interactive)(set-f-faces-minor-mode -1)(set-b-faces-minor-mode nil)))
    ("c" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fc b e)))
    ("d" . (lambda()(interactive)(facemenu-set-default)))
    ("e" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fe b e)))
    ("f" . (lambda()(interactive)))
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
    ("q" . (lambda()(interactive)(set-f-faces-minor-mode -1)))
    ("r" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fr b e)))
    ("s" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fs b e)))
    ("t" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ft b e)))
    ("u" . (lambda()(interactive)(set-f-faces-minor-mode -1)(set-u-faces-minor-mode nil)))
    ("w" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fw b e)))
    ("v" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fv b e)))
    ("x" . (lambda()(interactive)(set-f-faces-minor-mode -1)(set-x-faces-minor-mode nil)))
    ("y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fy b e)))
    ("z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fz b e)))
    ("," . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
    ("." . (lambda(b e)(interactive "r")(set-face-region-or-word 'fnil b e)))
    ("/" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
    )
  (if set-f-faces-minor-mode
      (set-face-background 'cursor "#ff00ff")
    (set-face-background 'cursor "black")))
(global-set-key (kbd "M-o M-m") 'set-f-faces-minor-mode)
(global-set-key (kbd "<f12>") 'set-f-faces-minor-mode)


(define-minor-mode set-u-faces-minor-mode
  "Toggle set underline faces minor mode. When mode is enabled, certain letter keys set underline faces"
  nil
  " SetU"
  '(
    ("a" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ua b e)))
    ("b" . (lambda()(interactive)(set-u-faces-minor-mode -1)(set-b-faces-minor-mode nil)))
    ("c" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uc b e)))
    ("d" . (lambda()(interactive)(facemenu-set-default)))
    ("e" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ue b e)))
    ("f" . (lambda()(interactive)(set-u-faces-minor-mode -1)(set-f-faces-minor-mode nil)))
    ("g" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ug b e)))
    ("h" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uh b e)))
    ("i" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ui b e)))
    ("j" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uj b e)))
    ("k" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uk b e)))
    ("l" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ul b e)))
    ("m" . (lambda(b e)(interactive "r")(set-face-region-or-word 'um b e)))
    ("n" . (lambda(b e)(interactive "r")(set-face-region-or-word 'un b e)))
    ("o" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uo b e)))
    ("p" . (lambda(b e)(interactive "r")(set-face-region-or-word 'up b e)))
    ("q" . (lambda()(interactive)(set-u-faces-minor-mode -1)))
    ("r" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ur b e)))
    ("s" . (lambda(b e)(interactive "r")(set-face-region-or-word 'us b e)))
    ("t" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ut b e)))
    ("u" . (lambda()(interactive)))
    ("w" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uw b e)))
    ("v" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uv b e)))
    ("x" . (lambda()(interactive)(set-u-faces-minor-mode -1)(set-x-faces-minor-mode nil)))
    ("y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uy b e)))
    ("z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uz b e)))
    ("," . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
    ("." . (lambda(b e)(interactive "r")(set-face-region-or-word 'unil b e)))
    ("/" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
    )
  (if set-u-faces-minor-mode
      (set-face-background 'cursor "lime")
    (set-face-background 'cursor "black")))


(define-minor-mode set-x-faces-minor-mode
  "Toggle set box faces minor mode. When mode is enabled, certain letter keys set box faces"
  nil
  " SetX"
  '(
    ("a" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xa b e)))
    ("b" . (lambda()(interactive)(set-x-faces-minor-mode -1)(set-b-faces-minor-mode nil)))
    ("c" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xc b e)))
    ("d" . (lambda()(interactive)(facemenu-set-default)))
    ("e" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xe b e)))
    ("f" . (lambda()(interactive)(set-x-faces-minor-mode -1)(set-f-faces-minor-mode nil)))
    ("g" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xg b e)))
    ("h" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xh b e)))
    ("i" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xi b e)))
    ("j" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xj b e)))
    ("k" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xk b e)))
    ("l" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xl b e)))
    ("m" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xm b e)))
    ("n" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xn b e)))
    ("o" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xo b e)))
    ("p" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xp b e)))
    ("q" . (lambda()(interactive)(set-x-faces-minor-mode -1)))
    ("r" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xr b e)))
    ("s" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xs b e)))
    ("t" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xt b e)))
    ("u" . (lambda()(interactive)(set-x-faces-minor-mode -1)(set-u-faces-minor-mode nil)))
    ("w" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xw b e)))
    ("v" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xv b e)))
    ("x" . (lambda()(interactive)))
    ("y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xy b e)))
    ("z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xz b e)))
    ("," . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
    ("." . (lambda(b e)(interactive "r")(set-face-region-or-word 'xnil b e)))
    ("/" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
    )
  (if set-x-faces-minor-mode
      (set-face-background 'cursor "red")
    (set-face-background 'cursor "black")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                 faces visibility                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun show-faces(faces)
  (interactive)
  (dolist (face faces) (face-remap-reset-base face)))

(defun hide-faces(faces)
  (interactive)
  (dolist (face faces) (face-remap-set-base face nil)))


(define-minor-mode hide-b-faces-minor-mode
  "Toggle minor mode for hiding background faces." nil " HideB" nil
  (let ((faces '(ba bc bd be bg bh bi bj bk bl bm bn bo bp br bs bt bw bv by bz bnil)))
    (if hide-b-faces-minor-mode (hide-faces faces) (show-faces faces))))
(global-set-key (kbd "s-b") 'hide-b-faces-minor-mode)

(define-minor-mode hide-f-faces-minor-mode
  "Toggle minor mode for hiding foreground faces." nil " HideF" nil
  (let ((faces '(fa fc fd fe fg fh fi fj fk fl fm fn fo fp fr fs ft fw fv fy fz fnil)))
    (if hide-f-faces-minor-mode (hide-faces faces) (show-faces faces))))
(global-set-key (kbd "s-f") 'hide-f-faces-minor-mode)

(define-minor-mode hide-u-faces-minor-mode
  "Toggle minor mode for hiding background faces." nil " HideU" nil
  (let ((faces '(ua uc ud ue ug uh ui uj uk ul um un uo up ur us ut uw uv uy uz unil)))
    (if hide-u-faces-minor-mode (hide-faces faces) (show-faces faces))))
(global-set-key (kbd "s-u") 'hide-u-faces-minor-mode)

(define-minor-mode hide-x-faces-minor-mode
  "Toggle minor mode for hiding background faces." nil " HideX" nil
  (let ((faces '(xa xc xd xe xg xh xi xj xk xl xm xn xo xp xr xs xt xw xv xy xz xnil)))
    (if hide-x-faces-minor-mode (hide-faces faces) (show-faces faces))))
(global-set-key (kbd "s-x") 'hide-x-faces-minor-mode)


(defun only-b-faces()
  "Show only faces b"
  (interactive)
  (hide-b-faces-minor-mode -1)
  (hide-f-faces-minor-mode nil)
  (hide-u-faces-minor-mode nil)
  (hide-x-faces-minor-mode nil))
(global-set-key (kbd "C-s-b") 'only-b-faces)

(defun only-f-faces()
  "Show only faces f"
  (interactive)
  (hide-b-faces-minor-mode nil)
  (hide-f-faces-minor-mode -1)
  (hide-u-faces-minor-mode nil)
  (hide-x-faces-minor-mode nil))
(global-set-key (kbd "C-s-f") 'only-f-faces)

(defun only-u-faces()
  "Show only faces u"
  (interactive)
  (hide-b-faces-minor-mode nil)
  (hide-f-faces-minor-mode nil)
  (hide-u-faces-minor-mode -1)
  (hide-x-faces-minor-mode nil))
(global-set-key (kbd "C-s-u") 'only-u-faces)

(defun only-x-faces()
  "Show only faces x"
  (interactive)
  (hide-b-faces-minor-mode nil)
  (hide-f-faces-minor-mode nil)
  (hide-u-faces-minor-mode nil)
  (hide-x-faces-minor-mode -1))
(global-set-key (kbd "C-s-x") 'only-x-faces)

(defun show-all-faces()
  "Show all faces"
  (interactive)
  (hide-b-faces-minor-mode -1)
  (hide-f-faces-minor-mode -1)
  (hide-u-faces-minor-mode -1)
  (hide-x-faces-minor-mode -1))
(global-set-key (kbd "s-a") 'show-all-faces)
(global-set-key (kbd "C-s-a") 'show-all-faces)
