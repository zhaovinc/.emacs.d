(defun open-next-line ()
(interactive)
(move-end-of-line 1)
(open-line 1)
(next-line)
(indent-according-to-mode))

(defun open-previous-line ()
  (interactive)
  (move-beginning-of-line 1)
  (open-line 1)
  (indent-according-to-mode))

(defun go-to-char (n char)
"Move forward to Nth occurence of CHAR.
yping y-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
(interactive "p\ncGo to char: ")
(search-forward (string char) nil nil n)
(while (char-equal (read-char) char)
(search-forward (string char) nil nil n))
(setq unread-command-events (list last-input-event)))

(defun back-to-char (n char)
"Move backward to Nth occurence of CHAR.
yping y-back-to-char-key' again will move backward to the previous Nth
occurence of CHAR."
(interactive "p\ncBack to char: ")
(search-backward (string char) nil nil n)
(while (char-equal (read-char) char)
(search-backward (string char) nil nil n))
(setq unread-command-events (list last-input-event)))

(defun zap-up-to-char (arg char)
"Kill up to, but not including ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes backward if ARG is negative; error if CHAR not found.
Ignores CHAR at point."
(interactive "p\ncZap up to char: ")
(let ((direction (if (>= arg 0) 1 -1)))
(kill-region (point)
(progn
(forward-char direction)
(unwind-protect
(search-forward (char-to-string char) nil nil arg)
(backward-char direction))
(point)))))

(defun zap-back-to-char (arg char)
"Kill back to, but not including ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes forward if ARG is negative; error if CHAR not found.
Ignores CHAR at point."
(interactive "p\ncZap back to char: ")
(let ((direction (if (>= arg 0) 1 -1)))
(kill-region (point)
(progn
(backward-char direction)
(unwind-protect
(search-backward (char-to-string char) nil nil arg)
(forward-char direction))
(point)))))

(defun copy-all ()
  "Put the whole buffer content into the kill-ring.
If narrow-to-region is in effect, then copy that region only."
  (interactive)
  (kill-ring-save (point-min) (point-max))
  (message "Buffer content copied")
  )

(defun cut-all ()
  "Cut the whole buffer content into the kill-ring.
If narrow-to-region is in effect, then cut that region only."
  (interactive)
  (kill-region (point-min) (point-max))
  (message "Buffer content cut")
  )

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy the current line."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (progn
       (message "Current line is copied.")
       (list (line-beginning-position) (line-end-position)) ) ) ))

(defadvice kill-region (before slick-copy activate compile)
  "When called interactively with no active region, cut the current line."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (progn
       (message "Current line is cut.")
       (list (line-beginning-position) (line-end-position)) ) ) ))
       

;; by Nikolaj Schumacher, 2008-10-20. Released under GPL.
(defun semnav-up (arg)
  (interactive "p")
  (when (nth 3 (syntax-ppss))
    (if (> arg 0)
        (progn
          (skip-syntax-forward "^\"")
          (goto-char (1+ (point)))
          (decf arg))
      (skip-syntax-backward "^\"")
      (goto-char (1- (point)))
      (incf arg)))
  (up-list arg))

;; by Nikolaj Schumacher, 2008-10-20. Released under GPL.
(defun extend-selection (arg &optional incremental)
  "Select the current word.
Subsequent calls expands the selection to larger semantic unit."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     (or (and transient-mark-mode mark-active)
                         (eq last-command this-command))))
  (if incremental
      (progn
        (semnav-up (- arg))
        (forward-sexp)
        (mark-sexp -1))
    (if (> arg 1)
        (extend-selection (1- arg) t)
      (if (looking-at "\\=\\(\\s_\\|\\sw\\)*\\_>")
          (goto-char (match-end 0))
        (unless (memq (char-before) '(?\) ?\"))
          (forward-sexp)))
      (mark-sexp -1))))
(defun kill-line-backward ()
  "Kill text between the beginning of the line to the cursor position.
If there's no text, delete the previous line ending."
  (interactive)
  (if (looking-back "\n")
      (delete-char -1)
    (kill-line 0)))
    
