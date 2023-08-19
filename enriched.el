
(defface aqu '((t (:foreground "#00ffff"))) "foreground aqua/cyan")
(defface blu '((t (:foreground "#0000ff"))) "foreground blue")
(defface fuc '((t (:foreground "#ff00ff"))) "foreground fuchsia/magenta")
(defface gre '((t (:foreground "#008000"))) "foreground green")
(defface lim '((t (:foreground "#00ff00"))) "foreground lime")
(defface mar '((t (:foreground "#800000"))) "foreground maroon/brown")
(defface nav '((t (:foreground "#000080"))) "foreground navy")
(defface oli '((t (:foreground "#808000"))) "foreground olive")
(defface ora '((t (:foreground "#ff8000"))) "foreground orange")
(defface pin '((t (:foreground "#ff80ff"))) "foreground pink")
(defface red '((t (:foreground "#ff0000"))) "foreground red")
(defface sky '((t (:foreground "#0080ff"))) "foreground sky blue")
(defface tea '((t (:foreground "#008080"))) "foreground teal")
(defface vio '((t (:foreground "#8000ff"))) "foreground violet")


(defface header1 '((t (:weight bold :height 1.15))) "weight bold height 1.15")
(defface header2 '((t (:weight bold :height 1.10))) "weight bold height 1.10")
(defface header3 '((t (:weight bold :height 1.05))) "weight bold height 1.05")
(defface header4 '((t (:weight bold))) "weight bold")
(defface header5 '((t (:weight bold))) "weight bold")
(defface header6 '((t (:weight bold))) "weight bold")

(defface notes1 '((t (:foreground "gray75" :height 1.15))) "foreground gray75 height 1.15")
(defface notes2 '((t (:foreground "gray75" :height 1.10))) "foreground gray75 height 1.10")
(defface notes3 '((t (:foreground "gray75" :height 1.05))) "foreground gray75 height 1.05")
(defface notes4 '((t (:foreground "gray75"))) "foreground gray75")
(defface notes5 '((t (:foreground "gray75"))) "foreground gray75")
(defface notes6 '((t (:foreground "gray75"))) "foreground gray75")

(defface todo1 '((t (:foreground "red" :height 1.15))) "foreground red height 1.15")
(defface todo2 '((t (:foreground "red" :height 1.10))) "foreground red height 1.10")
(defface todo3 '((t (:foreground "red" :height 1.05))) "foreground red height 1.05")
(defface todo4 '((t (:foreground "red"))) "foreground red")
(defface todo5 '((t (:foreground "red"))) "foreground red")
(defface todo6 '((t (:foreground "red"))) "foreground red")


(defun intelligent-set-face(face beg end)
  (interactive)
  (cond
   (mark-active
    (progn
      (message "Setting face %s to region" face)
      (facemenu-set-face face beg end)))
   ((and (looking-at "[ \n]") (looking-back " "))
    (facemenu-set-face (car face)))
   (t
    (progn
      (message "Setting face %s to word" face)
      (save-excursion
        (if (looking-at "[.,;· \n]")
            (left-char 1))
        (forward-word 1)
        (let ((end (point)))
          (backward-word 1)
          (facemenu-set-face face (point) end)))))))

(defun set-face-aqu-region(b e)(interactive "r")(intelligent-set-face 'aqu b e))
(defun set-face-blu-region(b e)(interactive "r")(intelligent-set-face 'blu b e))
(defun set-face-fuc-region(b e)(interactive "r")(intelligent-set-face 'fuc b e))
(defun set-face-gre-region(b e)(interactive "r")(intelligent-set-face 'gre b e))
(defun set-face-lim-region(b e)(interactive "r")(intelligent-set-face 'lim b e))
(defun set-face-mar-region(b e)(interactive "r")(intelligent-set-face 'mar b e))
(defun set-face-nav-region(b e)(interactive "r")(intelligent-set-face 'nav b e))
(defun set-face-oli-region(b e)(interactive "r")(intelligent-set-face 'oli b e))
(defun set-face-ora-region(b e)(interactive "r")(intelligent-set-face 'ora b e))
(defun set-face-pin-region(b e)(interactive "r")(intelligent-set-face 'pin b e))
(defun set-face-red-region(b e)(interactive "r")(intelligent-set-face 'red b e))
(defun set-face-sky-region(b e)(interactive "r")(intelligent-set-face 'sky b e))
(defun set-face-tea-region(b e)(interactive "r")(intelligent-set-face 'tea b e))
(defun set-face-vio-region(b e)(interactive "r")(intelligent-set-face 'vio b e))
(defun set-face-aqub-region(b e)(interactive "r")(intelligent-set-face 'aqu b e)(intelligent-set-face 'bold b e))
(defun set-face-blub-region(b e)(interactive "r")(intelligent-set-face 'blu b e)(intelligent-set-face 'bold b e))
(defun set-face-fucb-region(b e)(interactive "r")(intelligent-set-face 'fuc b e)(intelligent-set-face 'bold b e))
(defun set-face-greb-region(b e)(interactive "r")(intelligent-set-face 'gre b e)(intelligent-set-face 'bold b e))
(defun set-face-limb-region(b e)(interactive "r")(intelligent-set-face 'lim b e)(intelligent-set-face 'bold b e))
(defun set-face-marb-region(b e)(interactive "r")(intelligent-set-face 'mar b e)(intelligent-set-face 'bold b e))
(defun set-face-navb-region(b e)(interactive "r")(intelligent-set-face 'nav b e)(intelligent-set-face 'bold b e))
(defun set-face-olib-region(b e)(interactive "r")(intelligent-set-face 'oli b e)(intelligent-set-face 'bold b e))
(defun set-face-orab-region(b e)(interactive "r")(intelligent-set-face 'ora b e)(intelligent-set-face 'bold b e))
(defun set-face-pinb-region(b e)(interactive "r")(intelligent-set-face 'pin b e)(intelligent-set-face 'bold b e))
(defun set-face-redb-region(b e)(interactive "r")(intelligent-set-face 'red b e)(intelligent-set-face 'bold b e))
(defun set-face-skyb-region(b e)(interactive "r")(intelligent-set-face 'sky b e)(intelligent-set-face 'bold b e))
(defun set-face-teab-region(b e)(interactive "r")(intelligent-set-face 'tea b e)(intelligent-set-face 'bold b e))
(defun set-face-viob-region(b e)(interactive "r")(intelligent-set-face 'vio b e)(intelligent-set-face 'bold b e))
(defun set-face-bold-region(b e)(interactive "r")(intelligent-set-face 'bold b e))
(defun set-face-italic-region(b e)(interactive "r")(intelligent-set-face 'italic b e))
(defun set-face-default-region(b e)(interactive "r")(intelligent-set-face 'default b e))

(define-minor-mode faces-minor-mode
  "Toggle Faces minor mode.
   When mode is enabled defines letter keys
   to set certain faces at the word at point"
  nil
  " Faces"
  '(
    ("a" . set-face-aqu-region)
    ("A" . set-face-aqub-region)
    ("b" . set-face-bold-region)
    ;c
    ("d" . set-face-default-region)
    ("e" . set-face-ora-region)
    ("E" . set-face-orab-region)
    ("f" . set-face-fuc-region)
    ("F" . set-face-fucb-region)
    ("g" . set-face-gre-region)
    ("G" . set-face-greb-region)
    ;h
    ("i" . set-face-italic-region)
    ;j
    ;k
    ("l" . set-face-lim-region)
    ("L" . set-face-limb-region)
    ("m" . set-face-mar-region)
    ("M" . set-face-marb-region)
    ("n" . set-face-nav-region)
    ("N" . set-face-navb-region)
    ("p" . set-face-pin-region)
    ("P" . set-face-pinb-region)
    ("q" . set-face-oli-region)
    ("Q" . set-face-olib-region)
    ("r" . set-face-red-region)
    ("R" . set-face-redb-region)
    ("s" . set-face-sky-region)
    ("S" . set-face-skyb-region)
    ("t" . set-face-tea-region)
    ("T" . set-face-teab-region)
    ("u" . set-face-blu-region)
    ("U" . set-face-blub-region)
    ("v" . set-face-vio-region)
    ("V" . set-face-viob-region)
    ;w
    ;y
    )
  )

(defun set-tabs-times-n(n)
  "set the variable tab-stop-list at 2 and then at n, n*2, n*3…"
  (interactive "p")
  (let ((new-tab-stop-list (list 2 n (* n 2) (* n 3) (* n 4) (* n 5) (* n 6))))
    (setq-local tab-stop-list new-tab-stop-list)
    (message "tab-stop-list set to %s" new-tab-stop-list)))


(defun tab-fill-region(b e)
  "relocates pieces of text that are separated by at least 2 spaces
   accodring to the tab list"
  (interactive "r")
  (let ((beg (copy-marker b nil))
        (end (copy-marker e t)))
    (message "tab-fill-region 1")
    (save-excursion
      (goto-char beg)
      (while (re-search-forward "  +\\| *\t+[ \t]*" end t)
        (replace-match "  ")
        (tab-to-tab-stop)))))

(defun join-next-word()
  (interactive)
  (replace-next-re " +" " "))

(setq enriched-translations
      '((face
         (header1 "header1")
         (header2 "header2")
         (header3 "header3")
         (header4 "header4")
         (header5 "header5")
         (header6 "header6")
         (notes1 "notes1")
         (notes2 "notes2")
         (notes3 "notes3")
         (notes4 "notes4")
         (notes5 "notes5")
         (notes6 "notes6")
         (aqu "aqu")
         (blu "blu")
         (fuc "fuc")
         (gre "gre")
         (lim "lim")
         (mar "mar")
         (nav "nav")
         (oli "oli")
         (ora "ora")
         (pin "pin")
         (red "red")
         (sky "sky")
         (tea "tea")
         (vio "vio")
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

(defun title-face-region(beg end prefix)
  "format all outlines in the region by adding prefixN faces"
  (goto-char beg)
  (while (re-search-forward "^\\([*]+\\) .*$" end t)
    (let* ((level (length (buffer-substring (match-beginning 1) (match-end 1))))
           (face (format "%s%d" prefix level)))
      (facemenu-set-face 'default (match-beginning 0) (match-end 0))
      (facemenu-set-face (intern face) (match-beginning 0) (match-end 0)))))

(defun header-face-for-line()
  "sets the right header face for the current line"
  (interactive)
  (title-face-region (point-at-bol)(point-at-eol) "header"))

(defun notes-face-for-line()
  "sets the right notes face for the current line"
  (interactive)
  (title-face-region (point-at-bol)(point-at-eol) "notes"))

(defun todo-face-for-line()
  "sets the right todo face for the current line"
  (interactive)
  (title-face-region (point-at-bol)(point-at-eol) "todo"))

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

(defun insert-newline()
  (reindent-then-newline-and-indent)
  (beginning-of-line)
  (delete-whitespace-rectangle (line-beginning-position) (line-end-position)))

(defun newline-and-solid-line()
  (interactive)
  (insert-newline)
  (insert "——————————————————————————————————————————————————————————————————————————————————————————"))

(defun newline-and-dotted-line()
  (interactive)
  (insert-newline)
  (insert "··························································································"))

(defun prefixed-newline(prefix)
  (interactive "P")
  (cond
   ((equal prefix '(4)) (newline-and-solid-line))
   ((equal prefix 0) (newline-and-dotted-line))
   (t (insert-newline))))

(defun title-org-cycle(prefix)
  (interactive "P")
  (let ((cycle
         (save-excursion
           (beginning-of-line)
           (if (looking-at "[*]+ ") t nil))))
    (if cycle 
        (org-cycle prefix)
      (tab-to-tab-stop))))

(defun enriched-mode-customizations()
  (interactive)
  (modify-syntax-entry ?· ".")
  (modify-syntax-entry ?· ".")
  (modify-syntax-entry ?\‚ "(’")
  (modify-syntax-entry ?\’ ")‚")
  (modify-syntax-entry ?\„ "(”")
  (modify-syntax-entry ?\” ")„")
  (setq-local outline-minor-mode-prefix "")
  (setq-local indent-line-function 'tab-to-tab-stop)
  (outline-minor-mode)
  (local-set-key (kbd "M-o a") (lambda(b e)(interactive "r")(intelligent-set-face 'aqu b e)))
  (local-set-key (kbd "M-o b") (lambda(b e)(interactive "r")(set-face-bold-region b e)))
                                        ;c
  (local-set-key (kbd "M-o d") (lambda(b e)(interactive "r")(set-face-default-region b e)))
  (local-set-key (kbd "M-o e") (lambda(b e)(interactive "r")(intelligent-set-face 'ora b e)))
  (local-set-key (kbd "M-o f") (lambda(b e)(interactive "r")(intelligent-set-face 'fuc b e)))
  (local-set-key (kbd "M-o g") (lambda(b e)(interactive "r")(intelligent-set-face 'gre b e)))
                                        ;h
  (local-set-key (kbd "M-o i") (lambda(b e)(interactive "r")(set-face-italic-region b e)))
                                        ;j
                                        ;k
  (local-set-key (kbd "M-o l") (lambda(b e)(interactive "r")(intelligent-set-face 'lim b e)))
  (local-set-key (kbd "M-o m") (lambda(b e)(interactive "r")(intelligent-set-face 'mar b e)))
  (local-set-key (kbd "M-o n") (lambda(b e)(interactive "r")(intelligent-set-face 'nav b e)))
                                        ;o
  (local-set-key (kbd "M-o p") (lambda(b e)(interactive "r")(intelligent-set-face 'pin b e)))
  (local-set-key (kbd "M-o q") (lambda(b e)(interactive "r")(intelligent-set-face 'oli b e)))
  (local-set-key (kbd "M-o r") (lambda(b e)(interactive "r")(intelligent-set-face 'red b e)))
  (local-set-key (kbd "M-o s") (lambda(b e)(interactive "r")(intelligent-set-face 'sky b e)))
  (local-set-key (kbd "M-o t") (lambda(b e)(interactive "r")(intelligent-set-face 'tea b e)))
  (local-set-key (kbd "M-o u") (lambda(b e)(interactive "r")(intelligent-set-face 'blu b e)))
  (local-set-key (kbd "M-o v") (lambda(b e)(interactive "r")(intelligent-set-face 'vio b e)))
                                        ;w
                                        ;y
                                        ;z
  (local-set-key [tab] 'title-org-cycle)
  (local-set-key [return] 'prefixed-newline)
  (local-set-key [C-return] 'newline-and-solid-line)
  (local-set-key [M-return] 'newline-and-dotted-line)
  (local-set-key [C-tab] 'join-next-word)
  (local-set-key [?\M-\r] (lambda()(interactive)(insert "\n")))
  (local-set-key [C-f1] 'notes-face-for-line)
  (local-set-key [C-f2] 'header-face-for-line)
  (local-set-key [C-f3] 'todo-face-for-line)
  (local-set-key [f5] 'facemenu-set-invisible)
  (local-set-key [f6] 'facemenu-remove-special)
  (local-set-key [f7] 'defaultify-blanks-region)
  (local-set-key [C-f7] 'show-face)
  (local-set-key [f8] 'tab-fill-region)
  (local-set-key [C-f8] 'set-tabs-times-n)
  (local-set-key [M-f8] 'edit-tab-stops)
  (local-set-key [f12] 'faces-minor-mode)
  (local-set-key [tool-bar isearch-forward] 'yank-replace-region)
  (local-set-key (kbd "C-a") 'beginning-of-line)
  )

(add-hook 'enriched-mode-hook 'enriched-mode-customizations)
