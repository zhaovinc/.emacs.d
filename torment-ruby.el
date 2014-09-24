(require 'slim-mode)
(require 'yaml-mode)
(require 'rhtml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))

(add-hook 'ruby-mode-hook
		  (lambda ()
			(superword-mode t)
			(define-key ruby-mode-map (kbd "RET") 'newline-and-indent)))
