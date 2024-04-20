;;; -*- lexical-biding: t -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                         tabs                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun count-spaces-back()
  "Count spaces to the left of point in the current line"
  (save-excursion
    (if (or (bolp) (looking-back "[^ ]"))
        0
      (backward-char)
      (1+ (count-spaces-back)))))

(defun column-widths-line()
  "Calculate the width of colums of the current line based on its text"
  (interactive)
  (move-beginning-of-line 1)
  (if (looking-at "[ ·—|]*\n") nil
      (let ((result nil)
            (last-col-beg 0))
        (while (< (point) (pos-eol))
          (cond
           ((looking-at "|")
            (if (not (equal last-col-beg -1))
                (setq result (cons (- (current-column) (count-spaces-back) last-col-beg) result)))
            (setq result (cons -1 result))
            (setq last-col-beg -1))
           ((and (looking-at "[^ —·\n]")(equal last-col-beg -1))
            (setq last-col-beg (current-column)))
           ((and (looking-back "[ —·][ —·]") (looking-at "[^ —·\n]"))
            (setq result (cons (- (current-column) (count-spaces-back) last-col-beg) result))
        (setq last-col-beg (current-column))))
          (forward-char 1))
        (if (> last-col-beg 0)
            (setq result (cons (- (current-column) (count-spaces-back) last-col-beg) result)))
        (setq result (reverse result))
        result)))
                                  
(defun zip-group-max(lst1 lst2)
  "Return a list by zipping the lists and calculating max for each position
   but separatly for each groups separated by -1"
  (cond
   ((null lst1) lst2)
   ((null lst2) lst1) 
   ((and (equal (car lst1) -1) (not (equal (car lst2) -1)))
    (cons (car lst2) (zip-group-max lst1 (cdr lst2))))
   ((and (not (equal (car lst1) -1)) (equal (car lst2) -1))
    (cons (car lst1) (zip-group-max (cdr lst1) lst2)))
   (t
    (cons (max (car lst1) (car lst2)) (zip-group-max (cdr lst1) (cdr lst2))))))

(defun column-widths-region(beg end)
  "Calculate the width of colums of the current region
  taking into account only rows and columns in the rectangle delimited by beg and end
  and such that columns that separate tabs have prefix empty spaces"
  (interactive "r")
  (save-excursion
    (let* ((beg-line (line-number-at-pos beg))
           (end-line (line-number-at-pos end))
           (number-of-lines (1+ (- end-line beg-line)))
           (result nil))
      (goto-char beg)
      (move-beginning-of-line 1)
      (dotimes (j number-of-lines)
        (setq result (zip-group-max result (column-widths-line)))
        (next-line))
      result)))

(defun align-sep-line(widths sep1 sep2)
  (while (not (looking-at "\n")) (delete-char 1))
  (dolist (width column-widths)
    (if (equal width -1)
        (insert sep1 sep2)
      (insert (make-string width sep2)))))
  
(defun align-line(column-widths)
  "Align the current line according to the provided column column widths"
  (move-beginning-of-line 1)
  (cond
   ((looking-at "[ ]*\n"))
   ((looking-at "[ |]*\n") (align-sep-line column-widths ?| ? ))
   ((looking-at "[ —|]*\n") (align-sep-line column-widths ?  ?—))
   ((looking-at "[ ·|]*\n") (align-sep-line column-widths ?  ?·))
   ((looking-at "[ ·—|]*\n"))
   (t
    (dolist (width column-widths)
      (let ((init-pos (point)))
        (while (looking-at " ") (delete-char 1))
        (if (equal width -1)
            (if (looking-at "|")
                (progn (forward-char 1)(insert " "))
              (insert "| "))
          (while (and (not (looking-at "  ")) (not (looking-at "[|\n]")))
            (forward-char 1))
          (insert (make-string (max 0 (- width (- (point) init-pos))) ? ))))))))

(defun add-column-separators(widths sep-width)
  "Add sep-width spaces to each item in ws except before -1 add 1 and and to -1 and before end do not add"
  (cond
   ((equal widths nil) nil)
   ((equal (cdr widths) nil) widths)
   ((equal (cadr widths) -1)
    (cons (1+ (car widths)) (add-column-separators (cdr widths) sep-width)))
   (t
    (cons (if (> (car widths) 0) (+ sep-width (car widths)) (car widths))
            (add-column-separators (cdr widths) sep-width)))))

