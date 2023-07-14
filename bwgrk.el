                                        ; https://www.bibleworks.com/fonts.html

(setq bwgrk-to-greek
      '(
        ("VO" . "Ὀ")
        ("VI" . "Ἰ")
        ("VH" . "Ἠ")
        ("VE" . "Ἐ")
        ("VA" . "Ἀ")
        ("~W" . "Ὡ")
        ("~U" . "Ὑ")
        ("~R" . "Ῥ")
        ("~O" . "Ὁ")
        ("~I" . "Ἱ")
        ("~H" . "Ἡ")
        ("~E" . "Ἑ")
        ("~A" . "Ἁ")
        ("\"W" . "Ὢ")
        ("\"O" . "Ὂ")
        ("\"I" . "Ἲ")
        ("\"H" . "Ἢ")
        ("\"E" . "Ἒ")
        ("\"A" . "Ἂ")
        ("}W" . "Ὣ")
        ("}U" . "Ὓ")
        ("}O" . "Ὃ")
        ("}I" . "Ἳ")
        ("}H" . "Ἣ")
        ("}E" . "Ἓ")
        ("}A" . "Ἃ")
        ("W" . "Ὼ")
        ("U" . "Ὺ")
        ("O" . "Ὸ")
        ("I" . "Ὶ")
        ("H" . "Ὴ")
        ("E" . "Ὲ")
        ("A" . "Ὰ")
        ("U" . "Ϋ")
        ("I" . "Ϊ")
        ("+W" . "Ὦ")
        ("+I" . "Ἶ")
        ("+H" . "Ἦ")
        ("+A" . "Ἆ")
        ("_W" . "Ὧ")
        ("_U" . "Ὗ")
        ("_I" . "Ἷ")
        ("_H" . "Ἧ")
        ("_A" . "Ἇ")
        (":W" . "Ὤ")
        (":O" . "Ὄ")
        (":I" . "Ἴ")
        (":H" . "Ἤ")
        (":E" . "Ἔ")
        (":A" . "Ἄ")
        ("{W" . "Ὥ")
        ("{U" . "Ὕ")
        ("{O" . "Ὅ")
        ("{I" . "Ἵ")
        ("{H" . "Ἥ")
        ("{E" . "Ἕ")
        ("{A" . "Ἅ")
        ("W" . "Ώ")
        ("U" . "Ύ")
        ("O" . "Ό")
        ("I" . "Ί")
        ("H" . "Ή")
        ("E" . "Έ")
        ("A" . "Ά")
        ("Z" . "Ζ")
        ("Y" . "Ψ")
        ("X" . "Ξ")
        ("W" . "Ω")
        ("U" . "Υ")
        ("T" . "Τ")
        ("S" . "Σ")
        ("R" . "Ρ")
        ("Q" . "Θ")
        ("P" . "Π")
        ("O" . "Ο")
        ("N" . "Ν")
        ("M" . "Μ")
        ("L" . "Λ")
        ("K" . "Κ")
        ("J" . "Σ")
        ("I" . "Ι")
        ("H" . "Η")
        ("G" . "Γ")
        ("F" . "Φ")
        ("E" . "Ε")
        ("D" . "Δ")
        ("C" . "Χ")
        ("B" . "Β")
        ("A" . "Α")
        ("wv|" . "ᾠ")
        ("hv|" . "ᾐ")
        ("av|" . "ᾀ")
        ("wv" . "ὠ")
        ("uv" . "ὐ")
        ("rv" . "ῤ")
        ("ov" . "ὀ")
        ("iv" . "ἰ")
        ("hv" . "ἠ")
        ("ev" . "ἐ")
        ("av" . "ἀ")
        ("w`|" . "ᾡ")
        ("h`|" . "ᾑ")
        ("a`|" . "ᾁ")
        ("w`" . "ὡ")
        ("u`" . "ὑ")
        ("r`" . "ῥ")
        ("o`" . "ὁ")
        ("i`" . "ἱ")
        ("h`" . "ἡ")
        ("e`" . "ἑ")
        ("a`" . "ἁ")
        ("w]|" . "ᾣ")
        ("h]|" . "ᾓ")
        ("a]|" . "ᾃ")
        ("w[.]|" . "ῲ")
        ("h[.]|" . "ῂ")
        ("a[.]|" . "ᾲ")
        ("w'|" . "ᾢ")
        ("h'|" . "ᾒ")
        ("a'|" . "ᾂ")
        ("w'" . "ὢ")
        ("u'" . "ὒ")
        ("o'" . "ὂ")
        ("i'" . "ἲ")
        ("h'" . "ἢ")
        ("e'" . "ἒ")
        ("a'" . "ἂ")
        ("w]" . "ὣ")
        ("u]" . "ὓ")
        ("o]" . "ὃ")
        ("i]" . "ἳ")
        ("h]" . "ἣ")
        ("e]" . "ἓ")
        ("a]" . "ἃ")
        ("w[.]" . "ὼ")
        ("u[.]" . "ὺ")
        ("o[.]" . "ὸ")
        ("i[.]" . "ὶ")
        ("h[.]" . "ὴ")
        ("e[.]" . "ὲ")
        ("a[.]" . "ὰ")
        ("υ>" . "ῢ")
        ("u\\?" . "ϋ")
        ("i\\?" . "ϊ")
        ("w=" . "ὦ")
        ("u=" . "ὖ")
        ("i=" . "ἶ")
        ("h=" . "ἦ")
        ("a=" . "ἆ")
        ("w-" . "ὧ")
        ("u-" . "ὗ")
        ("i-" . "ἷ")
        ("h-" . "ἧ")
        ("a-" . "ἇ")
        ("w=|" . "ᾦ")
        ("h=|" . "ᾖ")
        ("a=|" . "ᾆ")
        ("w-|" . "ᾧ")
        ("h-|" . "ᾗ")
        ("a-|" . "ᾇ")
        ("w/|" . "ῷ")
        ("h/|" . "ῇ")
        ("a/|" . "ᾷ")
        ("w/" . "ῶ")
        ("u/" . "ῦ")
        ("i/" . "ῖ")
        ("h/" . "ῆ")
        ("a/" . "ᾶ")
        ("w;|" . "ᾤ")
        ("h;|" . "ᾔ")
        ("a;|" . "ᾄ")
        ("w;" . "ὤ")
        ("u;" . "ὔ")
        ("o;" . "ὄ")
        ("i;" . "ἴ")
        ("h;" . "ἤ")
        ("e;" . "ἔ")
        ("a;" . "ἄ")
        ("w\\[|" . "ᾥ")
        ("h\\[|" . "ᾕ")
        ("a\\[|" . "ᾅ")
        ("w\\[" . "ὥ")
        ("u\\[" . "ὕ")
        ("o\\[" . "ὅ")
        ("i\\[" . "ἵ")
        ("h\\[" . "ἥ")
        ("e\\[" . "ἕ")
        ("a\\[" . "ἅ")
        ("w,|" . "ῴ")
        ("h,|" . "ῄ")
        ("a,|" . "ᾴ")
        ("i,\\?" . "ΐ")
        ("i,\\?" . "ΐ")
        ("w," . "ώ")
        ("w," . "ώ")
        ("u," . "ύ")
        ("u," . "ύ")
        ("o," . "ό")
        ("o," . "ό")
        ("i," . "ί")
        ("i," . "ί")
        ("h," . "ή")
        ("h," . "ή")
        ("e," . "έ")
        ("e," . "έ")
        ("a," . "ά")
        ("a," . "ά")
        ("w|" . "ῳ")
        ("h|" . "ῃ")
        ("a|" . "ᾳ")
        ("z" . "ζ")
        ("y" . "ψ")
        ("x" . "ξ")
        ("w" . "ω")
        ("u" . "υ")
        ("t" . "τ")
        ("s" . "σ")
        ("r" . "ρ")
        ("q" . "θ")
        ("p" . "π")
        ("o" . "ο")
        ("n" . "ν")
        ("m" . "μ")
        ("l" . "λ")
        ("k" . "κ")
        ("j" . "ς")
        ("i" . "ι")
        ("h" . "η")
        ("g" . "γ")
        ("f" . "φ")
        ("e" . "ε")
        ("d" . "δ")
        ("c" . "χ")
        ("b" . "β")
        ("a" . "α")
        ("(" . ",")
        (")" . ".")
        ("\\\\" . "·")
        ))