(defun shrink-whitespaces ()
  "Remove white spaces around cursor to just one or none.
If current line does not contain non-white space chars, then remove blank lines to just one.
If current line contains non-white space chars, then shrink any whitespace char surrounding cursor to just one space.
If current line is a single space, remove that space.

Calling this command 3 times will always result in no whitespaces around cursor."
  (interactive)
  (let (
        cursor-point
        line-has-meat-p  ; current line contains non-white space chars
        spaceTabNeighbor-p
        whitespace-begin whitespace-end
        space-or-tab-begin space-or-tab-end
        line-begin-pos line-end-pos
        )
    (save-excursion
      ;; todo: might consider whitespace as defined by syntax table, and also consider whitespace chars in unicode if syntax table doesn't already considered it.
      (setq cursor-point (point))

      (setq spaceTabNeighbor-p (if (or (looking-at " \\|\t") (looking-back " \\|\t")) t nil) )
      (move-beginning-of-line 1) (setq line-begin-pos (point) )
      (move-end-of-line 1) (setq line-end-pos (point) )
      ;;       (re-search-backward "\n$") (setq line-begin-pos (point) )
      ;;       (re-search-forward "\n$") (setq line-end-pos (point) )
      (setq line-has-meat-p (if (< 0 (count-matches "[[:graph:]]" line-begin-pos line-end-pos)) t nil) )
      (goto-char cursor-point)

      (skip-chars-backward "\t ")
      (setq space-or-tab-begin (point))

      (skip-chars-backward "\t \n")
      (setq whitespace-begin (point))

      (goto-char cursor-point)      (skip-chars-forward "\t ")
      (setq space-or-tab-end (point))
      (skip-chars-forward "\t \n")
      (setq whitespace-end (point))
      )

    (if line-has-meat-p
        (let (deleted-text)
          (when spaceTabNeighbor-p
            ;; remove all whitespaces in the range
            (setq deleted-text (delete-and-extract-region space-or-tab-begin space-or-tab-end))
            ;; insert a whitespace only if we have removed something
            ;; different that a simple whitespace
            (if (not (string= deleted-text " "))
                (insert " ") ) ) )

      (progn
        ;; (delete-region whitespace-begin whitespace-end)
        ;; (insert "\n")
        (delete-blank-lines)
        )
      ;; todo: possibly code my own delete-blank-lines here for better efficiency, because delete-blank-lines seems complex.
      )
    )
  )

(defun select-text-in-quote ()
  "Select text between the nearest left and right delimiters.
Delimiters are paired characters: ()[]<>«»“”‘’「」【】, including \"\"."
 (interactive)
 (let (b1 b2)
   (skip-chars-backward "^<>(“{[「«【\"‘")
   (setq b1 (point))
   (skip-chars-forward "^<>)”}]」】»\"’")
   (setq b2 (point))
   (set-mark b1)
   )
 )
 
