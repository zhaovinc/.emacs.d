(require 'helm-config)
(require 'helm-gtags)
(require 'helm-git)

(add-hook 'c-mode-common-hook
		  (lambda ()
			(helm-gtags-mode)))

(setq helm-c-gtags-path-style 'relative)
(setq helm-c-gtags-ignore-case t)
(setq helm-c-gtags-read-only t)

(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(global-set-key (kbd "M-O") 'helm-git-find-files)))


(add-hook 'helm-gtags-mode-hook
		  (lambda ()
			(local-set-key (kbd "M-.") 'helm-gtags-find-tag)
			(local-set-key (kbd "M-,") 'helm-gtags-pop-stack)
			(local-set-key (kbd "M-O") 'helm-gtags-find-files)))
