(require 'ruby-electric)
(require 'slim-mode)
(require 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(setq rsense-home "$RSENSE_HOME")
(require 'rsense)

(setq ruby-electric-expand-delimiters-list nil)

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
            
(add-hook 'ruby-mode-hook
		  (lambda ()
			(ruby-electric-mode t)
			(define-key ruby-mode-map (kbd "RET") 'newline-and-indent)))

