(require 'yasnippet)
(require 'etags-table)
(require 'auto-complete-config)
(require 'auto-complete-nxml)

(load-file "~/.emacs.d/src/cedet/common/cedet.el")
(global-ede-mode 1)

(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)

(setq yas-snippet-dirs
      (list "~/.emacs.d/snippets"
            (concat (file-name-as-directory
                     (file-name-directory
                      (find-library-name "yasnippet")))
                    "snippets")))

(yas-global-mode 1)

;;(setq yas/use-menu nil)
;;(setq yas/trigger-key nil)

(setq yas/prompt-functions '(yas/dropdown-prompt
                            yas/ido-prompt
                            yas/completing-prompt))


(ac-config-default)

(setq ac-auto-start nil)
(setq ac-auto-show-menu nil)
(setq ac-dwim nil)
;;(setq ac-delay 0.2)

(add-to-list 'ac-modes 'nxml-mode)
(add-to-list 'ac-modes 'prog-mode)
(add-to-list 'ac-modes 'c-mode)
(add-to-list 'ac-modes 'cpp-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'js2-mode)
(add-to-list 'ac-modes 'css-mode)
(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'ruby-mode)
(add-to-list 'ac-modes 'shell-mode)
(add-to-list 'ac-modes 'emacs-lisp-mode)
(add-to-list 'ac-modes 'lisp-mode)
(add-to-list 'ac-modes 'slime-repl-mode)
(add-to-list 'ac-modes 'inferior-moz-mode)
(add-to-list 'ac-modes 'powershell-mode)
(add-to-list 'ac-modes 'scala-mode)

(global-set-key (kbd "M-/") 'auto-complete)
(define-key ac-completing-map [tab] 'ac-complete)
(define-key ac-completing-map "\M-i" 'ac-previous)
(define-key ac-completing-map "\M-k" 'ac-next)
(define-key ac-completing-map "\M-s" 'ac-isearch)

(setq omnisharp-imenu-support t)
