(require 'js2-mode)
(require 'jquery-doc)
(require 'moz)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook
		  (lambda ()
			(moz-minor-mode 1)
			(jquery-doc-setup)
            (define-key js2-mode-map (kbd "M-j") 'backward-char)))

