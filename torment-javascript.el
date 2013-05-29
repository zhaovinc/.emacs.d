(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook
		  (lambda ()
			(skewer-mode)
            (define-key js2-mode-map (kbd "M-j") 'backward-char)))
