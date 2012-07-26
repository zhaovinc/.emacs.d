
(if (equal system-type 'windows-nt)	
	(progn
	  (setq tidy-shell-program "C:/Program Files/emacs/bin/tidy.exe")))

(if (equal system-type 'darwin)
	(progn
	  (textmate-mode)
	  (setq mac-option-modifier 'control)
	  (setq mac-right-option-modifier 'control)
	  (setq mac-command-modifier 'meta)
	  (setq mac-right-command-modifier 'meta)
	  (setq ns-pop-up-frames nil) 
	  (setq tidy-shell-program "/usr/bin/tidy")))
