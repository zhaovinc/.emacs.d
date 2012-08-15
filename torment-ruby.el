(require 'ruby-block)
(require 'ruby-electric)
;;(require 'rdebug)

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
			(ruby-block-mode t)
			(define-key ruby-mode-map (kbd "RET") 'newline-and-indent)))