(setq greek-to-bwgrk
      '(
        ("Ὀ" . "VO")
        ("Ἰ" . "VI")
        ("Ἠ" . "VH")
        ("Ἐ" . "VE")
        ("Ἀ" . "VA")
        ("Ὡ" . "~W")
        ("Ὑ" . "~U")
        ("Ῥ" . "~R")
        ("Ὁ" . "~O")
        ("Ἱ" . "~I")
        ("Ἡ" . "~H")
        ("Ἑ" . "~E")
        ("Ἁ" . "~A")
        ("Ὢ" . "\"W")
        ("Ὂ" . "\"O")
        ("Ἲ" . "\"I")
        ("Ἢ" . "\"H")
        ("Ἒ" . "\"E")
        ("Ἂ" . "\"A")
        ("Ὣ" . "}W")
        ("Ὓ" . "}U")
        ("Ὃ" . "}O")
        ("Ἳ" . "}I")
        ("Ἣ" . "}H")
        ("Ἓ" . "}E")
        ("Ἃ" . "}A")
        ("Ὼ" . "W")
        ("Ὺ" . "U")
        ("Ὸ" . "O")
        ("Ὶ" . "I")
        ("Ὴ" . "H")
        ("Ὲ" . "E")
        ("Ὰ" . "A")
        ("Ϋ" . "U")
        ("Ϊ" . "I")
        ("Ὦ" . "+W")
        ("Ἶ" . "+I")
        ("Ἦ" . "+H")
        ("Ἆ" . "+A")
        ("Ὧ" . "_W")
        ("Ὗ" . "_U")
        ("Ἷ" . "_I")
        ("Ἧ" . "_H")
        ("Ἇ" . "_A")
        ("Ὤ" . ":W")
        ("Ὄ" . ":O")
        ("Ἴ" . ":I")
        ("Ἤ" . ":H")
        ("Ἔ" . ":E")
        ("Ἄ" . ":A")
        ("Ὥ" . "{W")
        ("Ὕ" . "{U")
        ("Ὅ" . "{O")
        ("Ἵ" . "{I")
        ("Ἥ" . "{H")
        ("Ἕ" . "{E")
        ("Ἅ" . "{A")
        ("Ώ" . "W")
        ("Ύ" . "U")
        ("Ό" . "O")
        ("Ί" . "I")
        ("Ή" . "H")
        ("Έ" . "E")
        ("Ά" . "A")
        ("Ζ" . "Z")
        ("Ψ" . "Y")
        ("Ξ" . "X")
        ("Ω" . "W")
        ("Υ" . "U")
        ("Τ" . "T")
        ("Σ" . "S")
        ("Ρ" . "R")
        ("Θ" . "Q")
        ("Π" . "P")
        ("Ο" . "O")
        ("Ν" . "N")
        ("Μ" . "M")
        ("Λ" . "L")
        ("Κ" . "K")
        ("Σ" . "J")
        ("Ι" . "I")
        ("Η" . "H")
        ("Γ" . "G")
        ("Φ" . "F")
        ("Ε" . "E")
        ("Δ" . "D")
        ("Χ" . "C")
        ("Β" . "B")
        ("Α" . "A")
        ("ὠ" . "wv")
        ("ὐ" . "uv")
        ("ῤ" . "rv")
        ("ὀ" . "ov")
        ("ἰ" . "iv")
        ("ἠ" . "hv")
        ("ἐ" . "ev")
        ("ἀ" . "av")
        ("ὡ" . "w`")
        ("ὑ" . "u`")
        ("ῥ" . "r`")
        ("ὁ" . "o`")
        ("ἱ" . "i`")
        ("ἡ" . "h`")
        ("ἑ" . "e`")
        ("ἁ" . "a`")
        ("ᾢ" . "w'|")
        ("ᾒ" . "h'|")
        ("ᾂ" . "a'|")
        ("ᾣ" . "w]|")
        ("ᾓ" . "h]|")
        ("ᾃ" . "a]|")
        ("ῲ" . "w.|")
        ("ῂ" . "h.|")
        ("ᾲ" . "a.|")
        ("ᾠ" . "wv|")
        ("ᾐ" . "hv|")
        ("ᾀ" . "av|")
        ("ᾡ" . "w`|")
        ("ᾑ" . "h`|")
        ("ᾁ" . "a`|")
        ("ῳ" . "w|")
        ("ῃ" . "h|")
        ("ᾳ" . "a|")
        ("ὢ" . "w'")
        ("ὒ" . "u'")
        ("ὂ" . "o'")
        ("ἲ" . "i'")
        ("ἢ" . "h'")
        ("ἒ" . "e'")
        ("ἂ" . "a'")
        ("ὣ" . "w]")
        ("ὓ" . "u]")
        ("ὃ" . "o]")
        ("ἳ" . "i]")
        ("ἣ" . "h]")
        ("ἓ" . "e]")
        ("ἃ" . "a]")
        ("ὼ" . "w.")
        ("ὺ" . "u.")
        ("ὸ" . "o.")
        ("ὶ" . "i.")
        ("ὴ" . "h.")
        ("ὲ" . "e.")
        ("ὰ" . "a.")
        ("ῢ" . "υ>")
        ("ϋ" . "u?")
        ("ϊ" . "i?")
        ("ὦ" . "w=")
        ("ὖ" . "u=")
        ("ἶ" . "i=")
        ("ἦ" . "h=")
        ("ἆ" . "a=")
        ("ὧ" . "w-")
        ("ὗ" . "u-")
        ("ἷ" . "i-")
        ("ἧ" . "h-")
        ("ἇ" . "a-")
        ("ᾦ" . "w=|")
        ("ᾖ" . "h=|")
        ("ᾆ" . "a=|")
        ("ᾧ" . "w-|")
        ("ᾗ" . "h-|")
        ("ᾇ" . "a-|")
        ("ῷ" . "w/|")
        ("ῇ" . "h/|")
        ("ᾷ" . "a/|")
        ("ῶ" . "w/")
        ("ῦ" . "u/")
        ("ῖ" . "i/")
        ("ῆ" . "h/")
        ("ᾶ" . "a/")
        ("ᾤ" . "w;|")
        ("ᾔ" . "h;|")
        ("ᾄ" . "a;|")
        ("ὤ" . "w;")
        ("ὔ" . "u;")
        ("ὄ" . "o;")
        ("ἴ" . "i;")
        ("ἤ" . "h;")
        ("ἔ" . "e;")
        ("ἄ" . "a;")
        ("ᾥ" . "w[|")
        ("ᾕ" . "h[|")
        ("ᾅ" . "a[|")
        ("ὥ" . "w[")
        ("ὕ" . "u[")
        ("ὅ" . "o[")
        ("ἵ" . "i[")
        ("ἥ" . "h[")
        ("ἕ" . "e[")
        ("ἅ" . "a[")
        ("ῴ" . "w,|")
        ("ῄ" . "h,|")
        ("ᾴ" . "a,|")
        ("ΐ" . "i,?")
        ("ΐ" . "i,?")
        ("ώ" . "w,")
        ("ώ" . "w,")
        ("ύ" . "u,")
        ("ύ" . "u,")
        ("ό" . "o,")
        ("ό" . "o,")
        ("ί" . "i,")
        ("ί" . "i,")
        ("ή" . "h,")
        ("ή" . "h,")
        ("έ" . "e,")
        ("έ" . "e,")
        ("ά" . "a,")
        ("ά" . "a,")
        ("ζ" . "z")
        ("ψ" . "y")
        ("ξ" . "x")
        ("ω" . "w")
        ("υ" . "u")
        ("τ" . "t")
        ("σ" . "s")
        ("ρ" . "r")
        ("θ" . "q")
        ("π" . "p")
        ("ο" . "o")
        ("ν" . "n")
        ("μ" . "m")
        ("λ" . "l")
        ("κ" . "k")
        ("ς" . "j")
        ("ι" . "i")
        ("η" . "h")
        ("γ" . "g")
        ("φ" . "f")
        ("ε" . "e")
        ("δ" . "d")
        ("χ" . "c")
        ("β" . "b")
        ("α" . "a")
        ("," . "(")
        ("[.]" . ")")
        ("·" . "\\")
        ))

(defun convert-greek-region(table beg end)
  "convert a region of BWGRK text to greek text"
  (let ((case-fold-search nil)
        (begm (copy-marker beg nil))
        (endm (copy-marker end t)))
                                        ;    (save-excursion
    (goto-char begm)
    (while (< (point) endm)
                                        ; convert next character
      (let ((p table))
        (while p
          (if (looking-at (caar p))
              (progn
                (delete-char (- (match-end 0) (match-beginning 0)))
                (insert (cdar p))
                (left-char)
                (setq p nil))
            (setq p (cdr p)))))
      (right-char))))

(defun bwgrk-to-greek-region(beg end)
  (interactive "r")
  (convert-greek-region bwgrk-to-greek beg end))


(defun greek-to-bwgrk-region(beg end)
  (interactive "r")
  (convert-greek-region greek-to-bwgrk beg end))

