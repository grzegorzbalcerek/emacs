;;; -*- lexical-biding: t -*-

(provide 'facesplus)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   face definitions                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro def-four-faces (letter color name)
  `(progn
     (defface ,(intern (concat "b" letter)) '((t (:background ,color))) (concat "background " ,name))
     (defface ,(intern (concat "f" letter)) '((t (:foreground ,color :weight bold))) (concat "foreground " ,name))
     (defface ,(intern (concat "s" letter)) '((t (:strike-through ,color))) (concat "strikethrough " ,name))
     (defface ,(intern (concat "u" letter)) '((t (:underline ,color))) (concat "underline " ,name))
     (defface ,(intern (concat "x" letter)) '((t (:box (:line-width (-2 . -2) :color ,color)))) (concat "box " ,name))
     ))

(def-four-faces "a" "#00ffff" "#00ffff aqua")
(def-four-faces "b" "#0000ff" "#0000ff blue")
(def-four-faces "c" "#bfff00" "#bfff00 light lime")
(def-four-faces "d" "#00bfff" "#00bfff deep sky blue")
(def-four-faces "e" "#00ff7f" "#00ff7f spring green")
(def-four-faces "f" "#ff00ff" "#ff00ff fuchsia")
(def-four-faces "g" "#008000" "#008000 green")
(def-four-faces "h" "#ffd700" "#ffd700 gold")
(def-four-faces "i" "#808000" "#808000 olive")
(def-four-faces "j" "#0000cd" "#0000cd medium blue")
(def-four-faces "k" "#f0e68c" "#f0e68c dark khaki")
(def-four-faces "l" "#00ff00" "#00ff00 lime")
(def-four-faces "m" "#fa8072" "#fa8072 salmon")
(def-four-faces "n" "#800000" "#800000 brown")
(def-four-faces "o" "#ff8000" "#ff8000 orange")
(def-four-faces "p" "#ff80ff" "#ff80ff pink")
(def-four-faces "q" "#8b008b" "#8b008b dark magenta")
(def-four-faces "r" "#ff0000" "#ff0000 red")
(def-four-faces "s" "#0080ff" "#0080ff sky blue")
(def-four-faces "t" "#008080" "#008080 teal")
(def-four-faces "u" "#fff8dc" "#fff8dc corn silk")
(def-four-faces "v" "#8000ff" "#8000ff violet")
(def-four-faces "w" "#ffffff" "#ffffff white")
(def-four-faces "x" "#bfbfbf" "#bfbfbf gray")
(def-four-faces "y" "#ffff00" "#ffff00 yellow")
(def-four-faces "z" "#000000" "#000000 black")

(defface bnil '((t (:background unspecified))) "background nil")
(defface fnil '((t (:foreground unspecified :weight normal))) "foreground nil")
(defface snil '((t (:strike-through unspecified))) "strike-through nil")
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
  (list-two-letter-face "s" letter) (insert "  ")
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
  (dolist (letter (list "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"))
             (list-four-faces letter)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   face translations                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq enriched-translations
      '((face
         (header1 "header1")(header2 "header2")(header3 "header3")
         (grayheader1 "grayheader1")(grayheader2 "grayheader2")(grayheader3 "grayheader3")
         (small "small")(half "half")
         (ba "ba")(fa "fa")(sa "sa")(ua "ua")(xa "xa")
         (bb "bb")(fb "fb")(sb "sb")(ub "ub")(xb "xb")
         (bc "bc")(fc "fc")(sc "sc")(uc "uc")(xc "xc")
         (bd "bd")(fd "fd")(sd "sd")(ud "ud")(xd "xd")
         (be "be")(fe "fe")(se "se")(ue "ue")(xe "xe")
         (bf "bf")(ff "ff")(sf "sf")(uf "uf")(xf "xf")
         (bg "bg")(fg "fg")(sg "sg")(ug "ug")(xg "xg")
         (bh "bh")(fh "fh")(sh "sh")(uh "uh")(xh "xh")
         (bi "bi")(fi "fi")(si "si")(ui "ui")(xi "xi")
         (bj "bj")(fj "fj")(sj "sj")(uj "uj")(xj "xj")
         (bk "bk")(fk "fk")(sk "sk")(uk "uk")(xk "xk")
         (bl "bl")(fl "fl")(sl "sl")(ul "ul")(xl "xl")
         (bm "bm")(fm "fm")(sm "sm")(um "um")(xm "xm")
         (bn "bn")(fn "fn")(sn "sn")(un "un")(xn "xn")
         (bo "bo")(fo "fo")(so "so")(uo "uo")(xo "xo")
         (bp "bp")(fp "fp")(sp "sp")(up "up")(xp "xp")
         (bq "bq")(fq "fq")(sq "sq")(uq "uq")(xq "xq")
         (br "br")(fr "fr")(sr "sr")(ur "ur")(xr "xr")
         (bs "bs")(fs "fs")(ss "ss")(us "us")(xs "xs")
         (bt "bt")(ft "ft")(st "st")(ut "ut")(xt "xt")
         (bu "bu")(fu "fu")(su "su")(uu "uu")(xu "xu")
         (bv "bv")(fv "fv")(sv "sv")(uv "uv")(xv "xv")
         (bw "bw")(fw "fw")(sw "sw")(uw "uw")(xw "xw")
         (bx "bx")(fx "fx")(sx "sx")(ux "ux")(xx "xx")
         (by "by")(fy "fy")(sy "sy")(uy "uy")(xy "xy")
         (bz "bz")(fz "fz")(sz "sz")(uz "uz")(xz "xz")
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

(global-set-key (kbd "C-s-] a") (lambda(b e)(interactive "r")(set-face-region-or-word 'ba b e)))
(global-set-key (kbd "C-s-] b") (lambda(b e)(interactive "r")(set-face-region-or-word 'bb b e)))
(global-set-key (kbd "C-s-] c") (lambda(b e)(interactive "r")(set-face-region-or-word 'bc b e)))
(global-set-key (kbd "C-s-] d") (lambda(b e)(interactive "r")(set-face-region-or-word 'bd b e)))
(global-set-key (kbd "C-s-] e") (lambda(b e)(interactive "r")(set-face-region-or-word 'be b e)))
(global-set-key (kbd "C-s-] f") (lambda(b e)(interactive "r")(set-face-region-or-word 'bf b e)))
(global-set-key (kbd "C-s-] g") (lambda(b e)(interactive "r")(set-face-region-or-word 'bg b e)))
(global-set-key (kbd "C-s-] h") (lambda(b e)(interactive "r")(set-face-region-or-word 'bh b e)))
(global-set-key (kbd "C-s-] i") (lambda(b e)(interactive "r")(set-face-region-or-word 'bi b e)))
(global-set-key (kbd "C-s-] j") (lambda(b e)(interactive "r")(set-face-region-or-word 'bj b e)))
(global-set-key (kbd "C-s-] k") (lambda(b e)(interactive "r")(set-face-region-or-word 'bk b e)))
(global-set-key (kbd "C-s-] l") (lambda(b e)(interactive "r")(set-face-region-or-word 'bl b e)))
(global-set-key (kbd "C-s-] m") (lambda(b e)(interactive "r")(set-face-region-or-word 'bm b e)))
(global-set-key (kbd "C-s-] n") (lambda(b e)(interactive "r")(set-face-region-or-word 'bn b e)))
(global-set-key (kbd "C-s-] o") (lambda(b e)(interactive "r")(set-face-region-or-word 'bo b e)))
(global-set-key (kbd "C-s-] p") (lambda(b e)(interactive "r")(set-face-region-or-word 'bp b e)))
(global-set-key (kbd "C-s-] q") (lambda(b e)(interactive "r")(set-face-region-or-word 'bq b e)))
(global-set-key (kbd "C-s-] r") (lambda(b e)(interactive "r")(set-face-region-or-word 'br b e)))
(global-set-key (kbd "C-s-] s") (lambda(b e)(interactive "r")(set-face-region-or-word 'bs b e)))
(global-set-key (kbd "C-s-] t") (lambda(b e)(interactive "r")(set-face-region-or-word 'bt b e)))
(global-set-key (kbd "C-s-] u") (lambda(b e)(interactive "r")(set-face-region-or-word 'bu b e)))
(global-set-key (kbd "C-s-] v") (lambda(b e)(interactive "r")(set-face-region-or-word 'bv b e)))
(global-set-key (kbd "C-s-] w") (lambda(b e)(interactive "r")(set-face-region-or-word 'bw b e)))
(global-set-key (kbd "C-s-] x") (lambda(b e)(interactive "r")(set-face-region-or-word 'bx b e)))
(global-set-key (kbd "C-s-] y") (lambda(b e)(interactive "r")(set-face-region-or-word 'by b e)))
(global-set-key (kbd "C-s-] z") (lambda(b e)(interactive "r")(set-face-region-or-word 'bz b e)))
(global-set-key (kbd "C-s-] .") (lambda(b e)(interactive "r")(set-face-region-or-word 'bnil b e)))

(global-set-key (kbd "C-ESC a") (lambda(b e)(interactive "r")(set-face-region-or-word 'fa b e)))
(global-set-key (kbd "C-ESC b") (lambda(b e)(interactive "r")(set-face-region-or-word 'fb b e)))
(global-set-key (kbd "C-ESC c") (lambda(b e)(interactive "r")(set-face-region-or-word 'fc b e)))
(global-set-key (kbd "C-ESC d") (lambda(b e)(interactive "r")(set-face-region-or-word 'fd b e)))
(global-set-key (kbd "C-ESC e") (lambda(b e)(interactive "r")(set-face-region-or-word 'fe b e)))
(global-set-key (kbd "C-ESC f") (lambda(b e)(interactive "r")(set-face-region-or-word 'ff b e)))
(global-set-key (kbd "C-ESC g") (lambda(b e)(interactive "r")(set-face-region-or-word 'fg b e)))
(global-set-key (kbd "C-ESC h") (lambda(b e)(interactive "r")(set-face-region-or-word 'fh b e)))
(global-set-key (kbd "C-ESC i") (lambda(b e)(interactive "r")(set-face-region-or-word 'fi b e)))
(global-set-key (kbd "C-ESC j") (lambda(b e)(interactive "r")(set-face-region-or-word 'fj b e)))
(global-set-key (kbd "C-ESC k") (lambda(b e)(interactive "r")(set-face-region-or-word 'fk b e)))
(global-set-key (kbd "C-ESC l") (lambda(b e)(interactive "r")(set-face-region-or-word 'fl b e)))
(global-set-key (kbd "C-ESC m") (lambda(b e)(interactive "r")(set-face-region-or-word 'fm b e)))
(global-set-key (kbd "C-ESC n") (lambda(b e)(interactive "r")(set-face-region-or-word 'fn b e)))
(global-set-key (kbd "C-ESC o") (lambda(b e)(interactive "r")(set-face-region-or-word 'fo b e)))
(global-set-key (kbd "C-ESC p") (lambda(b e)(interactive "r")(set-face-region-or-word 'fp b e)))
(global-set-key (kbd "C-ESC q") (lambda(b e)(interactive "r")(set-face-region-or-word 'fq b e)))
(global-set-key (kbd "C-ESC r") (lambda(b e)(interactive "r")(set-face-region-or-word 'fr b e)))
(global-set-key (kbd "C-ESC s") (lambda(b e)(interactive "r")(set-face-region-or-word 'fs b e)))
(global-set-key (kbd "C-ESC t") (lambda(b e)(interactive "r")(set-face-region-or-word 'ft b e)))
(global-set-key (kbd "C-ESC u") (lambda(b e)(interactive "r")(set-face-region-or-word 'fu b e)))
(global-set-key (kbd "C-ESC v") (lambda(b e)(interactive "r")(set-face-region-or-word 'fv b e)))
(global-set-key (kbd "C-ESC w") (lambda(b e)(interactive "r")(set-face-region-or-word 'fw b e)))
(global-set-key (kbd "C-ESC x") (lambda(b e)(interactive "r")(set-face-region-or-word 'fx b e)))
(global-set-key (kbd "C-ESC y") (lambda(b e)(interactive "r")(set-face-region-or-word 'fy b e)))
(global-set-key (kbd "C-ESC z") (lambda(b e)(interactive "r")(set-face-region-or-word 'fz b e)))
(global-set-key (kbd "C-ESC .") (lambda(b e)(interactive "r")(set-face-region-or-word 'fnil b e)))

(global-set-key (kbd "C-s-- a") (lambda(b e)(interactive "r")(set-face-region-or-word 'sa b e)))
(global-set-key (kbd "C-s-- b") (lambda(b e)(interactive "r")(set-face-region-or-word 'sb b e)))
(global-set-key (kbd "C-s-- c") (lambda(b e)(interactive "r")(set-face-region-or-word 'sc b e)))
(global-set-key (kbd "C-s-- d") (lambda(b e)(interactive "r")(set-face-region-or-word 'sd b e)))
(global-set-key (kbd "C-s-- e") (lambda(b e)(interactive "r")(set-face-region-or-word 'se b e)))
(global-set-key (kbd "C-s-- f") (lambda(b e)(interactive "r")(set-face-region-or-word 'sf b e)))
(global-set-key (kbd "C-s-- g") (lambda(b e)(interactive "r")(set-face-region-or-word 'sg b e)))
(global-set-key (kbd "C-s-- h") (lambda(b e)(interactive "r")(set-face-region-or-word 'sh b e)))
(global-set-key (kbd "C-s-- i") (lambda(b e)(interactive "r")(set-face-region-or-word 'si b e)))
(global-set-key (kbd "C-s-- j") (lambda(b e)(interactive "r")(set-face-region-or-word 'sj b e)))
(global-set-key (kbd "C-s-- k") (lambda(b e)(interactive "r")(set-face-region-or-word 'sk b e)))
(global-set-key (kbd "C-s-- l") (lambda(b e)(interactive "r")(set-face-region-or-word 'sl b e)))
(global-set-key (kbd "C-s-- m") (lambda(b e)(interactive "r")(set-face-region-or-word 'sm b e)))
(global-set-key (kbd "C-s-- n") (lambda(b e)(interactive "r")(set-face-region-or-word 'sn b e)))
(global-set-key (kbd "C-s-- o") (lambda(b e)(interactive "r")(set-face-region-or-word 'so b e)))
(global-set-key (kbd "C-s-- p") (lambda(b e)(interactive "r")(set-face-region-or-word 'sp b e)))
(global-set-key (kbd "C-s-- q") (lambda(b e)(interactive "r")(set-face-region-or-word 'sq b e)))
(global-set-key (kbd "C-s-- r") (lambda(b e)(interactive "r")(set-face-region-or-word 'sr b e)))
(global-set-key (kbd "C-s-- s") (lambda(b e)(interactive "r")(set-face-region-or-word 'ss b e)))
(global-set-key (kbd "C-s-- t") (lambda(b e)(interactive "r")(set-face-region-or-word 'st b e)))
(global-set-key (kbd "C-s-- u") (lambda(b e)(interactive "r")(set-face-region-or-word 'su b e)))
(global-set-key (kbd "C-s-- v") (lambda(b e)(interactive "r")(set-face-region-or-word 'sv b e)))
(global-set-key (kbd "C-s-- w") (lambda(b e)(interactive "r")(set-face-region-or-word 'sw b e)))
(global-set-key (kbd "C-s-- x") (lambda(b e)(interactive "r")(set-face-region-or-word 'sx b e)))
(global-set-key (kbd "C-s-- y") (lambda(b e)(interactive "r")(set-face-region-or-word 'sy b e)))
(global-set-key (kbd "C-s-- z") (lambda(b e)(interactive "r")(set-face-region-or-word 'sz b e)))
(global-set-key (kbd "C-s-- .") (lambda(b e)(interactive "r")(set-face-region-or-word 'snil b e)))

(global-set-key (kbd "C-s-' a") (lambda(b e)(interactive "r")(set-face-region-or-word 'ua b e)))
(global-set-key (kbd "C-s-' b") (lambda(b e)(interactive "r")(set-face-region-or-word 'ub b e)))
(global-set-key (kbd "C-s-' c") (lambda(b e)(interactive "r")(set-face-region-or-word 'uc b e)))
(global-set-key (kbd "C-s-' d") (lambda(b e)(interactive "r")(set-face-region-or-word 'ud b e)))
(global-set-key (kbd "C-s-' e") (lambda(b e)(interactive "r")(set-face-region-or-word 'ue b e)))
(global-set-key (kbd "C-s-' f") (lambda(b e)(interactive "r")(set-face-region-or-word 'uf b e)))
(global-set-key (kbd "C-s-' g") (lambda(b e)(interactive "r")(set-face-region-or-word 'ug b e)))
(global-set-key (kbd "C-s-' h") (lambda(b e)(interactive "r")(set-face-region-or-word 'uh b e)))
(global-set-key (kbd "C-s-' i") (lambda(b e)(interactive "r")(set-face-region-or-word 'ui b e)))
(global-set-key (kbd "C-s-' j") (lambda(b e)(interactive "r")(set-face-region-or-word 'uj b e)))
(global-set-key (kbd "C-s-' k") (lambda(b e)(interactive "r")(set-face-region-or-word 'uk b e)))
(global-set-key (kbd "C-s-' l") (lambda(b e)(interactive "r")(set-face-region-or-word 'ul b e)))
(global-set-key (kbd "C-s-' m") (lambda(b e)(interactive "r")(set-face-region-or-word 'um b e)))
(global-set-key (kbd "C-s-' n") (lambda(b e)(interactive "r")(set-face-region-or-word 'un b e)))
(global-set-key (kbd "C-s-' o") (lambda(b e)(interactive "r")(set-face-region-or-word 'uo b e)))
(global-set-key (kbd "C-s-' p") (lambda(b e)(interactive "r")(set-face-region-or-word 'up b e)))
(global-set-key (kbd "C-s-' q") (lambda(b e)(interactive "r")(set-face-region-or-word 'uq b e)))
(global-set-key (kbd "C-s-' r") (lambda(b e)(interactive "r")(set-face-region-or-word 'ur b e)))
(global-set-key (kbd "C-s-' s") (lambda(b e)(interactive "r")(set-face-region-or-word 'us b e)))
(global-set-key (kbd "C-s-' t") (lambda(b e)(interactive "r")(set-face-region-or-word 'ut b e)))
(global-set-key (kbd "C-s-' u") (lambda(b e)(interactive "r")(set-face-region-or-word 'uu b e)))
(global-set-key (kbd "C-s-' v") (lambda(b e)(interactive "r")(set-face-region-or-word 'uv b e)))
(global-set-key (kbd "C-s-' w") (lambda(b e)(interactive "r")(set-face-region-or-word 'uw b e)))
(global-set-key (kbd "C-s-' x") (lambda(b e)(interactive "r")(set-face-region-or-word 'ux b e)))
(global-set-key (kbd "C-s-' y") (lambda(b e)(interactive "r")(set-face-region-or-word 'uy b e)))
(global-set-key (kbd "C-s-' z") (lambda(b e)(interactive "r")(set-face-region-or-word 'uz b e)))
(global-set-key (kbd "C-s-' .") (lambda(b e)(interactive "r")(set-face-region-or-word 'unil b e)))

(global-set-key (kbd "C-s-= a") (lambda(b e)(interactive "r")(set-face-region-or-word 'xa b e)))
(global-set-key (kbd "C-s-= b") (lambda(b e)(interactive "r")(set-face-region-or-word 'xb b e)))
(global-set-key (kbd "C-s-= c") (lambda(b e)(interactive "r")(set-face-region-or-word 'xc b e)))
(global-set-key (kbd "C-s-= d") (lambda(b e)(interactive "r")(set-face-region-or-word 'xd b e)))
(global-set-key (kbd "C-s-= e") (lambda(b e)(interactive "r")(set-face-region-or-word 'xe b e)))
(global-set-key (kbd "C-s-= f") (lambda(b e)(interactive "r")(set-face-region-or-word 'xf b e)))
(global-set-key (kbd "C-s-= g") (lambda(b e)(interactive "r")(set-face-region-or-word 'xg b e)))
(global-set-key (kbd "C-s-= h") (lambda(b e)(interactive "r")(set-face-region-or-word 'xh b e)))
(global-set-key (kbd "C-s-= i") (lambda(b e)(interactive "r")(set-face-region-or-word 'xi b e)))
(global-set-key (kbd "C-s-= j") (lambda(b e)(interactive "r")(set-face-region-or-word 'xj b e)))
(global-set-key (kbd "C-s-= k") (lambda(b e)(interactive "r")(set-face-region-or-word 'xk b e)))
(global-set-key (kbd "C-s-= l") (lambda(b e)(interactive "r")(set-face-region-or-word 'xl b e)))
(global-set-key (kbd "C-s-= m") (lambda(b e)(interactive "r")(set-face-region-or-word 'xm b e)))
(global-set-key (kbd "C-s-= n") (lambda(b e)(interactive "r")(set-face-region-or-word 'xn b e)))
(global-set-key (kbd "C-s-= o") (lambda(b e)(interactive "r")(set-face-region-or-word 'xo b e)))
(global-set-key (kbd "C-s-= p") (lambda(b e)(interactive "r")(set-face-region-or-word 'xp b e)))
(global-set-key (kbd "C-s-= q") (lambda(b e)(interactive "r")(set-face-region-or-word 'xq b e)))
(global-set-key (kbd "C-s-= r") (lambda(b e)(interactive "r")(set-face-region-or-word 'xr b e)))
(global-set-key (kbd "C-s-= s") (lambda(b e)(interactive "r")(set-face-region-or-word 'xs b e)))
(global-set-key (kbd "C-s-= t") (lambda(b e)(interactive "r")(set-face-region-or-word 'xt b e)))
(global-set-key (kbd "C-s-= u") (lambda(b e)(interactive "r")(set-face-region-or-word 'xu b e)))
(global-set-key (kbd "C-s-= v") (lambda(b e)(interactive "r")(set-face-region-or-word 'xv b e)))
(global-set-key (kbd "C-s-= w") (lambda(b e)(interactive "r")(set-face-region-or-word 'xw b e)))
(global-set-key (kbd "C-s-= x") (lambda(b e)(interactive "r")(set-face-region-or-word 'xx b e)))
(global-set-key (kbd "C-s-= y") (lambda(b e)(interactive "r")(set-face-region-or-word 'xy b e)))
(global-set-key (kbd "C-s-= z") (lambda(b e)(interactive "r")(set-face-region-or-word 'xz b e)))
(global-set-key (kbd "C-s-= .") (lambda(b e)(interactive "r")(set-face-region-or-word 'xnil b e)))

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
    ("b" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bb b e)))
    ("c" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bc b e)))
    ("d" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bd b e)))
    ("e" . (lambda(b e)(interactive "r")(set-face-region-or-word 'be b e)))
    ("f" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bf b e)))
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
    ("q" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bq b e)))
    ("r" . (lambda(b e)(interactive "r")(set-face-region-or-word 'br b e)))
    ("s" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bs b e)))
    ("t" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bt b e)))
    ("v" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bv b e)))
    ("w" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bw b e)))
    ("x" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bx b e)))
    ("y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'by b e)))
    ("z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bz b e)))
    ("-" . (lambda()(interactive)(set-b-faces-minor-mode -1)(set-s-faces-minor-mode nil)))
    ("=" . (lambda()(interactive)(set-b-faces-minor-mode -1)(set-x-faces-minor-mode nil)))
    ("[" . (lambda()(interactive)(set-b-faces-minor-mode -1)(set-f-faces-minor-mode nil)))
    ("]" . (lambda()(interactive)))
    ("'" . (lambda()(interactive)(set-b-faces-minor-mode -1)(set-u-faces-minor-mode nil)))
    (";" . (lambda()(interactive)(facemenu-set-default)))
    ("," . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
    ("." . (lambda(b e)(interactive "r")(set-face-region-or-word 'bnil b e)))
    ("/" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
    ("`" . (lambda()(interactive)(set-b-faces-minor-mode -1)))
    )
  (if set-b-faces-minor-mode
      (set-face-background 'cursor "blue")
    (set-face-background 'cursor "black")))
(global-set-key (kbd "C-M-s-]") 'set-b-faces-minor-mode)

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
    ("-" . (lambda()(interactive)(set-f-faces-minor-mode -1)(set-s-faces-minor-mode nil)))
    ("=" . (lambda()(interactive)(set-f-faces-minor-mode -1)(set-x-faces-minor-mode nil)))
    ("[" . (lambda()(interactive)))
    ("]" . (lambda()(interactive)(set-f-faces-minor-mode -1)(set-b-faces-minor-mode nil)))
    ("'" . (lambda()(interactive)(set-f-faces-minor-mode -1)(set-u-faces-minor-mode nil)))
    (";" . (lambda()(interactive)(facemenu-set-default)))
    ("," . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
    ("." . (lambda(b e)(interactive "r")(set-face-region-or-word 'bnil b e)))
    ("/" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
    ("`" . (lambda()(interactive)(set-f-faces-minor-mode -1)))
    )
  (if set-f-faces-minor-mode
      (set-face-background 'cursor "#ff00ff")
    (set-face-background 'cursor "black")))
(global-set-key (kbd "M-s-ESC") 'set-f-faces-minor-mode)

(define-minor-mode set-s-faces-minor-mode
  "Toggle set strike-through faces minor mode. When mode is enabled, certain letter keys set strike-through faces"
  nil
  " SetS"
  '(
    ("a" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sa b e)))
    ("b" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sb b e)))
    ("c" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sc b e)))
    ("d" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sd b e)))
    ("e" . (lambda(b e)(interactive "r")(set-face-region-or-word 'se b e)))
    ("f" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sf b e)))
    ("g" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sg b e)))
    ("h" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sh b e)))
    ("i" . (lambda(b e)(interactive "r")(set-face-region-or-word 'si b e)))
    ("j" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sj b e)))
    ("k" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sk b e)))
    ("l" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sl b e)))
    ("m" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sm b e)))
    ("n" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sn b e)))
    ("o" . (lambda(b e)(interactive "r")(set-face-region-or-word 'so b e)))
    ("p" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sp b e)))
    ("q" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sq b e)))
    ("r" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sr b e)))
    ("s" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ss b e)))
    ("t" . (lambda(b e)(interactive "r")(set-face-region-or-word 'st b e)))
    ("v" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sv b e)))
    ("w" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sw b e)))
    ("x" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sx b e)))
    ("y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sy b e)))
    ("z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'sz b e)))
    ("-" . (lambda()(interactive)))
    ("=" . (lambda()(interactive)(set-s-faces-minor-mode -1)(set-x-faces-minor-mode nil)))
    ("[" . (lambda()(interactive)(set-s-faces-minor-mode -1)(set-f-faces-minor-mode nil)))
    ("]" . (lambda()(interactive)(set-s-faces-minor-mode -1)(set-b-faces-minor-mode nil)))
    ("'" . (lambda()(interactive)(set-s-faces-minor-mode -1)(set-u-faces-minor-mode nil)))
    (";" . (lambda()(interactive)(facemenu-set-default)))
    ("," . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
    ("." . (lambda(b e)(interactive "r")(set-face-region-or-word 'bnil b e)))
    ("/" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
    ("`" . (lambda()(interactive)(set-s-faces-minor-mode -1)))
    )
  (if set-s-faces-minor-mode
      (set-face-background 'cursor "gray")
    (set-face-background 'cursor "black")))
(global-set-key (kbd "C-M-s--") 'set-s-faces-minor-mode)

(define-minor-mode set-u-faces-minor-mode
  "Toggle set underline faces minor mode. When mode is enabled, certain letter keys set underline faces"
  nil
  " SetU"
  '(
    ("a" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ua b e)))
    ("b" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ub b e)))
    ("c" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uc b e)))
    ("d" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ud b e)))
    ("e" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ue b e)))
    ("f" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uf b e)))
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
    ("q" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uq b e)))
    ("r" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ur b e)))
    ("s" . (lambda(b e)(interactive "r")(set-face-region-or-word 'us b e)))
    ("t" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ut b e)))
    ("v" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uv b e)))
    ("w" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uw b e)))
    ("x" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ux b e)))
    ("y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uy b e)))
    ("z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'uz b e)))
    ("-" . (lambda()(interactive)(set-u-faces-minor-mode -1)(set-s-faces-minor-mode nil)))
    ("=" . (lambda()(interactive)(set-u-faces-minor-mode -1)(set-x-faces-minor-mode nil)))
    ("[" . (lambda()(interactive)(set-u-faces-minor-mode -1)(set-f-faces-minor-mode nil)))
    ("]" . (lambda()(interactive)(set-u-faces-minor-mode -1)(set-b-faces-minor-mode nil)))
    ("'" . (lambda()(interactive)))
    (";" . (lambda()(interactive)(facemenu-set-default)))
    ("," . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
    ("." . (lambda(b e)(interactive "r")(set-face-region-or-word 'bnil b e)))
    ("/" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
    ("`" . (lambda()(interactive)(set-u-faces-minor-mode -1)))
    )
  (if set-u-faces-minor-mode
      (set-face-background 'cursor "lime")
    (set-face-background 'cursor "black")))
(global-set-key (kbd "C-M-s-'") 'set-u-faces-minor-mode)

(define-minor-mode set-x-faces-minor-mode
  "Toggle set box faces minor mode. When mode is enabled, certain letter keys set box faces"
  nil
  " SetX"
  '(
    ("a" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xa b e)))
    ("b" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xb b e)))
    ("c" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xc b e)))
    ("d" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xd b e)))
    ("e" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xe b e)))
    ("f" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xf b e)))
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
    ("q" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xq b e)))
    ("r" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xr b e)))
    ("s" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xs b e)))
    ("t" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xt b e)))
    ("v" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xv b e)))
    ("w" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xw b e)))
    ("x" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xx b e)))
    ("y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xy b e)))
    ("z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'xz b e)))
    ("-" . (lambda()(interactive)(set-x-faces-minor-mode -1)(set-s-faces-minor-mode nil)))
    ("=" . (lambda()(interactive)))
    ("[" . (lambda()(interactive)(set-x-faces-minor-mode -1)(set-f-faces-minor-mode nil)))
    ("]" . (lambda()(interactive)(set-x-faces-minor-mode -1)(set-b-faces-minor-mode nil)))
    ("'" . (lambda()(interactive)(set-x-faces-minor-mode -1)(set-u-faces-minor-mode nil)))
    (";" . (lambda()(interactive)(facemenu-set-default)))
    ("," . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
    ("." . (lambda(b e)(interactive "r")(set-face-region-or-word 'bnil b e)))
    ("/" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
    ("`" . (lambda()(interactive)(set-x-faces-minor-mode -1)))
    )
  (if set-x-faces-minor-mode
      (set-face-background 'cursor "red")
    (set-face-background 'cursor "black")))
(global-set-key (kbd "C-M-s-=") 'set-x-faces-minor-mode)

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
  (let ((faces '(ba bb bc bd be bf bg bh bi bj bk bl bm bn bo bp bq br bs bt bu bv bw bx by bz bnil)))
    (if hide-b-faces-minor-mode (hide-faces faces) (show-faces faces))))
(global-set-key (kbd "s-b") 'hide-b-faces-minor-mode)

(define-minor-mode hide-f-faces-minor-mode
  "Toggle minor mode for hiding foreground faces." nil " HideF" nil
  (let ((faces '(fa fb fc fd fe ff fg fh fi fj fk fl fm fn fo fq fp fr fs ft fu fv fw fx fy fz fnil)))
    (if hide-f-faces-minor-mode (hide-faces faces) (show-faces faces))))
(global-set-key (kbd "s-f") 'hide-f-faces-minor-mode)

(define-minor-mode hide-s-faces-minor-mode
  "Toggle minor mode for hiding background faces." nil " HideU" nil
  (let ((faces '(sa sb sc sd se sf sg sh si sj sk sl sm sn so sp su sr ss st su sv sw sy sx sz snil)))
    (if hide-s-faces-minor-mode (hide-faces faces) (show-faces faces))))
(global-set-key (kbd "s-s") 'hide-s-faces-minor-mode)

(define-minor-mode hide-u-faces-minor-mode
  "Toggle minor mode for hiding background faces." nil " HideU" nil
  (let ((faces '(ua ub uc ud ue uf ug uh ui uj uk ul um un uo up uq ur us ut uu uv uw uy ux uz unil)))
    (if hide-u-faces-minor-mode (hide-faces faces) (show-faces faces))))
(global-set-key (kbd "s-u") 'hide-u-faces-minor-mode)

(define-minor-mode hide-x-faces-minor-mode
  "Toggle minor mode for hiding background faces." nil " HideX" nil
  (let ((faces '(xa xb xc xd xe xf xg xh xi xj xk xl xm xn xo xp xq xr xs xt xu xv xw xy xx xz xnil)))
    (if hide-x-faces-minor-mode (hide-faces faces) (show-faces faces))))
(global-set-key (kbd "s-x") 'hide-x-faces-minor-mode)


(defun only-b-faces()
  "Show only faces b"
  (interactive)
  (hide-b-faces-minor-mode -1)
  (hide-f-faces-minor-mode nil)
  (hide-s-faces-minor-mode nil)
  (hide-u-faces-minor-mode nil)
  (hide-x-faces-minor-mode nil))
(global-set-key (kbd "C-s-b") 'only-b-faces)

(defun only-f-faces()
  "Show only faces f"
  (interactive)
  (hide-b-faces-minor-mode nil)
  (hide-f-faces-minor-mode -1)
  (hide-s-faces-minor-mode nil)
  (hide-u-faces-minor-mode nil)
  (hide-x-faces-minor-mode nil))
(global-set-key (kbd "C-s-f") 'only-f-faces)

(defun only-s-faces()
  "Show only faces s"
  (interactive)
  (hide-b-faces-minor-mode nil)
  (hide-f-faces-minor-mode nil)
  (hide-s-faces-minor-mode -1)
  (hide-u-faces-minor-mode nil)
  (hide-x-faces-minor-mode nil))
(global-set-key (kbd "C-s-s") 'only-s-faces)

(defun only-u-faces()
  "Show only faces u"
  (interactive)
  (hide-b-faces-minor-mode nil)
  (hide-f-faces-minor-mode nil)
  (hide-s-faces-minor-mode nil)
  (hide-u-faces-minor-mode -1)
  (hide-x-faces-minor-mode nil))
(global-set-key (kbd "C-s-u") 'only-u-faces)

(defun only-x-faces()
  "Show only faces x"
  (interactive)
  (hide-b-faces-minor-mode nil)
  (hide-f-faces-minor-mode nil)
  (hide-s-faces-minor-mode nil)
  (hide-u-faces-minor-mode nil)
  (hide-x-faces-minor-mode -1))
(global-set-key (kbd "C-s-x") 'only-x-faces)

(defun show-all-faces()
  "Show all faces"
  (interactive)
  (hide-b-faces-minor-mode -1)
  (hide-f-faces-minor-mode -1)
  (hide-s-faces-minor-mode -1)
  (hide-u-faces-minor-mode -1)
  (hide-x-faces-minor-mode -1))
(global-set-key (kbd "s-a") 'show-all-faces)
(global-set-key (kbd "C-s-a") 'show-all-faces)
