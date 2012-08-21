(require 'magit)

(add-hook 'magit-mode-hook
		  (lambda() 
			(local-set-key (kbd "M-s") 'isearch-forward)
			(local-set-key (kbd "M-h") 'scroll-up)
			(local-set-key (kbd "M-c") 'magit-copy-item-as-kill))) 
