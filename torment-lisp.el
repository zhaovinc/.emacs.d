
(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(local-set-key [return] 'newline-and-indent)
			(highlight-parentheses-mode t)
			(add-to-list 'ac-sources 'ac-source-emacs-lisp-features)))

(add-to-list 'auto-mode-alist '("\\.gnus$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs$" . emacs-lisp-mode))
