(require 'org-install)
(require 'deft)


(setq deft-extension "org"
    deft-directory "~/Dropbox/Notes/"
    deft-text-mode 'org-mode
	deft-extension "org")

(setq deft-use-filename-as-title t)

(add-hook 'org-mode-hook 
		  (lambda ()
			(local-set-key [M-e] 'er/expand-region)))