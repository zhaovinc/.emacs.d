(require 'slime)
(require 'slime-fancy)
(require 'ac-slime)
(require 'paredit)
(require 'elisp-slime-nav)

(setq slime-net-coding-system 'utf-8-unix)
(setq slime-protocol-version 'ignore)
(setq slime-complete-symbol*-fancy t)
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

(if (equal system-type 'windows-nt)	
	(progn
	  (setq inferior-lisp-program "c:/sbcl/sbcl.exe")))

(if (equal system-type 'darwin)
	(progn
	  (setq inferior-lisp-program "/usr/local/bin/ccl -K utf-8")))

;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
(slime-setup '(slime-fancy))

(add-to-list 'auto-mode-alist '("\\.gnus$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs$" . emacs-lisp-mode))

(eval-after-load 'paredit
  '(progn
	 (define-key paredit-mode-map (kbd "C-j") 'paredit-join-sexps)
	 (define-key paredit-mode-map (kbd "C-s") 'paredit-split-sexp)
	 (define-key paredit-mode-map (kbd "C-l") 'paredit-splice-sexp)
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
