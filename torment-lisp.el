(require 'slime)
(require 'ac-slime)
(require 'paredit)
(require 'elisp-slime-nav)


(if (equal system-type 'windows-nt)	
	(progn
	  (setq inferior-lisp-program "c:/sbcl/sbcl.exe")
	  (slime-setup)))


(add-to-list 'auto-mode-alist '("\\.gnus$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs$" . emacs-lisp-mode))

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "M-s") 'isearch-forward)
     (define-key paredit-mode-map (kbd "M-r") 'isearch-backward)))


;;(suspend-mode-during-cua-rect-selection 'paredit-mode)

(add-hook 'lisp-mode-hook
		  (lambda ()
			(enable-paredit-mode)
			(autopair-mode -1)))

(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(enable-paredit-mode)
			(autopair-mode -1)))


(add-hook 'slime-mode-hook 'set-up-slime-ac)

(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)


(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(elisp-slime-nav-mode t)
			(local-set-key [return] 'newline-and-indent)
			(add-to-list 'ac-sources 'ac-source-emacs-lisp-features)))
