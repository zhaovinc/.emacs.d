;;(load "nxhtml/autostart.el")

;;(require 'rename-sgml-tag)

(eval-after-load 'rng-loc
	'(add-to-list 'rng-schema-locating-files "~/.emacs.d/schemas/schemas.xml"))

;;(add-hook 'sgml-mode-hook
;;         (lambda ()
;;            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

(add-hook 'html-mode-hook
		  (lambda ()
			(define-key html-mode-map (kbd "M-w") 'wrap-region-with-tag-with-indent)))

(add-hook 'nxml-mode-hook
		  (lambda ()
			(define-key nxml-mode-map (kbd "M-h") 'scroll-up)
			(define-key nxml-mode-map (kbd "M-y") 'scroll-down)
			(define-key nxml-mode-map (kbd "M-P") 'nxml-mark-paragraph)))

(defun pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this. The function inserts linebreaks to separate tags that have
nothing but whitespace between them. It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
      (backward-char) (insert "\n") (setq end (1+ end)))
    (indent-region begin end))
  (message "Ah, much better!"))
