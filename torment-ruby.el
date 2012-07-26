(require 'ruby-block)
(require 'ruby-electric)

(add-hook 'ruby-mode-hook
		  (lambda ()
			(turn-on-hungry-delete-mode)
			(ruby-electric-mode t)
			(ruby-block-mode t)
			(define-key ruby-mode-map (kbd "RET") 'newline-and-indent)))
