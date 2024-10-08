;;; -*- lexical-biding: t -*-

(provide 'unicode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  unicode to a char                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ucode-to-char()
  (interactive)
  (set-mark-command nil)
  (search-backward-regexp "[^0-9a-fA-F]")
  (forward-char 1)
  (let ((v (buffer-substring (region-beginning)(region-end))))
    (kill-region(region-beginning)(region-end))
    (insert-char (string-to-number v 16))))
(global-set-key (kbd "s-X") 'ucode-to-char)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                        keys                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "<C-S-SPC>") (lambda(n)(interactive "p")(self-insert-command n ? )))

(global-set-key (kbd "s-<") (lambda(n)(interactive "p")(self-insert-command n ?«)))
(global-set-key (kbd "s->") (lambda(n)(interactive "p")(self-insert-command n ?»)))

(global-set-key (kbd "s-'") (lambda(n)(interactive "p")(self-insert-command n ?‚)))
(global-set-key (kbd "s-\"") (lambda(n)(interactive "p")(self-insert-command n ?„)))
(global-set-key (kbd "s-]") (lambda(n)(interactive "p")(self-insert-command n ?’)))
(global-set-key (kbd "s-}") (lambda(n)(interactive "p")(self-insert-command n ?”)))

(global-set-key (kbd "s-|") (lambda(n)(interactive "p")(self-insert-command n ?‛)))
(global-set-key (kbd "s-\\") (lambda(n)(interactive "p")(self-insert-command n ?‟)))
(global-set-key (kbd "s-[") (lambda(n)(interactive "p")(self-insert-command n ?‘)))
(global-set-key (kbd "s-{") (lambda(n)(interactive "p")(self-insert-command n ?“)))

(global-set-key (kbd "s-.") (lambda(n)(interactive "p")(self-insert-command n ?·)))
(global-set-key (kbd "s-*") (lambda(n)(interactive "p")(self-insert-command n ?•)))
(global-set-key (kbd "s-:") (lambda(n)(interactive "p")(self-insert-command n ?…)))

(global-set-key (kbd "C-$") (lambda(n)(interactive "p")(self-insert-command n ?§)))

(global-set-key (kbd "C-c x") (lambda(n)(interactive "p")(self-insert-command n ?☒)))
(global-set-key (kbd "C-c v") (lambda(n)(interactive "p")(self-insert-command n ?☑)))

                                        ; dashes
(global-set-key (kbd "s--") (lambda(n)(interactive "p")(self-insert-command n ?−))) ; minus x2212
(global-set-key (kbd "s-2") (lambda(n)(interactive "p")(self-insert-command n ?‒))) ; figure-dash x2012
(global-set-key (kbd "s-3") (lambda(n)(interactive "p")(self-insert-command n ?–))) ; en-dash x2013
(global-set-key (kbd "s-4") (lambda(n)(interactive "p")(self-insert-command n ?—))) ; em-dash x2014
(global-set-key (kbd "s-5") (lambda(n)(interactive "p")(self-insert-command n ?―))) ; horizontal-bar x2015
(global-set-key (kbd "C-c - -") (lambda(n)(interactive "p")(self-insert-command n ?−))) ; minus x2212
(global-set-key (kbd "C-c - 2") (lambda(n)(interactive "p")(self-insert-command n ?‒))) ; figure-dash x2012
(global-set-key (kbd "C-c - 3") (lambda(n)(interactive "p")(self-insert-command n ?–))) ; en-dash x2013
(global-set-key (kbd "C-c - 4") (lambda(n)(interactive "p")(self-insert-command n ?—))) ; em-dash x2014
(global-set-key (kbd "C-c - 5") (lambda(n)(interactive "p")(self-insert-command n ?―))) ; horizontal-bar x2015
                                        ; apice (it) = superscript
(global-set-key (kbd "C-c a 1") (lambda(n)(interactive "p")(self-insert-command n ?¹)))
(global-set-key (kbd "C-c a 2") (lambda(n)(interactive "p")(self-insert-command n ?²)))
(global-set-key (kbd "C-c a 3") (lambda(n)(interactive "p")(self-insert-command n ?³)))
(global-set-key (kbd "C-c a 4") (lambda(n)(interactive "p")(self-insert-command n ?⁴)))
(global-set-key (kbd "C-c a 5") (lambda(n)(interactive "p")(self-insert-command n ?⁵)))
(global-set-key (kbd "C-c a 6") (lambda(n)(interactive "p")(self-insert-command n ?⁶)))
(global-set-key (kbd "C-c a 7") (lambda(n)(interactive "p")(self-insert-command n ?⁷)))
(global-set-key (kbd "C-c a 8") (lambda(n)(interactive "p")(self-insert-command n ?⁸)))
(global-set-key (kbd "C-c a 9") (lambda(n)(interactive "p")(self-insert-command n ?⁹)))
(global-set-key (kbd "C-c a 0") (lambda(n)(interactive "p")(self-insert-command n ?⁰)))
                                        ; double arrow
(global-set-key (kbd "C-c d 1") (lambda(n)(interactive "p")(self-insert-command n ?⇖)))
(global-set-key (kbd "C-c d 2") (lambda(n)(interactive "p")(self-insert-command n ?⇑)))
(global-set-key (kbd "C-c d 3") (lambda(n)(interactive "p")(self-insert-command n ?⇗)))
(global-set-key (kbd "C-c d 4") (lambda(n)(interactive "p")(self-insert-command n ?⇐)))
(global-set-key (kbd "C-c d 5") (lambda(n)(interactive "p")(self-insert-command n ?⇕)))
(global-set-key (kbd "C-c d 6") (lambda(n)(interactive "p")(self-insert-command n ?⇒)))
(global-set-key (kbd "C-c d 7") (lambda(n)(interactive "p")(self-insert-command n ?⇘)))
(global-set-key (kbd "C-c d 8") (lambda(n)(interactive "p")(self-insert-command n ?⇓)))
(global-set-key (kbd "C-c d 9") (lambda(n)(interactive "p")(self-insert-command n ?⇙)))
(global-set-key (kbd "C-c d 0") (lambda(n)(interactive "p")(self-insert-command n ?⇔)))
                                        ; freccia (it) = arrow
(global-set-key (kbd "C-c f 1") (lambda(n)(interactive "p")(self-insert-command n ?↖)))
(global-set-key (kbd "C-c f 2") (lambda(n)(interactive "p")(self-insert-command n ?↑)))
(global-set-key (kbd "C-c f 3") (lambda(n)(interactive "p")(self-insert-command n ?↗)))
(global-set-key (kbd "C-c f 4") (lambda(n)(interactive "p")(self-insert-command n ?←)))
(global-set-key (kbd "C-c f 5") (lambda(n)(interactive "p")(self-insert-command n ?↕)))
(global-set-key (kbd "C-c f 6") (lambda(n)(interactive "p")(self-insert-command n ?→)))
(global-set-key (kbd "C-c f 7") (lambda(n)(interactive "p")(self-insert-command n ?↙)))
(global-set-key (kbd "C-c f 8") (lambda(n)(interactive "p")(self-insert-command n ?↓)))
(global-set-key (kbd "C-c f 9") (lambda(n)(interactive "p")(self-insert-command n ?↘)))
(global-set-key (kbd "C-c f 0") (lambda(n)(interactive "p")(self-insert-command n ?↔)))
                                        ; accent grave `
(global-set-key (kbd "C-c ` a") (lambda(n)(interactive "p")(self-insert-command n ?à)))
(global-set-key (kbd "C-c ` A") (lambda(n)(interactive "p")(self-insert-command n ?À)))
(global-set-key (kbd "C-c ` e") (lambda(n)(interactive "p")(self-insert-command n ?è)))
(global-set-key (kbd "C-c ` E") (lambda(n)(interactive "p")(self-insert-command n ?È)))
(global-set-key (kbd "C-c ` u") (lambda(n)(interactive "p")(self-insert-command n ?ù)))
(global-set-key (kbd "C-c ` U") (lambda(n)(interactive "p")(self-insert-command n ?Ù)))
                                        ; accent '
(global-set-key (kbd "C-c ' a") (lambda(n)(interactive "p")(self-insert-command n ?á)))
(global-set-key (kbd "C-c ' A") (lambda(n)(interactive "p")(self-insert-command n ?Á)))
(global-set-key (kbd "C-c ' e") (lambda(n)(interactive "p")(self-insert-command n ?é)))
(global-set-key (kbd "C-c ' E") (lambda(n)(interactive "p")(self-insert-command n ?É)))
(global-set-key (kbd "C-c ' i") (lambda(n)(interactive "p")(self-insert-command n ?í)))
(global-set-key (kbd "C-c ' I") (lambda(n)(interactive "p")(self-insert-command n ?Í)))
(global-set-key (kbd "C-c ' o") (lambda(n)(interactive "p")(self-insert-command n ?ó)))
(global-set-key (kbd "C-c ' O") (lambda(n)(interactive "p")(self-insert-command n ?Ó)))
(global-set-key (kbd "C-c ' u") (lambda(n)(interactive "p")(self-insert-command n ?ú)))
(global-set-key (kbd "C-c ' U") (lambda(n)(interactive "p")(self-insert-command n ?Ú)))
                                        ; accent ^
(global-set-key (kbd "C-c ^ a") (lambda(n)(interactive "p")(self-insert-command n ?â)))
(global-set-key (kbd "C-c ^ A") (lambda(n)(interactive "p")(self-insert-command n ?Â)))
(global-set-key (kbd "C-c ^ e") (lambda(n)(interactive "p")(self-insert-command n ?ê)))
(global-set-key (kbd "C-c ^ E") (lambda(n)(interactive "p")(self-insert-command n ?Ê)))
(global-set-key (kbd "C-c ^ i") (lambda(n)(interactive "p")(self-insert-command n ?î)))
(global-set-key (kbd "C-c ^ I") (lambda(n)(interactive "p")(self-insert-command n ?Î)))
(global-set-key (kbd "C-c ^ o") (lambda(n)(interactive "p")(self-insert-command n ?ô)))
(global-set-key (kbd "C-c ^ O") (lambda(n)(interactive "p")(self-insert-command n ?Ô)))
(global-set-key (kbd "C-c ^ u") (lambda(n)(interactive "p")(self-insert-command n ?û)))
(global-set-key (kbd "C-c ^ U") (lambda(n)(interactive "p")(self-insert-command n ?Û)))

(global-set-key (kbd "C-c - a") (lambda(n)(interactive "p")(self-insert-command n ?ā)))
(global-set-key (kbd "C-c - A") (lambda(n)(interactive "p")(self-insert-command n ?Ā)))
(global-set-key (kbd "C-c - e") (lambda(n)(interactive "p")(self-insert-command n ?ē)))
(global-set-key (kbd "C-c - E") (lambda(n)(interactive "p")(self-insert-command n ?Ē)))
(global-set-key (kbd "C-c - i") (lambda(n)(interactive "p")(self-insert-command n ?ī)))
(global-set-key (kbd "C-c - I") (lambda(n)(interactive "p")(self-insert-command n ?Ī)))
(global-set-key (kbd "C-c - o") (lambda(n)(interactive "p")(self-insert-command n ?ō)))
(global-set-key (kbd "C-c - O") (lambda(n)(interactive "p")(self-insert-command n ?Ō)))
(global-set-key (kbd "C-c - u") (lambda(n)(interactive "p")(self-insert-command n ?ū)))
(global-set-key (kbd "C-c - U") (lambda(n)(interactive "p")(self-insert-command n ?Ū)))

(global-set-key (kbd "C-c \" a") (lambda(n)(interactive "p")(self-insert-command n ?ä)))
(global-set-key (kbd "C-c \" A") (lambda(n)(interactive "p")(self-insert-command n ?Ä)))
(global-set-key (kbd "C-c \" e") (lambda(n)(interactive "p")(self-insert-command n ?ë)))
(global-set-key (kbd "C-c \" E") (lambda(n)(interactive "p")(self-insert-command n ?Ë)))
(global-set-key (kbd "C-c \" i") (lambda(n)(interactive "p")(self-insert-command n ?ï)))
(global-set-key (kbd "C-c \" I") (lambda(n)(interactive "p")(self-insert-command n ?Ï)))
(global-set-key (kbd "C-c \" o") (lambda(n)(interactive "p")(self-insert-command n ?ö)))
(global-set-key (kbd "C-c \" O") (lambda(n)(interactive "p")(self-insert-command n ?Ö)))
(global-set-key (kbd "C-c \" u") (lambda(n)(interactive "p")(self-insert-command n ?ü)))
(global-set-key (kbd "C-c \" U") (lambda(n)(interactive "p")(self-insert-command n ?Ü)))

(global-set-key (kbd "C-c , c") (lambda(n)(interactive "p")(self-insert-command n ?ç)))
(global-set-key (kbd "C-c , C") (lambda(n)(interactive "p")(self-insert-command n ?Ç)))

(global-set-key (kbd "C-c g a") (lambda(n)(interactive "p")(self-insert-command n ?α)))
(global-set-key (kbd "C-c g b") (lambda(n)(interactive "p")(self-insert-command n ?β)))
(global-set-key (kbd "C-c g c") (lambda(n)(interactive "p")(self-insert-command n ?ς)))
(global-set-key (kbd "C-c g d") (lambda(n)(interactive "p")(self-insert-command n ?δ)))
(global-set-key (kbd "C-c g e") (lambda(n)(interactive "p")(self-insert-command n ?ε)))
(global-set-key (kbd "C-c g f") (lambda(n)(interactive "p")(self-insert-command n ?φ)))
(global-set-key (kbd "C-c g g") (lambda(n)(interactive "p")(self-insert-command n ?γ)))
(global-set-key (kbd "C-c g h") (lambda(n)(interactive "p")(self-insert-command n ?η)))
(global-set-key (kbd "C-c g i") (lambda(n)(interactive "p")(self-insert-command n ?ι)))
(global-set-key (kbd "C-c g j") (lambda(n)(interactive "p")(self-insert-command n ?θ)))
(global-set-key (kbd "C-c g k") (lambda(n)(interactive "p")(self-insert-command n ?κ)))
(global-set-key (kbd "C-c g l") (lambda(n)(interactive "p")(self-insert-command n ?λ)))
(global-set-key (kbd "C-c g m") (lambda(n)(interactive "p")(self-insert-command n ?μ)))
(global-set-key (kbd "C-c g n") (lambda(n)(interactive "p")(self-insert-command n ?ν)))
(global-set-key (kbd "C-c g o") (lambda(n)(interactive "p")(self-insert-command n ?ο)))
(global-set-key (kbd "C-c g p") (lambda(n)(interactive "p")(self-insert-command n ?π)))
(global-set-key (kbd "C-c g q") (lambda(n)(interactive "p")(self-insert-command n ?χ)))
(global-set-key (kbd "C-c g r") (lambda(n)(interactive "p")(self-insert-command n ?ρ)))
(global-set-key (kbd "C-c g s") (lambda(n)(interactive "p")(self-insert-command n ?σ)))
(global-set-key (kbd "C-c g t") (lambda(n)(interactive "p")(self-insert-command n ?τ)))
(global-set-key (kbd "C-c g u") (lambda(n)(interactive "p")(self-insert-command n ?υ)))
(global-set-key (kbd "C-c g x") (lambda(n)(interactive "p")(self-insert-command n ?ξ)))
(global-set-key (kbd "C-c g y") (lambda(n)(interactive "p")(self-insert-command n ?ψ)))
(global-set-key (kbd "C-c g z") (lambda(n)(interactive "p")(self-insert-command n ?ζ)))

(global-set-key (kbd "C-c g A") (lambda(n)(interactive "p")(self-insert-command n ?Α)))
(global-set-key (kbd "C-c g B") (lambda(n)(interactive "p")(self-insert-command n ?Β)))
(global-set-key (kbd "C-c g C") (lambda(n)(interactive "p")(self-insert-command n ?Σ)))
(global-set-key (kbd "C-c g D") (lambda(n)(interactive "p")(self-insert-command n ?Δ)))
(global-set-key (kbd "C-c g E") (lambda(n)(interactive "p")(self-insert-command n ?Ε)))
(global-set-key (kbd "C-c g F") (lambda(n)(interactive "p")(self-insert-command n ?Φ)))
(global-set-key (kbd "C-c g G") (lambda(n)(interactive "p")(self-insert-command n ?Γ)))
(global-set-key (kbd "C-c g H") (lambda(n)(interactive "p")(self-insert-command n ?Η)))
(global-set-key (kbd "C-c g I") (lambda(n)(interactive "p")(self-insert-command n ?Ι)))
(global-set-key (kbd "C-c g J") (lambda(n)(interactive "p")(self-insert-command n ?Θ)))
(global-set-key (kbd "C-c g K") (lambda(n)(interactive "p")(self-insert-command n ?Κ)))
(global-set-key (kbd "C-c g L") (lambda(n)(interactive "p")(self-insert-command n ?Λ)))
(global-set-key (kbd "C-c g M") (lambda(n)(interactive "p")(self-insert-command n ?Μ)))
(global-set-key (kbd "C-c g N") (lambda(n)(interactive "p")(self-insert-command n ?Ν)))
(global-set-key (kbd "C-c g O") (lambda(n)(interactive "p")(self-insert-command n ?Ο)))
(global-set-key (kbd "C-c g P") (lambda(n)(interactive "p")(self-insert-command n ?Π)))
(global-set-key (kbd "C-c g Q") (lambda(n)(interactive "p")(self-insert-command n ?Χ)))
(global-set-key (kbd "C-c g R") (lambda(n)(interactive "p")(self-insert-command n ?Ρ)))
(global-set-key (kbd "C-c g S") (lambda(n)(interactive "p")(self-insert-command n ?Σ)))
(global-set-key (kbd "C-c g T") (lambda(n)(interactive "p")(self-insert-command n ?Τ)))
(global-set-key (kbd "C-c g U") (lambda(n)(interactive "p")(self-insert-command n ?Υ)))
(global-set-key (kbd "C-c g W") (lambda(n)(interactive "p")(self-insert-command n ?Ω)))
(global-set-key (kbd "C-c g X") (lambda(n)(interactive "p")(self-insert-command n ?Ξ)))
(global-set-key (kbd "C-c g Y") (lambda(n)(interactive "p")(self-insert-command n ?Ψ)))
(global-set-key (kbd "C-c g Z") (lambda(n)(interactive "p")(self-insert-command n ?Ζ)))

