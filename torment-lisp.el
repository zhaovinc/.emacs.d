(require 'slime)
(require 'paredit)

(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(local-set-key [return] 'newline-and-indent)
			(add-to-list 'ac-sources 'ac-source-emacs-lisp-features)))


(add-to-list 'auto-mode-alist '("\\.gnus$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs$" . emacs-lisp-mode))

(if (equal system-type 'windows-nt)	
	(progn
	  (setq inferior-lisp-program "c:/sbcl/sbcl.exe")
	  (slime-setup)))

(add-hook 'lisp-mode-hook
		  (lambda ()
			'enable-paredit-mode))

(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			'enable-paredit-mode))

