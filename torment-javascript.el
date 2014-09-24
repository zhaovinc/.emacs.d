(require 'js2-mode)
(require 'jquery-doc)
(require 'moz)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq js2-highlight-level 3)

(add-hook 'js2-mode-hook
		  (lambda ()
			(superword-mode t)
			(moz-minor-mode t)
			(jquery-doc-setup)
			(autopair-mode 0)
			(electric-pair-mode 1)
            (define-key js2-mode-map (kbd "M-j") 'backward-char)))

(add-hook 'inferior-moz-mode-hook
		  (lambda ()
			(autopair-mode 0)
			(electric-pair-mode 1)))



