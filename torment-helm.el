(require 'helm-config)
(require 'helm-gtags)
(require 'projectile)
(require 'helm-projectile)

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

(define-key helm-find-files-map (kbd "M-i") 'helm-previous-line)

;; (add-hook 'c-mode-common-hook
;; 		  (lambda ()
;; 			(helm-gtags-mode)))

(setq helm-c-gtags-path-style 'relative)
(setq helm-c-gtags-ignore-case t)
(setq helm-c-gtags-read-only t)

(setq projectile-mode-line-lighter "Pro")

(projectile-global-mode)

(global-set-key (kbd "M-I") 'helm-semantic-or-imenu)


;; (add-hook 'helm-after-update-hook
;; 		  (lambda ()
;; 			(toggle-truncate-lines t)))

;;(global-set-key (kbd "M-O") 'helm-projectile)
(global-set-key (kbd "M-O") 'projectile-find-file-dwim)
(global-set-key (kbd "M-,") 'pop-tag-mark)

(add-hook 'helm-gtags-mode-hook
		  (lambda ()
			(local-set-key (kbd "M-.") 'helm-gtags-find-tag)
			(local-set-key (kbd "M-,") 'helm-gtags-pop-stack)))
