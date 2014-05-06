(require 'ruby-electric)
(require 'slim-mode)
(require 'yaml-mode)
(require 'rhtml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))

(setq rsense-home "$RSENSE_HOME")
(require 'rsense)

(setq ruby-electric-expand-delimiters-list nil)


(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
            
(add-hook 'ruby-mode-hook
		  (lambda ()
			(ruby-electric-mode t)
			(define-key ruby-mode-map (kbd "RET") 'newline-and-indent)))

