(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(define-key js2-mode-map [f5] 'slime-js-reload)

(add-hook 'js2-mode-hook
		  (lambda ()
			(slime-js-minor-mode 1)))
