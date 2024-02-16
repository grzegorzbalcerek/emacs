
(defface faqu '((t (:foreground "#00ffff" :weight normal))) "foreground aqua/cyan normal")
(defface fbla '((t (:foreground "#000000" :weight normal))) "foreground black normal")
(defface fblu '((t (:foreground "#0000ff" :weight normal))) "foreground blue normal")
(defface ffuc '((t (:foreground "#ff00ff" :weight normal))) "foreground fuchsia/magenta normal")
(defface fgra '((t (:foreground "#bfbfbf" :weight normal))) "foreground gray75 normal")
(defface fgre '((t (:foreground "#008000" :weight normal))) "foreground green normal")
(defface flim '((t (:foreground "#00ff00" :weight normal))) "foreground lime normal")
(defface fmar '((t (:foreground "#800000" :weight normal))) "foreground maroon/brown normal")
(defface fnav '((t (:foreground "#000080" :weight normal))) "foreground navy normal")
(defface foli '((t (:foreground "#808000" :weight normal))) "foreground olive normal")
(defface fora '((t (:foreground "#ff8000" :weight normal))) "foreground orange normal")
(defface fpin '((t (:foreground "#ff80ff" :weight normal))) "foreground pink normal")
(defface fred '((t (:foreground "#ff0000" :weight normal))) "foreground red normal")
(defface fsky '((t (:foreground "#0080ff" :weight normal))) "foreground sky blue normal")
(defface ftea '((t (:foreground "#008080" :weight normal))) "foreground teal normal")
(defface fwhi '((t (:foreground "#ffffff" :weight normal))) "foreground white normal")
(defface fvio '((t (:foreground "#8000ff" :weight normal))) "foreground violet normal")
(defface fyel '((t (:foreground "#ffff00" :weight normal))) "foreground yellow normal")

(defface faqub '((t (:foreground "#00ffff" :weight bold))) "foreground aqua/cyan bold")
(defface fblab '((t (:foreground "#000000" :weight bold))) "foreground black bold")
(defface fblub '((t (:foreground "#0000ff" :weight bold))) "foreground blue bold")
(defface ffucb '((t (:foreground "#ff00ff" :weight bold))) "foreground fuchsia/magenta bold")
(defface fgrab '((t (:foreground "#bfbfbf" :weight bold))) "foreground gray75 bold")
(defface fgreb '((t (:foreground "#008000" :weight bold))) "foreground green bold")
(defface flimb '((t (:foreground "#00ff00" :weight bold))) "foreground lime bold")
(defface fmarb '((t (:foreground "#800000" :weight bold))) "foreground maroon/brown bold")
(defface fnavb '((t (:foreground "#000080" :weight bold))) "foreground navy bold")
(defface folib '((t (:foreground "#808000" :weight bold))) "foreground olive bold")
(defface forab '((t (:foreground "#ff8000" :weight bold))) "foreground orange bold")
(defface fpinb '((t (:foreground "#ff80ff" :weight bold))) "foreground pink bold")
(defface fredb '((t (:foreground "#ff0000" :weight bold))) "foreground red bold")
(defface fskyb '((t (:foreground "#0080ff" :weight bold))) "foreground sky blue bold")
(defface fteab '((t (:foreground "#008080" :weight bold))) "foreground teal bold")
(defface fwhib '((t (:foreground "#ffffff" :weight bold))) "foreground white bold")
(defface fviob '((t (:foreground "#8000ff" :weight bold))) "foreground violet bold")
(defface fyelb '((t (:foreground "#ffff00" :weight bold))) "foreground yellow bold")

(defface baqu '((t (:background "#00ffff"))) "background aqua/cyan")
(defface bbla '((t (:background "#000000"))) "background black")
(defface bblu '((t (:background "#0000ff"))) "background blue")
(defface bfuc '((t (:background "#ff00ff"))) "background fuchsia/magenta")
(defface bgra '((t (:background "#bfbfbf"))) "background gray75")
(defface bgre '((t (:background "#008000"))) "background green")
(defface blim '((t (:background "#00ff00"))) "background lime")
(defface bmar '((t (:background "#800000"))) "background maroon/brown")
(defface bnav '((t (:background "#000080"))) "background navy")
(defface boli '((t (:background "#808000"))) "background olive")
(defface bora '((t (:background "#ff8000"))) "background orange")
(defface bpin '((t (:background "#ff80ff"))) "background pink")
(defface bred '((t (:background "#ff0000"))) "background red")
(defface bsky '((t (:background "#0080ff"))) "background sky blue")
(defface btea '((t (:background "#008080"))) "background teal")
(defface bwhi '((t (:background "#ffffff"))) "background white")
(defface bvio '((t (:background "#8000ff"))) "background violet")
(defface byel '((t (:background "#ffff00"))) "background yellow")

(defface header1 '((t (:weight bold :height 1.15))) "weight bold height 1.15")
(defface header2 '((t (:weight bold :height 1.10))) "weight bold height 1.10")
(defface header3 '((t (:weight bold :height 1.05))) "weight bold height 1.05")
(defface half '((t (:height 0.5))) "height 0.5")
(defface small '((t (:height 0.75))) "height 0.75")

(defun set-face-region-or-word(face beg end)
  (interactive)
  (cond
   (mark-active
    (progn
      ;(message "Setting face %s to region" face)
      (facemenu-set-face face beg end)))
   ((and (looking-at "[ \n]") (looking-back " "))
    (facemenu-set-face (car face)))
   (t
    (progn
      ;(message "Setting face %s to word" face)
      (save-excursion
        (if (looking-at "[.,;· \n]")
            (left-char 1))
        (forward-word 1)
        (let ((end (point)))
          (backward-word 1)
          (facemenu-set-face face (point) end)))))))

(defun set-face-region-or-row(face beg end)
  (interactive)
  (cond
   (mark-active
    (progn
      ;(message "Setting face %s to region" face)
      (facemenu-set-face face beg end)))
   ((and (looking-at "[ \n]") (looking-back " "))
    (facemenu-set-face (car face)))
   (t
    (progn
      ;(message "Setting face %s to region" face)
      (facemenu-set-face face (line-beginning-position) (line-end-position))))))

(setq enriched-translations
      '((face
         (half "half")
         (header1 "header1")
         (header2 "header2")
         (header3 "header3")
         (small "small")

         (faqu "faqu")
         (fbla "fbla")
         (fblu "fblu")
         (ffuc "ffuc")
         (fgra "fgra")
         (fgre "fgre")
         (flim "flim")
         (fmar "fmar")
         (fnav "fnav")
         (foli "foli")
         (fora "fora")
         (fpin "fpin")
         (fred "fred")
         (fsky "fsky")
         (ftea "ftea")
         (fwhi "fwhi")
         (fvio "fvio")
         (fyel "fyel")

         (faqub "faqub")
         (fblab "fblab")
         (fblub "fblub")
         (ffucb "ffucb")
         (fgrab "fgrab")
         (fgreb "fgreb")
         (flimb "flimb")
         (fmarb "fmarb")
         (fnavb "fnavb")
         (folib "folib")
         (forab "forab")
         (fpinb "fpinb")
         (fredb "fredb")
         (fskyb "fskyb")
         (fteab "fteab")
         (fwhib "fwhib")
         (fviob "fviob")
         (fyelb "fyelb")

         (baqu "baqu")
         (bbla "bbla")
         (bblu "bblu")
         (bfuc "bfuc")
         (bgra "bgra")
         (bgre "bgre")
         (blim "blim")
         (bmar "bmar")
         (bnav "bnav")
         (boli "boli")
         (bora "bora")
         (bpin "bpin")
         (bred "bred")
         (bsky "bsky")
         (btea "btea")
         (bwhi "bwhi")
         (bvio "bvio")
         (byel "byel")

         (bold-italic "bi")
         (bold "b")
         (italic "i")
         (underline "u")
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

(defun show-face()
  (interactive)
  (message "face: %s" (get-text-property (point) 'face)))

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

(define-minor-mode faces-minor-mode
  "Toggle Faces minor mode.
   When mode is enabled defines letter keys
   to set certain faces at the word at point"
  nil
  " Faces"
  '(
    ("a" . (lambda(b e)(interactive "r")(set-face-region-or-word 'faqu b e)))
    ("c" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fblu b e)))
    ("e" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fora b e)))
    ("f" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ffuc b e)))
    ("g" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fgre b e)))
    ("k" . (lambda(b e)(interactive "r")(set-face-region-or-word 'flim b e)))
    ("m" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fmar b e)))
    ("n" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fnav b e)))
    ("p" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fpin b e)))
    ("q" . (lambda(b e)(interactive "r")(set-face-region-or-word 'foli b e)))
    ("r" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fred b e)))
    ("s" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fsky b e)))
    ("t" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ftea b e)))
    ("v" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fvio b e)))
    ("w" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fwhi b e)))
    ("x" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fgra b e)))
    ("y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fyel b e)))
    ("z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fbla b e)))

    ("A" . (lambda(b e)(interactive "r")(set-face-region-or-word 'faqub b e)))
    ("C" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fblub b e)))
    ("E" . (lambda(b e)(interactive "r")(set-face-region-or-word 'forab b e)))
    ("F" . (lambda(b e)(interactive "r")(set-face-region-or-word 'ffucb b e)))
    ("G" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fgreb b e)))
    ("K" . (lambda(b e)(interactive "r")(set-face-region-or-word 'flimb b e)))
    ("M" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fmarb b e)))
    ("N" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fnavb b e)))
    ("P" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fpinb b e)))
    ("Q" . (lambda(b e)(interactive "r")(set-face-region-or-word 'folib b e)))
    ("R" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fredb b e)))
    ("S" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fskyb b e)))
    ("T" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fteab b e)))
    ("V" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fviob b e)))
    ("W" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fwhib b e)))
    ("X" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fgrab b e)))
    ("Y" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fyelb b e)))
    ("Z" . (lambda(b e)(interactive "r")(set-face-region-or-word 'fblab b e)))

    ("1" . (lambda(b e)(interactive "r")(set-face-region-or-row 'header1 b e)))
    ("2" . (lambda(b e)(interactive "r")(set-face-region-or-row 'header2 b e)))
    ("3" . (lambda(b e)(interactive "r")(set-face-region-or-row 'header3 b e)))
    ("4" . (lambda(b e)(interactive "r")(set-face-region-or-row 'default b e)))
    ("5" . (lambda(b e)(interactive "r")(set-face-region-or-row 'half b e)))
    ("6" . (lambda(b e)(interactive "r")(set-face-region-or-row 'small b e)))
    ("9" . 'facemenu-set-invisible)
    ("0" . 'facemenu-remove-special)

    ("i" . (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e nil)))
    ("l" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold-italic b e nil)))
    ("b" . (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e nil)))
    ("d" . (lambda(b e)(interactive "r")(set-face-region-or-word 'default b e nil)))
    ("u" . (lambda(b e)(interactive "r")(set-face-region-or-word 'underline b e nil)))
    )
  (if faces-minor-mode
      (set-face-background 'cursor "red")
    (set-face-background 'cursor "black"))
  )

(global-set-key (kbd "M-o a") 'set-face-aqu-region-or-word)
(global-set-key (kbd "M-o a") (lambda(b e)(interactive "r")(set-face-region-or-word 'faqu b e)))
(global-set-key (kbd "M-o c") (lambda(b e)(interactive "r")(set-face-region-or-word 'fblu b e)))
(global-set-key (kbd "M-o e") (lambda(b e)(interactive "r")(set-face-region-or-word 'fora b e)))
(global-set-key (kbd "M-o f") (lambda(b e)(interactive "r")(set-face-region-or-word 'ffuc b e)))
(global-set-key (kbd "M-o g") (lambda(b e)(interactive "r")(set-face-region-or-word 'fgre b e)))
(global-set-key (kbd "M-o j") (lambda(b e)(interactive "r")(set-face-region-or-word 'fmar b e)))
(global-set-key (kbd "M-o k") (lambda(b e)(interactive "r")(set-face-region-or-word 'flim b e)))
(global-set-key (kbd "M-o n") (lambda(b e)(interactive "r")(set-face-region-or-word 'fnav b e)))
(global-set-key (kbd "M-o p") (lambda(b e)(interactive "r")(set-face-region-or-word 'fpin b e)))
(global-set-key (kbd "M-o q") (lambda(b e)(interactive "r")(set-face-region-or-word 'foli b e)))
(global-set-key (kbd "M-o r") (lambda(b e)(interactive "r")(set-face-region-or-word 'fred b e)))
(global-set-key (kbd "M-o s") (lambda(b e)(interactive "r")(set-face-region-or-word 'fsky b e)))
(global-set-key (kbd "M-o t") (lambda(b e)(interactive "r")(set-face-region-or-word 'ftea b e)))
(global-set-key (kbd "M-o v") (lambda(b e)(interactive "r")(set-face-region-or-word 'fvio b e)))
(global-set-key (kbd "M-o w") (lambda(b e)(interactive "r")(set-face-region-or-word 'fwhi b e)))
(global-set-key (kbd "M-o x") (lambda(b e)(interactive "r")(set-face-region-or-word 'fgra b e)))
(global-set-key (kbd "M-o y") (lambda(b e)(interactive "r")(set-face-region-or-word 'fyel b e)))
(global-set-key (kbd "M-o z") (lambda(b e)(interactive "r")(set-face-region-or-word 'fbla b e)))

(global-set-key (kbd "M-o A") (lambda(b e)(interactive "r")(set-face-region-or-word 'faqub b e)))
(global-set-key (kbd "M-o C") (lambda(b e)(interactive "r")(set-face-region-or-word 'fblub b e)))
(global-set-key (kbd "M-o E") (lambda(b e)(interactive "r")(set-face-region-or-word 'forab b e)))
(global-set-key (kbd "M-o F") (lambda(b e)(interactive "r")(set-face-region-or-word 'ffucb b e)))
(global-set-key (kbd "M-o G") (lambda(b e)(interactive "r")(set-face-region-or-word 'fgreb b e)))
(global-set-key (kbd "M-o J") (lambda(b e)(interactive "r")(set-face-region-or-word 'fmarb b e)))
(global-set-key (kbd "M-o K") (lambda(b e)(interactive "r")(set-face-region-or-word 'flimb b e)))
(global-set-key (kbd "M-o N") (lambda(b e)(interactive "r")(set-face-region-or-word 'fnavb b e)))
(global-set-key (kbd "M-o P") (lambda(b e)(interactive "r")(set-face-region-or-word 'fpinb b e)))
(global-set-key (kbd "M-o Q") (lambda(b e)(interactive "r")(set-face-region-or-word 'folib b e)))
(global-set-key (kbd "M-o R") (lambda(b e)(interactive "r")(set-face-region-or-word 'fredb b e)))
(global-set-key (kbd "M-o S") (lambda(b e)(interactive "r")(set-face-region-or-word 'fskyb b e)))
(global-set-key (kbd "M-o T") (lambda(b e)(interactive "r")(set-face-region-or-word 'fteab b e)))
(global-set-key (kbd "M-o V") (lambda(b e)(interactive "r")(set-face-region-or-word 'fviob b e)))
(global-set-key (kbd "M-o W") (lambda(b e)(interactive "r")(set-face-region-or-word 'fwhib b e)))
(global-set-key (kbd "M-o X") (lambda(b e)(interactive "r")(set-face-region-or-word 'fgrab b e)))
(global-set-key (kbd "M-o Y") (lambda(b e)(interactive "r")(set-face-region-or-word 'fyelb b e)))
(global-set-key (kbd "M-o Z") (lambda(b e)(interactive "r")(set-face-region-or-word 'fblab b e)))

(global-set-key (kbd "M-o M-a") (lambda(b e)(interactive "r")(set-face-region-or-word 'baqu b e)))
(global-set-key (kbd "M-o M-c") (lambda(b e)(interactive "r")(set-face-region-or-word 'bblu b e)))
(global-set-key (kbd "M-o M-e") (lambda(b e)(interactive "r")(set-face-region-or-word 'bora b e)))
(global-set-key (kbd "M-o M-f") (lambda(b e)(interactive "r")(set-face-region-or-word 'bfuc b e)))
(global-set-key (kbd "M-o M-g") (lambda(b e)(interactive "r")(set-face-region-or-word 'bgre b e)))
(global-set-key (kbd "M-o M-j") (lambda(b e)(interactive "r")(set-face-region-or-word 'bmar b e)))
(global-set-key (kbd "M-o M-k") (lambda(b e)(interactive "r")(set-face-region-or-word 'blim b e)))
(global-set-key (kbd "M-o M-n") (lambda(b e)(interactive "r")(set-face-region-or-word 'bnav b e)))
(global-set-key (kbd "M-o M-p") (lambda(b e)(interactive "r")(set-face-region-or-word 'bpin b e)))
(global-set-key (kbd "M-o M-q") (lambda(b e)(interactive "r")(set-face-region-or-word 'boli b e)))
(global-set-key (kbd "M-o M-r") (lambda(b e)(interactive "r")(set-face-region-or-word 'bred b e)))
(global-set-key (kbd "M-o M-s") (lambda(b e)(interactive "r")(set-face-region-or-word 'bsky b e)))
(global-set-key (kbd "M-o M-t") (lambda(b e)(interactive "r")(set-face-region-or-word 'btea b e)))
(global-set-key (kbd "M-o M-v") (lambda(b e)(interactive "r")(set-face-region-or-word 'bvio b e)))
(global-set-key (kbd "M-o M-w") (lambda(b e)(interactive "r")(set-face-region-or-word 'bwhi b e)))
(global-set-key (kbd "M-o M-x") (lambda(b e)(interactive "r")(set-face-region-or-word 'bgra b e)))
(global-set-key (kbd "M-o M-y") (lambda(b e)(interactive "r")(set-face-region-or-word 'byel b e)))
(global-set-key (kbd "M-o M-z") (lambda(b e)(interactive "r")(set-face-region-or-word 'bbla b e)))

(global-set-key (kbd "M-o 1") (lambda(b e)(interactive "r")(set-face-region-or-row 'header1 b e)))
(global-set-key (kbd "M-o 2") (lambda(b e)(interactive "r")(set-face-region-or-row 'header2 b e)))
(global-set-key (kbd "M-o 3") (lambda(b e)(interactive "r")(set-face-region-or-row 'header3 b e)))
(global-set-key (kbd "M-o 4") (lambda(b e)(interactive "r")(set-face-region-or-row 'default b e)))
(global-set-key (kbd "M-o 5") (lambda(b e)(interactive "r")(set-face-region-or-row 'half b e)))
(global-set-key (kbd "M-o 6") (lambda(b e)(interactive "r")(set-face-region-or-row 'small b e)))
(global-set-key (kbd "M-o 9") 'facemenu-set-invisible)
(global-set-key (kbd "M-o 0") 'facemenu-remove-special)

(global-set-key (kbd "M-o i") (lambda(b e)(interactive "r")(set-face-region-or-word 'italic b e)))
(global-set-key (kbd "M-o l") (lambda(b e)(interactive "r")(set-face-region-or-word 'bold-italic b e)))
(global-set-key (kbd "M-o b") (lambda(b e)(interactive "r")(set-face-region-or-word 'bold b e)))
(global-set-key (kbd "M-o d") (lambda(b e)(interactive "r")(set-face-region-or-word 'default b e)))
(global-set-key (kbd "M-o u") (lambda(b e)(interactive "r")(set-face-region-or-word 'underline b e)))

(global-set-key (kbd "M-o DEL") 'defaultify-blanks-region)

                                      ;M-o m enriched-toggle-markup
                                      ;M-o o facemenu-set-face

(global-set-key [C-f12] 'show-face)
(global-set-key [f12] 'faces-minor-mode)