(defun move-to-matching-paren (arg)
"Go to the matching parenthesis if on parenthesis otherwise insert %."
        (interactive "p")
        (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
        
(defun ido-goto-symbol ()
  "Will update the imenu index and then use ido to select a symbol to navigate to"
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
	(symbol-names '()))
    (flet ((addsymbols (symbol-list)
		       (when (listp symbol-list)
			 (dolist (symbol symbol-list)
			   (let ((name nil) (position nil))
			     (cond
			      ((and (listp symbol) (imenu--subalist-p symbol))
			       (addsymbols symbol))
			      
			      ((listp symbol)
			       (setq name (car symbol))
			       (setq position (cdr symbol)))
			      
			      ((stringp symbol)
			       (setq name symbol)
			       (setq position (get-text-property 1 'org-imenu-marker symbol))))
			     
			     (unless (or (null position) (null name))
			       (add-to-list 'symbol-names name)
			       (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
	   (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))
      
; make color value colorful by themselves
(defvar hexcolour-keywords
  '(("#[abcdef[:digit:]]\\{6\\}"
     (0 (put-text-property
         (match-beginning 0)
         (match-end 0)
         'face (list :background 
                     (match-string-no-properties 0)))))))

(defun hexcolour-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolour-keywords))
  
(defun ruby-toggle-string<>simbol ()
  "Easy to switch between strings and symbols."
  (interactive)
  (let ((initial-pos (point)))
    (save-excursion
      (when (looking-at "[\"']") ;; skip beggining quote
        (goto-char (+ (point) 1))
        (unless (looking-at "\\w")
          (goto-char (- (point) 1))))
      (let* ((point (point))
             (start (skip-syntax-backward "w"))
             (end (skip-syntax-forward "w"))
             (end (+ point start end))
             (start (+ point start))
             (start-quote (- start 1))
             (end-quote (+ end 1))
             (quoted-str (buffer-substring-no-properties start-quote end-quote))
             (symbol-str (buffer-substring-no-properties start end)))
        (cond
         ((or (string-match "^\"\\w+\"$" quoted-str)
              (string-match "^\'\\w+\'$" quoted-str))
          (setq quoted-str (substring quoted-str 1 (- (length quoted-str) 1)))
          (kill-region start-quote end-quote)
          (goto-char start-quote)
          (insert (concat ":" quoted-str)))
         ((string-match "^\:\\w+$" symbol-str)
          (setq symbol-str (substring symbol-str 1))
          (kill-region start end)
          (goto-char start)
          (insert (format "'%s'" symbol-str))))))
    (goto-char initial-pos)))
    
(defun append-to-lines (text-to-be-inserted)
  ;;Appends text to each line in region
  (interactive "sEnter text to append: ")
  (save-excursion
    (let (point-ln mark-ln initial-ln final-ln count)
      (barf-if-buffer-read-only)
      (setq point-ln (line-number-at-pos))
      (exchange-point-and-mark)
      (setq mark-ln (line-number-at-pos))
      (if (< point-ln mark-ln)
          (progn (setq initial-ln point-ln final-ln mark-ln)
                 (exchange-point-and-mark))
        (setq initial-ln mark-ln final-ln point-ln))
      (setq count initial-ln)
      (while (<= count final-ln)
        (progn (move-end-of-line 1)
               (insert text-to-be-inserted)
               (next-line)
               (setq count (1+ count))))
      (message "From line %d to line %d." initial-ln final-ln ))))

(defun wrap-region-with-tag-with-indent (begin end tag)
  "'tag' every line in the region with a tag"
  (interactive "r\nMWrap with tag: ")
    (save-excursion
      (goto-char begin)
        (beginning-of-line)
		(indent-according-to-mode)
        (insert (format "<%s>" tag))
		(newline-and-indent)
		(end-of-line)
		(newline-and-indent)
        (insert (format "</%s>" tag))
		(indent-according-to-mode)))
		

;; valid values are t, nil, box, hollow, bar, (bar . WIDTH), hbar,
;; (hbar. HEIGHT); see the docs for set-cursor-type

(setq djcb-read-only-color       "gray")
(setq djcb-read-only-cursor-type 'hbar)
(setq djcb-overwrite-color       "red")
(setq djcb-overwrite-cursor-type 'box)
(setq djcb-normal-color          "red")
(setq djcb-normal-cursor-type    'bar)

(defun djcb-set-cursor-according-to-mode ()
  "change cursor color and type according to some minor modes."

  (cond
    (buffer-read-only
      (set-cursor-color djcb-read-only-color)
      (setq cursor-type djcb-read-only-cursor-type))
    (overwrite-mode
      (set-cursor-color djcb-overwrite-color)
      (setq cursor-type djcb-overwrite-cursor-type))
    (t 
      (set-cursor-color djcb-normal-color)
      (setq cursor-type djcb-normal-cursor-type))))

;; (add-hook 'post-command-hook 'djcb-set-cursor-according-to-mode)

(defun opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 5%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
          (oldalpha (if alpha-or-nil alpha-or-nil 100))
          (newalpha (if dec (- oldalpha 5) (+ oldalpha 5))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

(defun suspend-mode-during-cua-rect-selection (mode-name)
  "Add an advice to suspend `MODE-NAME' while selecting a CUA rectangle."
  (let ((flagvar (intern (format "%s-was-active-before-cua-rectangle" mode-name)))
        (advice-name (intern (format "suspend-%s" mode-name))))
    (eval-after-load 'cua-rect
      `(progn
         (defvar ,flagvar nil)
         (make-variable-buffer-local ',flagvar)
         (defadvice cua--activate-rectangle (after ,advice-name activate)
           (setq ,flagvar (and (boundp ',mode-name) ,mode-name))
           (when ,flagvar
             (,mode-name 0)))
         (defadvice cua--deactivate-rectangle (after ,advice-name activate)
           (when ,flagvar
             (,mode-name 1)))))))
