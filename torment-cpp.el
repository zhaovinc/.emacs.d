
(add-hook 'c-mode-common-hook
		  (lambda ()
		    (add-to-list 'ac-sources 'ac-source-yasnippet)
			(superword-mode t)))

(setq c-default-style "linux"
      c-basic-offset 4)

(setq-default c-basic-offset 4)

(let ((ede-projects-file "~/.emacs.d/ede-projects.el"))
  (if (file-exists-p ede-projects-file)
	  (load-file ede-projects-file)))

(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key (kbd "C-c o") 'ff-find-other-file)
	(local-set-key (kbd "M-e") 'er/expand-region)
    (local-set-key (kbd "M-.") 'semantic-ia-fast-jump)
    (local-set-key (kbd "M-,") 'semantic-mrub-switch-tags)))

(add-hook 'c-mode-common-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))
