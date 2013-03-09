(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook
		  (lambda ()
            (define-key js2-mode-map [f5] 'slime-js-reload)
            (define-key js2-mode-map (kbd "M-j") 'backward-char)
			(slime-js-minor-mode 1)))