(defun align-region(separator-width)
  "Aligh region along columns and | characters"
  (interactive "p")
  (message "(align-region %d)" separator-width)
  (if (not mark-active)
      (error "align-region called but mark is not active"))
  (save-excursion
    (let* ((beg (min (point) (mark)))
           (end (max (point) (mark)))
           (beg-line (line-number-at-pos beg))
           (end-line (line-number-at-pos end))
           (number-of-lines (1+ (- end-line beg-line)))
           (columns
            (if (> separator-width 0)
                (add-column-separators (column-widths-region beg end) (if (equal separator-width 1) 4 separator-width))
              (mapcar (lambda (n) (if (> n 0) (- separator-width) n)) (column-widths-region beg end)))))
      (message "columns: %s" columns)
      (goto-char beg)
      (move-beginning-of-line 1)
      (dotimes (j number-of-lines)
        (align-line columns)
        (next-line)))))

(defun tab-cycle(prefix p)
  (interactive "P\np")
  (let ((cycle
         (save-excursion
           (beginning-of-line)
           (if (looking-at outline-regexp) t nil))))
    (if mark-active
        (align-region p)
      (if cycle
          (if (functionp 'outline-cycle)
              (outline-cycle prefix)
            (org-cycle))
        (tab-to-tab-stop)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                         lines                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun pipe-column-widths()
  "Calculate the width of colums of the current line based on the location of pipes"
  (interactive)
  (move-beginning-of-line 1)
  (let ((result nil)
        (n 0))
    (while (< (point) (pos-eol))
      (if (looking-at "|")
          (progn
            (if (> n 0) (setq result (cons n result)))
            (setq result (cons -1 result))
            (setq n 0))
        (setq n (1+ n)))
      (forward-char))
    (reverse result)))

(defun insert-spaces-and-pipes(widths)
  (interactive)
  (dolist (width widths)
    (if (>= width 0)
        (insert (make-string width ? ))
      (insert "|"))))

(defun insert-line-below-with-pipes()
  (interactive)
  (save-excursion
    (let ((widths (pipe-column-widths)))
      (move-end-of-line 1)
      (insert "\n")
      (insert-spaces-and-pipes widths))))

(defun insert-line-above-with-pipes()
  (interactive)
  (save-excursion
    (let ((widths (pipe-column-widths)))
      (move-beginning-of-line 1)
      (insert "\n")
      (backward-char)
      (insert-spaces-and-pipes widths))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                         cells                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun split-cell()
  "Move the text from point to pipe to the column below"
  (interactive)
  (let ((num-pipes-left 0))
    (save-excursion
      (while (> (point) (pos-bol))
        (backward-char)
        (if (looking-at "|") (setq num-pipes-left (1+ num-pipes-left)))))
    (let ((end-of-cell
           (save-excursion
             (while (not (looking-at "[|\n]")) (forward-char))
             (point))))
      (let ((content (string-trim (delete-and-extract-region (point) end-of-cell))))
        (next-line)
        (move-beginning-of-line 1)
        (dotimes (x num-pipes-left) (re-search-forward "|"))
        (insert content "  ")
        (while (looking-at " ") (delete-char 1))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                         other                                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun insert-newline()
  (reindent-then-newline-and-indent)
  (beginning-of-line)
  (delete-whitespace-rectangle (line-beginning-position) (line-end-position)))

(defun prefixed-newline(prefix)
  (interactive "P")
  (cond
   ((equal prefix '(4)) (newline-and-solid-line))
   ((equal prefix 0) (newline-and-dotted-line))
   (t (insert-newline))))

(defun enriched-mode-customizations()
  (interactive)
  (message "enriched-mode-customizations")
  (modify-syntax-entry ?· ".")
  (modify-syntax-entry ?· ".")
  (modify-syntax-entry ?\‚ "(’")
  (modify-syntax-entry ?\’ ")‚")
  (modify-syntax-entry ?\„ "(”")
  (modify-syntax-entry ?\” ")„")
  (setq-local outline-regexp "[*—]+")
  ;(setq-local outline-minor-mode-prefix "")
  (setq-local indent-line-function 'tab-to-tab-stop)
  (outline-minor-mode)
  (local-set-key [tab] 'tab-cycle)
  (local-set-key (kbd "<M-S-up>") 'insert-line-below-with-pipes)
  (local-set-key (kbd "<M-S-down>") 'insert-line-above-with-pipes)
  (local-set-key (kbd "<M-return>") 'split-cell)
  (local-set-key [return] 'prefixed-newline)
  (local-set-key [?\M-\r] (lambda()(interactive)(insert "\n")))
  (local-set-key (kbd "C-a") 'beginning-of-line)
  )

(add-hook 'enriched-mode-hook 'enriched-mode-customizations)

