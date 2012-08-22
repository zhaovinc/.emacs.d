(require 'magit)

(setq magit-save-some-buffers nil
      magit-process-popup-time 60
      magit-completing-read-function 'magit-ido-completing-read)


(add-hook 'magit-mode-hook
		  (lambda() 
			(local-set-key (kbd "M-s") 'isearch-forward)
			(local-set-key (kbd "M-h") 'scroll-up)
			(local-set-key (kbd "M-c") 'magit-copy-item-as-kill))) 

