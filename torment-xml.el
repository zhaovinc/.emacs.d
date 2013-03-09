;;(load "nxhtml/autostart.el")

(require 'rename-sgml-tag)
(require 'fold-dwim-org)

(add-hook 'sgml-mode-hook
          (lambda ()
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

(add-hook 'html-mode-hook
		  (lambda ()
			(define-key html-mode-map (kbd "M-w") 'wrap-region-with-tag-with-indent)))

(add-hook 'nxml-mode-hook
		  (lambda ()
			(define-key nxml-mode-map (kbd "M-h") 'scroll-up)
			(define-key nxml-mode-map (kbd "M-y") 'scroll-down)
			(define-key nxml-mode-map (kbd "M-P") 'nxml-mark-paragraph)))
