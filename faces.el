;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   face definitions                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                                        ; f foreground
(defface fdef '((t (:foreground "#000000" :weight bold))) "foreground default")
(defface fnil '((t (:foreground "#000000" :weight normal))) "foreground nil")
(defface faqu '((t (:foreground "#00ffff" :weight bold))) "foreground aqua/cyan")
(defface fblu '((t (:foreground "#0000ff" :weight bold))) "foreground blue")
(defface ffuc '((t (:foreground "#ff00ff" :weight bold))) "foreground fuchsia/magenta")
(defface fgra '((t (:foreground "#bfbfbf" :weight bold))) "foreground gray75")
(defface fgre '((t (:foreground "#008000" :weight bold))) "foreground green")
(defface flim '((t (:foreground "#00ff00" :weight bold))) "foreground lime")
(defface fmar '((t (:foreground "#800000" :weight bold))) "foreground maroon/brown")
(defface fnav '((t (:foreground "#000080" :weight bold))) "foreground navy")
(defface foli '((t (:foreground "#808000" :weight bold))) "foreground olive")
(defface fora '((t (:foreground "#ff8000" :weight bold))) "foreground orange")
(defface fpin '((t (:foreground "#ff80ff" :weight bold))) "foreground pink")
(defface fpur '((t (:foreground "#800080" :weight bold))) "foreground purple")
(defface fred '((t (:foreground "#ff0000" :weight bold))) "foreground red")
(defface fsky '((t (:foreground "#0080ff" :weight bold))) "foreground sky blue")
(defface ftea '((t (:foreground "#008080" :weight bold))) "foreground teal")
(defface fvio '((t (:foreground "#8000ff" :weight bold))) "foreground violet")
(defface fyel '((t (:foreground "#ffff00" :weight bold))) "foreground yellow")

                                        ; b background
(defface bdef '((t (:background "#ffffff"))) "background default")
(defface bnil '((t (:background "#ffffff"))) "background nil")
(defface baqu '((t (:background "#00ffff"))) "background aqua/cyan")
(defface bblu '((t (:background "#0000ff"))) "background blue")
(defface bfuc '((t (:background "#ff00ff"))) "background fuchsia/magenta")
(defface bgra '((t (:background "#bfbfbf"))) "background gray75")
(defface bgre '((t (:background "#008000"))) "background green")
(defface blim '((t (:background "#00ff00"))) "background lime")
(defface bmar '((t (:background "#800000"))) "background maroon/brown")
(defface bnav '((t (:background "#000080"))) "background navy")
(defface boli '((t (:background "#bfbf00"))) "background olive")
(defface bora '((t (:background "#ff8000"))) "background orange")
(defface bpin '((t (:background "#ff80ff"))) "background pink")
(defface bpur '((t (:background "#bf00bf"))) "background purple")
(defface bred '((t (:background "#ff0000"))) "background red")
(defface bsky '((t (:background "#0080ff"))) "background sky blue")
(defface btea '((t (:background "#00bfbf"))) "background teal")
(defface bvio '((t (:background "#8000ff"))) "background violet")
(defface byel '((t (:background "#ffff00"))) "background yellow")

                                        ; o overline
(defface odef '((t (:overline "#000000"))) "overline default")
(defface onil '((t (:overline nil)))       "overline nil")
(defface oaqu '((t (:overline "#00ffff"))) "overline aqua/cyan")
(defface oblu '((t (:overline "#0000ff"))) "overline blue")
(defface ofuc '((t (:overline "#ff00ff"))) "overline fuchsia/magenta")
(defface ogra '((t (:overline "#bfbfbf"))) "overline gray75")
(defface ogre '((t (:overline "#008000"))) "overline green")
(defface olim '((t (:overline "#00ff00"))) "overline lime")
(defface omar '((t (:overline "#800000"))) "overline maroon/brown")
(defface onav '((t (:overline "#000080"))) "overline navy")
(defface ooli '((t (:overline "#bfbf00"))) "overline olive")
(defface oora '((t (:overline "#ff8000"))) "overline orange")
(defface opin '((t (:overline "#ff80ff"))) "overline pink")
(defface opur '((t (:overline "#bf00bf"))) "overline purple")
(defface ored '((t (:overline "#ff0000"))) "overline red")
(defface osky '((t (:overline "#0080ff"))) "overline sky blue")
(defface otea '((t (:overline "#00bfbf"))) "overline teal")
(defface ovio '((t (:overline "#8000ff"))) "overline violet")
(defface oyel '((t (:overline "#ffff00"))) "overline yellow")

                                        ; s strike-through
(defface sdef '((t (:strike-through "#000000"))) "strike-through default")
(defface snil '((t (:strike-through nil)))       "strike-through nil")
(defface saqu '((t (:strike-through "#00ffff"))) "strike-through aqua/cyan")
(defface sblu '((t (:strike-through "#0000ff"))) "strike-through blue")
(defface sfuc '((t (:strike-through "#ff00ff"))) "strike-through fuchsia/magenta")
(defface sgra '((t (:strike-through "#bfbfbf"))) "strike-through gray75")
(defface sgre '((t (:strike-through "#008000"))) "strike-through green")
(defface slim '((t (:strike-through "#00ff00"))) "strike-through lime")
(defface smar '((t (:strike-through "#800000"))) "strike-through maroon/brown")
(defface snav '((t (:strike-through "#000080"))) "strike-through navy")
(defface soli '((t (:strike-through "#bfbf00"))) "strike-through olive")
(defface sora '((t (:strike-through "#ff8000"))) "strike-through orange")
(defface spin '((t (:strike-through "#ff80ff"))) "strike-through pink")
(defface spur '((t (:strike-through "#bf00bf"))) "strike-through purple")
(defface sred '((t (:strike-through "#ff0000"))) "strike-through red")
(defface ssky '((t (:strike-through "#0080ff"))) "strike-through sky blue")
(defface stea '((t (:strike-through "#00bfbf"))) "strike-through teal")
(defface svio '((t (:strike-through "#8000ff"))) "strike-through violet")
(defface syel '((t (:strike-through "#ffff00"))) "strike-through yellow")

                                        ; u underline
(defface udef '((t (:underline "#000000"))) "underline default")
(defface unil '((t (:underline nil)))       "underline nil")
(defface uaqu '((t (:underline "#00ffff"))) "underline aqua/cyan")
(defface ublu '((t (:underline "#0000ff"))) "underline blue")
(defface ufuc '((t (:underline "#ff00ff"))) "underline fuchsia/magenta")
(defface ugra '((t (:underline "#bfbfbf"))) "underline gray75")
(defface ugre '((t (:underline "#008000"))) "underline green")
(defface ulim '((t (:underline "#00ff00"))) "underline lime")
(defface umar '((t (:underline "#800000"))) "underline maroon/brown")
(defface unav '((t (:underline "#000080"))) "underline navy")
(defface uoli '((t (:underline "#bfbf00"))) "underline olive")
(defface uora '((t (:underline "#ff8000"))) "underline orange")
(defface upin '((t (:underline "#ff80ff"))) "underline pink")
(defface upur '((t (:underline "#bf00bf"))) "underline purple")
(defface ured '((t (:underline "#ff0000"))) "underline red")
(defface usky '((t (:underline "#0080ff"))) "underline sky blue")
(defface utea '((t (:underline "#00bfbf"))) "underline teal")
(defface uvio '((t (:underline "#8000ff"))) "underline violet")
(defface uyel '((t (:underline "#ffff00"))) "underline yellow")

                                        ; o box
(defface xdef '((t (:box nil)))                                      "box default")
(defface xaqu '((t (:box (:line-width (-2 . -2) :color "#00ffff")))) "box aqua/cyan")
(defface xblu '((t (:box (:line-width (-2 . -2) :color "#0000ff")))) "box blue")
(defface xfuc '((t (:box (:line-width (-2 . -2) :color "#ff00ff")))) "box fuchsia/magenta")
(defface xgra '((t (:box (:line-width (-2 . -2) :color "#bfbfbf")))) "box gray75")
(defface xgre '((t (:box (:line-width (-2 . -2) :color "#008000")))) "box green")
(defface xlim '((t (:box (:line-width (-2 . -2) :color "#00ff00")))) "box lime")
(defface xmar '((t (:box (:line-width (-2 . -2) :color "#800000")))) "box maroon/brown")
(defface xnav '((t (:box (:line-width (-2 . -2) :color "#000080")))) "box navy")
(defface xoli '((t (:box (:line-width (-2 . -2) :color "#bfbf00")))) "box olive")
(defface xora '((t (:box (:line-width (-2 . -2) :color "#ff8000")))) "box orange")
(defface xpin '((t (:box (:line-width (-2 . -2) :color "#ff80ff")))) "box pink")
(defface xpur '((t (:box (:line-width (-2 . -2) :color "#bf00bf")))) "box purple")
(defface xred '((t (:box (:line-width (-2 . -2) :color "#ff0000")))) "box red")
(defface xsky '((t (:box (:line-width (-2 . -2) :color "#0080ff")))) "box sky blue")
(defface xtea '((t (:box (:line-width (-2 . -2) :color "#00bfbf")))) "box teal")
(defface xvio '((t (:box (:line-width (-2 . -2) :color "#8000ff")))) "box violet")
(defface xyel '((t (:box (:line-width (-2 . -2) :color "#ffff00")))) "box yellow")

(defface header1 '((t (:weight bold :height 1.15))) "weight bold height 1.15")
(defface header2 '((t (:weight bold :height 1.10))) "weight bold height 1.10")
(defface header3 '((t (:weight bold :height 1.05))) "weight bold height 1.05")
(defface grayheader1 '((t (:weight bold :height 1.15 :foreground "#bfbfbf"))) "weight bold height 1.15 foreground gray75")
(defface grayheader2 '((t (:weight bold :height 1.10 :foreground "#bfbfbf"))) "weight bold height 1.10 foreground gray75")
(defface grayheader3 '((t (:weight bold :height 1.05 :foreground "#bfbfbf"))) "weight bold height 1.05 foreground gray75")
(defface half '((t (:height 0.5))) "height 0.5")
(defface small '((t (:height 0.75))) "height 0.75")

(setq enriched-translations
      '((face
         (header1 "header1")(header2 "header2")(header3 "header3")
         (grayheader1 "grayheader1")(grayheader2 "grayheader2")(grayheader3 "grayheader3")
         (small "small")(half "half")
         (fdef "fdef")(bdef "bdef")(odef "odef")(sdef "sdef")(udef "udef")(xdef "xdef")
         (fnil "fnil")(bnil "bnil")(onil "onil")(snil "snil")(unil "unil")(xnil "xnil")
         (faqu "faqu")(baqu "baqu")(oaqu "oaqu")(saqu "saqu")(uaqu "uaqu")(xaqu "xaqu")
         (fblu "fblu")(bblu "bblu")(oblu "oblu")(sblu "sblu")(ublu "ublu")(xblu "xblu")
         (ffuc "ffuc")(bfuc "bfuc")(ofuc "ofuc")(sfuc "sfuc")(ufuc "ufuc")(xfuc "xfuc")
         (fgra "fgra")(bgra "bgra")(ogra "ogra")(sgra "sgra")(ugra "ugra")(xgra "xgra")
         (fgre "fgre")(bgre "bgre")(ogre "ogre")(sgre "sgre")(ugre "ugre")(xgre "xgre")
         (flim "flim")(blim "blim")(olim "olim")(slim "slim")(ulim "ulim")(xlim "xlim")
         (fmar "fmar")(bmar "bmar")(omar "omar")(smar "smar")(umar "umar")(xmar "xmar")
         (fnav "fnav")(bnav "bnav")(onav "onav")(snav "snav")(unav "unav")(xnav "xnav")
         (foli "foli")(boli "boli")(ooli "ooli")(soli "soli")(uoli "uoli")(xoli "xoli")
         (fora "fora")(bora "bora")(oora "oora")(sora "sora")(uora "uora")(xora "xora")
         (fpin "fpin")(bpin "bpin")(opin "opin")(spin "spin")(upin "upin")(xpin "xpin")
         (fpur "fpur")(bpur "bpur")(opur "opur")(spur "spur")(upur "upur")(xpur "xpur")
         (fred "fred")(bred "bred")(ored "ored")(sred "sred")(ured "ured")(xred "xred")
         (fsky "fsky")(bsky "bsky")(osky "osky")(ssky "ssky")(usky "usky")(xsky "xsky")
         (ftea "ftea")(btea "btea")(otea "otea")(stea "stea")(utea "utea")(xtea "xtea")
         (fvio "fvio")(bvio "bvio")(ovio "ovio")(svio "svio")(uvio "uvio")(xvio "xvio")
         (fyel "fyel")(byel "byel")(oyel "oyel")(syel "syel")(uyel "uyel")(xyel "xyel")
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
;;                                      face lists                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq ffaces '(faqu fblu fora ffuc fgre fpur fmar flim fnav fpin foli fred fsky ftea fvio fwhi fgra fyel))
(setq bfaces '(baqu bblu bora bfuc bgre bpur bmar blim bnav bpin boli bred bsky btea bvio bwhi bgra byel))
(setq ofaces '(oaqu oblu oora ofuc ogre opur omar olim onav opin ooli ored osky otea ovio owhi ogra oyel))
(setq sfaces '(saqu sblu sora sfuc sgre spur smar slim snav spin soli sred ssky stea svio swhi sgra syel))
(setq ufaces '(uaqu ublu uora ufuc ugre upur umar ulim unav upin uoli ured usky utea uvio uwhi ugra uyel))
(setq xfaces '(xaqu xblu xora xfuc xgre xpur xmar xlim xnav xpin xoli xred xsky xtea xvio xwhi xgra xyel))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                              exclusive face modes                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-minor-mode only-fg-faces-minor-mode "OnlyFG" nil " OnlyFG" nil)
(define-minor-mode only-bg-faces-minor-mode "OnlyBG" nil " OnlyBG" nil)
(define-minor-mode only-ol-faces-minor-mode "OnlyOL" nil " OnlyOL" nil)
(define-minor-mode only-st-faces-minor-mode "OnlyST" nil " OnlyST" nil)
(define-minor-mode only-ul-faces-minor-mode "OnlyUL" nil " OnlyUL" nil)
(define-minor-mode only-bx-faces-minor-mode "OnlyBX" nil " OnlyBX" nil)

(defun disable-only-faces-modes()
  (interactive)
  (only-fg-faces-minor-mode -1)
  (only-bg-faces-minor-mode -1)
  (only-ol-faces-minor-mode -1)
  (only-st-faces-minor-mode -1)
  (only-ul-faces-minor-mode -1)
  (only-bx-faces-minor-mode -1))

(defun select-face(face-or-color)
  "Based on the selected exclusive mode and the provided face or its color, return a face"
  (interactive)
  (cond
   ((symbolp face-or-color) face-or-color)
   (only-fg-faces-minor-mode (intern (concat "f" face-or-color)))
   (only-bg-faces-minor-mode (intern (concat "b" face-or-color)))
   (only-ol-faces-minor-mode (intern (concat "o" face-or-color)))
   (only-st-faces-minor-mode (intern (concat "s" face-or-color)))
   (only-ul-faces-minor-mode (intern (concat "u" face-or-color)))
   (only-bx-faces-minor-mode (intern (concat "b" face-or-color)))
   (t (intern (concat "f" face-or-color)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                    face functions                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun set-face-region-or-word(face-or-color beg end)
  (interactive)
  (let ((face (select-face face-or-color)))
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
            (facemenu-set-face face (point) end))))))))

(defun set-face-region-or-row(face beg end)
  (interactive)
  (cond
   (mark-active
    (progn
      ;(message "Setting face %s to region" face)
      (facemenu-set-face face beg end)))
   ((and (looking-at "[ \n]") (looking-back " ")))
   (t
    (progn
      ;(message "Setting face %s to region" face)
      (facemenu-set-face face (line-beginning-position) (line-end-position))))))

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
        (if (looking-at "[ \n]")
            (facemenu-set-face 'default (point) (1+ (point))))
        (right-char)))))

(global-set-key (kbd "M-o DEL") 'defaultify-blanks-region)

(defun show-faces(faces)
  (interactive)
  (dolist (face faces) (face-remap-reset-base face)))

(defun hide-faces(faces)
  (interactive)
  (dolist (face faces) (face-remap-set-base face nil)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                      face keys                                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                                        ;M-o b bold M-o d default M-o i italic M-o l bold-italic M-o m enriched-toggle-markup M-o o facemenu-set-face M-o u underline
(global-set-key (kbd "M-o a") (lambda(b e)(interactive "r")(set-face-region-or-word 'faqu b e)))
(global-set-key (kbd "M-o c") (lambda(b e)(interactive "r")(set-face-region-or-word 'fblu b e)))
(global-set-key (kbd "M-o e") (lambda(b e)(interactive "r")(set-face-region-or-word 'fora b e)))
(global-set-key (kbd "M-o f") (lambda(b e)(interactive "r")(set-face-region-or-word 'ffuc b e)))
(global-set-key (kbd "M-o g") (lambda(b e)(interactive "r")(set-face-region-or-word 'fgre b e)))
(global-set-key (kbd "M-o h") (lambda(b e)(interactive "r")(set-face-region-or-word 'fpur b e)))
(global-set-key (kbd "M-o j") (lambda(b e)(interactive "r")(set-face-region-or-word 'fmar b e)))
(global-set-key (kbd "M-o k") (lambda(b e)(interactive "r")(set-face-region-or-word 'flim b e)))
(global-set-key (kbd "M-o n") (lambda(b e)(interactive "r")(set-face-region-or-word 'fnav b e)))
(global-set-key (kbd "M-o p") (lambda(b e)(interactive "r")(set-face-region-or-word 'fpin b e)))
(global-set-key (kbd "M-o q") (lambda(b e)(interactive "r")(set-face-region-or-word 'foli b e)))
(global-set-key (kbd "M-o r") (lambda(b e)(interactive "r")(set-face-region-or-word 'fred b e)))
(global-set-key (kbd "M-o s") (lambda(b e)(interactive "r")(set-face-region-or-word 'fsky b e)))
(global-set-key (kbd "M-o t") (lambda(b e)(interactive "r")(set-face-region-or-word 'ftea b e)))
(global-set-key (kbd "M-o v") (lambda(b e)(interactive "r")(set-face-region-or-word 'fvio b e)))
(global-set-key (kbd "M-o x") (lambda(b e)(interactive "r")(set-face-region-or-word 'fgra b e)))
(global-set-key (kbd "M-o y") (lambda(b e)(interactive "r")(set-face-region-or-word 'fyel b e)))

(global-set-key (kbd "M-o A") (lambda(b e)(interactive "r")(set-face-region-or-word 'baqu b e)))
(global-set-key (kbd "M-o C") (lambda(b e)(interactive "r")(set-face-region-or-word 'bblu b e)))
(global-set-key (kbd "M-o E") (lambda(b e)(interactive "r")(set-face-region-or-word 'bora b e)))
(global-set-key (kbd "M-o F") (lambda(b e)(interactive "r")(set-face-region-or-word 'bfuc b e)))
(global-set-key (kbd "M-o G") (lambda(b e)(interactive "r")(set-face-region-or-word 'bgre b e)))
(global-set-key (kbd "M-o H") (lambda(b e)(interactive "r")(set-face-region-or-word 'bpur b e)))
(global-set-key (kbd "M-o J") (lambda(b e)(interactive "r")(set-face-region-or-word 'bmar b e)))
(global-set-key (kbd "M-o K") (lambda(b e)(interactive "r")(set-face-region-or-word 'blim b e)))
(global-set-key (kbd "M-o N") (lambda(b e)(interactive "r")(set-face-region-or-word 'bnav b e)))
(global-set-key (kbd "M-o P") (lambda(b e)(interactive "r")(set-face-region-or-word 'bpin b e)))
(global-set-key (kbd "M-o Q") (lambda(b e)(interactive "r")(set-face-region-or-word 'boli b e)))
(global-set-key (kbd "M-o R") (lambda(b e)(interactive "r")(set-face-region-or-word 'bred b e)))
(global-set-key (kbd "M-o S") (lambda(b e)(interactive "r")(set-face-region-or-word 'bsky b e)))
(global-set-key (kbd "M-o T") (lambda(b e)(interactive "r")(set-face-region-or-word 'btea b e)))
(global-set-key (kbd "M-o V") (lambda(b e)(interactive "r")(set-face-region-or-word 'bvio b e)))
(global-set-key (kbd "M-o X") (lambda(b e)(interactive "r")(set-face-region-or-word 'bgra b e)))
(global-set-key (kbd "M-o Y") (lambda(b e)(interactive "r")(set-face-region-or-word 'byel b e)))

(global-set-key (kbd "M-o C-a") (lambda(b e)(interactive "r")(set-face-region-or-word 'oaqu b e)))
(global-set-key (kbd "M-o C-c") (lambda(b e)(interactive "r")(set-face-region-or-word 'oblu b e)))
(global-set-key (kbd "M-o C-e") (lambda(b e)(interactive "r")(set-face-region-or-word 'oora b e)))
(global-set-key (kbd "M-o C-f") (lambda(b e)(interactive "r")(set-face-region-or-word 'ofuc b e)))
(global-set-key (kbd "M-o C-g") (lambda(b e)(interactive "r")(set-face-region-or-word 'ogre b e)))
(global-set-key (kbd "M-o C-h") (lambda(b e)(interactive "r")(set-face-region-or-word 'opur b e)))
(global-set-key (kbd "M-o C-j") (lambda(b e)(interactive "r")(set-face-region-or-word 'omar b e)))
(global-set-key (kbd "M-o C-k") (lambda(b e)(interactive "r")(set-face-region-or-word 'olim b e)))
(global-set-key (kbd "M-o C-n") (lambda(b e)(interactive "r")(set-face-region-or-word 'onav b e)))
(global-set-key (kbd "M-o C-p") (lambda(b e)(interactive "r")(set-face-region-or-word 'opin b e)))
(global-set-key (kbd "M-o C-q") (lambda(b e)(interactive "r")(set-face-region-or-word 'ooli b e)))
(global-set-key (kbd "M-o C-r") (lambda(b e)(interactive "r")(set-face-region-or-word 'ored b e)))
(global-set-key (kbd "M-o C-s") (lambda(b e)(interactive "r")(set-face-region-or-word 'osky b e)))
(global-set-key (kbd "M-o C-t") (lambda(b e)(interactive "r")(set-face-region-or-word 'otea b e)))
(global-set-key (kbd "M-o C-v") (lambda(b e)(interactive "r")(set-face-region-or-word 'ovio b e)))
(global-set-key (kbd "M-o C-x") (lambda(b e)(interactive "r")(set-face-region-or-word 'ogra b e)))
(global-set-key (kbd "M-o C-y") (lambda(b e)(interactive "r")(set-face-region-or-word 'oyel b e)))

(global-set-key (kbd "M-o s-a") (lambda(b e)(interactive "r")(set-face-region-or-word 'saqu b e)))
(global-set-key (kbd "M-o s-c") (lambda(b e)(interactive "r")(set-face-region-or-word 'sblu b e)))
(global-set-key (kbd "M-o s-e") (lambda(b e)(interactive "r")(set-face-region-or-word 'sora b e)))
(global-set-key (kbd "M-o s-f") (lambda(b e)(interactive "r")(set-face-region-or-word 'sfuc b e)))
(global-set-key (kbd "M-o s-g") (lambda(b e)(interactive "r")(set-face-region-or-word 'sgre b e)))
(global-set-key (kbd "M-o s-h") (lambda(b e)(interactive "r")(set-face-region-or-word 'spur b e)))
(global-set-key (kbd "M-o s-j") (lambda(b e)(interactive "r")(set-face-region-or-word 'smar b e)))
(global-set-key (kbd "M-o s-k") (lambda(b e)(interactive "r")(set-face-region-or-word 'slim b e)))
(global-set-key (kbd "M-o s-n") (lambda(b e)(interactive "r")(set-face-region-or-word 'snav b e)))
(global-set-key (kbd "M-o s-p") (lambda(b e)(interactive "r")(set-face-region-or-word 'spin b e)))
(global-set-key (kbd "M-o s-q") (lambda(b e)(interactive "r")(set-face-region-or-word 'soli b e)))
(global-set-key (kbd "M-o s-r") (lambda(b e)(interactive "r")(set-face-region-or-word 'sred b e)))
(global-set-key (kbd "M-o s-s") (lambda(b e)(interactive "r")(set-face-region-or-word 'ssky b e)))
(global-set-key (kbd "M-o s-t") (lambda(b e)(interactive "r")(set-face-region-or-word 'stea b e)))
(global-set-key (kbd "M-o s-v") (lambda(b e)(interactive "r")(set-face-region-or-word 'svio b e)))
(global-set-key (kbd "M-o s-x") (lambda(b e)(interactive "r")(set-face-region-or-word 'sgra b e)))
(global-set-key (kbd "M-o s-y") (lambda(b e)(interactive "r")(set-face-region-or-word 'syel b e)))

(global-set-key (kbd "M-o M-a") (lambda(b e)(interactive "r")(set-face-region-or-word 'uaqu b e)))
(global-set-key (kbd "M-o M-c") (lambda(b e)(interactive "r")(set-face-region-or-word 'ublu b e)))
(global-set-key (kbd "M-o M-e") (lambda(b e)(interactive "r")(set-face-region-or-word 'uora b e)))
(global-set-key (kbd "M-o M-f") (lambda(b e)(interactive "r")(set-face-region-or-word 'ufuc b e)))
(global-set-key (kbd "M-o M-g") (lambda(b e)(interactive "r")(set-face-region-or-word 'ugre b e)))
(global-set-key (kbd "M-o M-h") (lambda(b e)(interactive "r")(set-face-region-or-word 'upur b e)))
(global-set-key (kbd "M-o M-j") (lambda(b e)(interactive "r")(set-face-region-or-word 'umar b e)))
(global-set-key (kbd "M-o M-k") (lambda(b e)(interactive "r")(set-face-region-or-word 'ulim b e)))
(global-set-key (kbd "M-o M-n") (lambda(b e)(interactive "r")(set-face-region-or-word 'unav b e)))
(global-set-key (kbd "M-o M-p") (lambda(b e)(interactive "r")(set-face-region-or-word 'upin b e)))
(global-set-key (kbd "M-o M-q") (lambda(b e)(interactive "r")(set-face-region-or-word 'uoli b e)))
(global-set-key (kbd "M-o M-r") (lambda(b e)(interactive "r")(set-face-region-or-word 'ured b e)))
(global-set-key (kbd "M-o M-s") (lambda(b e)(interactive "r")(set-face-region-or-word 'usky b e)))
(global-set-key (kbd "M-o M-t") (lambda(b e)(interactive "r")(set-face-region-or-word 'utea b e)))
(global-set-key (kbd "M-o M-v") (lambda(b e)(interactive "r")(set-face-region-or-word 'uvio b e)))
(global-set-key (kbd "M-o M-x") (lambda(b e)(interactive "r")(set-face-region-or-word 'ugra b e)))
(global-set-key (kbd "M-o M-y") (lambda(b e)(interactive "r")(set-face-region-or-word 'uyel b e)))

(global-set-key (kbd "M-o C-M-a") (lambda(b e)(interactive "r")(set-face-region-or-word 'oaqu b e)))
(global-set-key (kbd "M-o C-M-c") (lambda(b e)(interactive "r")(set-face-region-or-word 'oblu b e)))
(global-set-key (kbd "M-o C-M-e") (lambda(b e)(interactive "r")(set-face-region-or-word 'oora b e)))
(global-set-key (kbd "M-o C-M-f") (lambda(b e)(interactive "r")(set-face-region-or-word 'ofuc b e)))
(global-set-key (kbd "M-o C-M-g") (lambda(b e)(interactive "r")(set-face-region-or-word 'ogre b e)))
(global-set-key (kbd "M-o C-M-h") (lambda(b e)(interactive "r")(set-face-region-or-word 'opur b e)))
(global-set-key (kbd "M-o C-M-j") (lambda(b e)(interactive "r")(set-face-region-or-word 'omar b e)))
(global-set-key (kbd "M-o C-M-k") (lambda(b e)(interactive "r")(set-face-region-or-word 'olim b e)))
(global-set-key (kbd "M-o C-M-n") (lambda(b e)(interactive "r")(set-face-region-or-word 'onav b e)))
(global-set-key (kbd "M-o C-M-p") (lambda(b e)(interactive "r")(set-face-region-or-word 'opin b e)))
(global-set-key (kbd "M-o C-M-q") (lambda(b e)(interactive "r")(set-face-region-or-word 'ooli b e)))
(global-set-key (kbd "M-o C-M-r") (lambda(b e)(interactive "r")(set-face-region-or-word 'ored b e)))
(global-set-key (kbd "M-o C-M-s") (lambda(b e)(interactive "r")(set-face-region-or-word 'osky b e)))
(global-set-key (kbd "M-o C-M-t") (lambda(b e)(interactive "r")(set-face-region-or-word 'otea b e)))
(global-set-key (kbd "M-o C-M-v") (lambda(b e)(interactive "r")(set-face-region-or-word 'ovio b e)))
(global-set-key (kbd "M-o C-M-x") (lambda(b e)(interactive "r")(set-face-region-or-word 'ogra b e)))
(global-set-key (kbd "M-o C-M-y") (lambda(b e)(interactive "r")(set-face-region-or-word 'oyel b e)))

(global-set-key (kbd "M-o 1") (lambda(b e)(interactive "r")(set-face-region-or-row (intern (concat "hea" "der1")) b e)))
(global-set-key (kbd "M-o 2") (lambda(b e)(interactive "r")(set-face-region-or-row 'header2 b e)))
(global-set-key (kbd "M-o 3") (lambda(b e)(interactive "r")(set-face-region-or-row 'header3 b e)))
(global-set-key (kbd "M-o !") (lambda(b e)(interactive "r")(set-face-region-or-row 'grayheader1 b e)))
(global-set-key (kbd "M-o @") (lambda(b e)(interactive "r")(set-face-region-or-row 'grayheader2 b e)))
(global-set-key (kbd "M-o #") (lambda(b e)(interactive "r")(set-face-region-or-row 'grayheader3 b e)))
(global-set-key (kbd "M-o 4") (lambda(b e)(interactive "r")(set-face-region-or-row 'small b e)))
(global-set-key (kbd "M-o 5") (lambda(b e)(interactive "r")(set-face-region-or-row 'half b e)))
(global-set-key (kbd "M-o 9") 'facemenu-set-invisible)
(global-set-key (kbd "M-o 0") 'facemenu-remove-special)

(global-set-key (kbd "M-o b") (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
(global-set-key (kbd "M-o d") (lambda(b e)(interactive "r")(set-face-region-or-word 'default b e)))
(global-set-key (kbd "M-o i") (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
(global-set-key (kbd "M-o l") (lambda(b e)(interactive "r")(set-face-region-or-word 'bold-italic b e)))
(global-set-key (kbd "M-o u") (lambda(b e)(interactive "r")(set-face-region-or-word 'underline b e)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   face minor modes                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-minor-mode faces-minor-mode
  "Toggle Faces minor mode.
   When mode is enabled defines letter keys
   to set certain faces at the word at point"
  nil
  " Faces"
  '(
    ("a" . (lambda(b e)(interactive "r")(set-face-region-or-word "aqu" b e)))
    ("c" . (lambda(b e)(interactive "r")(set-face-region-or-word "blu" b e)))
    ("e" . (lambda(b e)(interactive "r")(set-face-region-or-word "ora" b e)))
    ("f" . (lambda(b e)(interactive "r")(set-face-region-or-word "fuc" b e)))
    ("g" . (lambda(b e)(interactive "r")(set-face-region-or-word "gre" b e)))
    ("h" . (lambda(b e)(interactive "r")(set-face-region-or-word "pur" b e)))
    ("j" . (lambda(b e)(interactive "r")(set-face-region-or-word "mar" b e)))
    ("k" . (lambda(b e)(interactive "r")(set-face-region-or-word "lim" b e)))
    ("n" . (lambda(b e)(interactive "r")(set-face-region-or-word "nav" b e)))
    ("p" . (lambda(b e)(interactive "r")(set-face-region-or-word "pin" b e)))
    ("q" . (lambda(b e)(interactive "r")(set-face-region-or-word "oli" b e)))
    ("r" . (lambda(b e)(interactive "r")(set-face-region-or-word "red" b e)))
    ("s" . (lambda(b e)(interactive "r")(set-face-region-or-word "sky" b e)))
    ("t" . (lambda(b e)(interactive "r")(set-face-region-or-word "tea" b e)))
    ("v" . (lambda(b e)(interactive "r")(set-face-region-or-word "vio" b e)))
    ("w" . (lambda(b e)(interactive "r")(set-face-region-or-word "def" b e)))
    ("x" . (lambda(b e)(interactive "r")(set-face-region-or-word "gra" b e)))
    ("y" . (lambda(b e)(interactive "r")(set-face-region-or-word "yel" b e)))
    ("z" . (lambda(b e)(interactive "r")(set-face-region-or-word "nil" b e)))

    ("A" . (lambda(b e)(interactive "r")(set-face-region-or-word 'baqu b e)))
    ("C" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bblu b e)))
    ("E" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bora b e)))
    ("F" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bfuc b e)))
    ("G" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bgre b e)))
    ("H" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bpur b e)))
    ("J" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bmar b e)))
    ("K" . (lambda(b e)(interactive "r")(set-face-region-or-word 'blim b e)))
    ("N" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bnav b e)))
    ("P" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bpin b e)))
    ("Q" . (lambda(b e)(interactive "r")(set-face-region-or-word 'boli b e)))
    ("R" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bred b e)))
    ("S" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bsky b e)))
    ("T" . (lambda(b e)(interactive "r")(set-face-region-or-word 'btea b e)))
    ("V" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bvio b e)))
    ("W" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bdef b e)))
    ("X" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bgra b e)))
    ("Y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'byel b e)))
    ("Z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bnil b e)))

    ("1" . (lambda(b e)(interactive "r")(set-face-region-or-row 'header1 b e)))
    ("2" . (lambda(b e)(interactive "r")(set-face-region-or-row 'header2 b e)))
    ("3" . (lambda(b e)(interactive "r")(set-face-region-or-row 'header3 b e)))
    ("!" . (lambda(b e)(interactive "r")(set-face-region-or-row 'grayheader1 b e)))
    ("@" . (lambda(b e)(interactive "r")(set-face-region-or-row 'grayheader2 b e)))
    ("#" . (lambda(b e)(interactive "r")(set-face-region-or-row 'grayheader3 b e)))
    ("4" . (lambda(b e)(interactive "r")(set-face-region-or-row 'small b e)))
    ("5" . (lambda(b e)(interactive "r")(set-face-region-or-row 'half b e)))
    ("9" . 'facemenu-set-invisible)
    ("0" . 'facemenu-remove-special)

    ("i" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
    ("l" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold-italic b e)))
    ("b" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
    ("d" . (lambda(b e)(interactive "r")(set-face-region-or-word 'default b e)))
    ("u" . (lambda(b e)(interactive "r")(set-face-region-or-word 'underline b e)))
    )
  (if faces-minor-mode
      (set-face-background 'cursor "red")
    (set-face-background 'cursor "black"))
  )

(global-set-key [f12] 'faces-minor-mode)

(define-minor-mode hide-fg-faces-minor-mode
  "Toggle minor mode for hiding foreground faces."
  nil " HideFG" nil
  (disable-only-faces-modes)
  (if hide-fg-faces-minor-mode (hide-faces ffaces) (show-faces ffaces)))
(global-set-key (kbd "s-f") 'hide-fg-faces-minor-mode)

(define-minor-mode hide-bg-faces-minor-mode
  "Toggle minor mode for hiding background faces."
  nil " HideBG" nil
  (disable-only-faces-modes)
  (if hide-bg-faces-minor-mode (hide-faces bfaces) (show-faces bfaces)))
(global-set-key (kbd "s-b") 'hide-bg-faces-minor-mode)

(define-minor-mode hide-ol-faces-minor-mode
  "Toggle minor mode for hiding overline faces."
  nil " HideOL" nil
  (disable-only-faces-modes)
  (if hide-ol-faces-minor-mode (hide-faces ofaces) (show-faces ofaces)))
(global-set-key (kbd "s-o") 'hide-ol-faces-minor-mode)

(define-minor-mode hide-st-faces-minor-mode
  "Toggle minor mode for hiding strike-through faces."
  nil " HideST" nil
  (disable-only-faces-modes)
  (if hide-st-faces-minor-mode (hide-faces sfaces) (show-faces sfaces)))
(global-set-key (kbd "s-s") 'hide-st-faces-minor-mode)

(define-minor-mode hide-ul-faces-minor-mode
  "Toggle minor mode for hiding underline faces."
  nil " HideUL" nil
  (disable-only-faces-modes)
  (if hide-ul-faces-minor-mode (hide-faces ufaces) (show-faces ufaces)))
(global-set-key (kbd "s-u") 'hide-ul-faces-minor-mode)

(define-minor-mode hide-bx-faces-minor-mode
  "Toggle minor mode for hiding box faces."
  nil " HideBX" nil
  (disable-only-faces-modes)
  (if hide-bx-faces-minor-mode (hide-faces xfaces) (show-faces xfaces)))
(global-set-key (kbd "s-x") 'hide-bx-faces-minor-mode)

(defun only-fg-faces()
  "Hide all faces except fg"
  (interactive)
  (disable-only-faces-modes)
  (if hide-fg-faces-minor-mode (hide-fg-faces-minor-mode 'toggle))
  (if (not hide-bg-faces-minor-mode) (hide-bg-faces-minor-mode 'toggle))
  (if (not hide-ol-faces-minor-mode) (hide-ol-faces-minor-mode 'toggle))
  (if (not hide-st-faces-minor-mode) (hide-st-faces-minor-mode 'toggle))
  (if (not hide-ul-faces-minor-mode) (hide-ul-faces-minor-mode 'toggle))
  (if (not hide-bx-faces-minor-mode) (hide-bx-faces-minor-mode 'toggle))
  (only-fg-faces-minor-mode))
(global-set-key (kbd "C-s-f") 'only-fg-faces)

(defun only-bg-faces()
  "Hide all faces except bg"
  (interactive)
  (disable-only-faces-modes)
  (if (not hide-fg-faces-minor-mode) (hide-fg-faces-minor-mode 'toggle))
  (if hide-bg-faces-minor-mode (hide-bg-faces-minor-mode 'toggle))
  (if (not hide-ol-faces-minor-mode) (hide-ol-faces-minor-mode 'toggle))
  (if (not hide-st-faces-minor-mode) (hide-st-faces-minor-mode 'toggle))
  (if (not hide-ul-faces-minor-mode) (hide-ul-faces-minor-mode 'toggle))
  (if (not hide-bx-faces-minor-mode) (hide-bx-faces-minor-mode 'toggle))
  (only-bg-faces-minor-mode))
(global-set-key (kbd "C-s-b") 'only-bg-faces)

(defun only-ol-faces()
  "Hide all faces except ol"
  (interactive)
  (disable-only-faces-modes)
  (if (not hide-fg-faces-minor-mode) (hide-fg-faces-minor-mode 'toggle))
  (if (not hide-bg-faces-minor-mode) (hide-bg-faces-minor-mode 'toggle))
  (if hide-ol-faces-minor-mode (hide-ol-faces-minor-mode 'toggle))
  (if (not hide-st-faces-minor-mode) (hide-st-faces-minor-mode 'toggle))
  (if (not hide-ul-faces-minor-mode) (hide-ul-faces-minor-mode 'toggle))
  (if (not hide-bx-faces-minor-mode) (hide-bx-faces-minor-mode 'toggle))
  (only-ol-faces-minor-mode))
(global-set-key (kbd "C-s-o") 'only-ol-faces)

(defun only-st-faces()
  "Hide all faces except st"
  (interactive)
  (disable-only-faces-modes)
  (if (not hide-fg-faces-minor-mode) (hide-fg-faces-minor-mode 'toggle))
  (if (not hide-bg-faces-minor-mode) (hide-bg-faces-minor-mode 'toggle))
  (if (not hide-ol-faces-minor-mode) (hide-ol-faces-minor-mode 'toggle))
  (if hide-st-faces-minor-mode (hide-st-faces-minor-mode 'toggle))
  (if (not hide-ul-faces-minor-mode) (hide-ul-faces-minor-mode 'toggle))
  (if (not hide-bx-faces-minor-mode) (hide-bx-faces-minor-mode 'toggle))
  (only-st-faces-minor-mode))
(global-set-key (kbd "C-s-s") 'only-st-faces)

(defun only-ul-faces()
  "Hide all faces except ul"
  (interactive)
  (disable-only-faces-modes)
  (if (not hide-fg-faces-minor-mode) (hide-fg-faces-minor-mode 'toggle))
  (if (not hide-bg-faces-minor-mode) (hide-bg-faces-minor-mode 'toggle))
  (if (not hide-ol-faces-minor-mode) (hide-ol-faces-minor-mode 'toggle))
  (if (not hide-st-faces-minor-mode) (hide-st-faces-minor-mode 'toggle))
  (if hide-ul-faces-minor-mode (hide-ul-faces-minor-mode 'toggle))
  (if (not hide-bx-faces-minor-mode) (hide-bx-faces-minor-mode 'toggle))
  (only-ul-faces-minor-mode))
(global-set-key (kbd "C-s-u") 'only-ul-faces)

(defun only-bx-faces()
  "Hide all faces except bx"
  (interactive)
  (disable-only-faces-modes)
  (if (not hide-fg-faces-minor-mode) (hide-fg-faces-minor-mode 'toggle))
  (if (not hide-bg-faces-minor-mode) (hide-bg-faces-minor-mode 'toggle))
  (if (not hide-ol-faces-minor-mode) (hide-ol-faces-minor-mode 'toggle))
  (if (not hide-st-faces-minor-mode) (hide-st-faces-minor-mode 'toggle))
  (if (not hide-ul-faces-minor-mode) (hide-ul-faces-minor-mode 'toggle))
  (if hide-bx-faces-minor-mode (hide-bx-faces-minor-mode 'toggle))
  (only-bx-faces-minor-mode))
(global-set-key (kbd "C-s-x") 'only-bx-faces)

(defun show-all-faces()
  "Show all faces"
  (interactive)
  (disable-only-faces-modes)
  (if hide-fg-faces-minor-mode (hide-fg-faces-minor-mode 'toggle))
  (if hide-bg-faces-minor-mode (hide-bg-faces-minor-mode 'toggle))
  (if hide-ol-faces-minor-mode (hide-ol-faces-minor-mode 'toggle))
  (if hide-st-faces-minor-mode (hide-st-faces-minor-mode 'toggle))
  (if hide-ul-faces-minor-mode (hide-ul-faces-minor-mode 'toggle))
  (if hide-bx-faces-minor-mode (hide-bx-faces-minor-mode 'toggle)))
(global-set-key (kbd "s-a") 'show-all-faces)
  
