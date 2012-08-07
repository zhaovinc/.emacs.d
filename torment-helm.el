(require 'helm-config)
(require 'helm-gtags)

(add-hook 'c-mode-common-hook
		  (lambda ()
			(helm-gtags-mode)))

(setq helm-c-gtags-path-style 'relative)
(setq helm-c-gtags-ignore-case t)
(setq helm-c-gtags-read-only t)

(add-hook 'helm-gtags-mode-hook
		  (lambda ()
			(local-set-key (kbd "M-.") 'helm-gtags-find-tag)
			(local-set-key (kbd "M-,") 'helm-gtags-pop-stack)
			(local-set-key (kbd "M-O") 'helm-gtags-find-files)))
