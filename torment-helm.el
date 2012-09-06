(require 'helm-config)
(require 'helm-gtags)
(require 'helm-git)


(eval-after-load 'helm
  '(progn
	 (define-key helm-map (kbd "M-i")			'helm-previous-line)
	 (define-key helm-map (kbd "M-k")			'helm-next-line)
	 (define-key helm-map (kbd "M-n")			'helm-next-source)
	 (define-key helm-map (kbd "M-p")			'helm-previous-source)
	 (define-key helm-map (kbd "M-h")			'helm-next-page)
	 (define-key helm-map (kbd "M-y")			'helm-previous-page)
	 (define-key helm-map (kbd "<escape>")		'helm-keyboard-quit)
	 (define-key helm-map (kbd "C-w")			'backward-kill-word)))

(add-hook 'c-mode-common-hook
		  (lambda ()
			(helm-gtags-mode)))

(setq helm-c-gtags-path-style 'relative)
(setq helm-c-gtags-ignore-case t)
(setq helm-c-gtags-read-only t)


(global-set-key (kbd "M-I") 'helm-imenu)


(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(local-set-key (kbd "M-O") 'helm-git-find-files)))


(add-hook 'helm-gtags-mode-hook
		  (lambda ()
			(local-set-key (kbd "M-.") 'helm-gtags-find-tag)
			(local-set-key (kbd "M-,") 'helm-gtags-pop-stack)
			(local-set-key (kbd "M-O") 'helm-git-find-files)))
