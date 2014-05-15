(require 'ispell)

(if (equal system-type 'windows-nt)	
	(progn
	  (menu-bar-mode 0)
      (setq tidy-shell-program "C:/Users/vincentzhao/AppData/Local/Programs/Git/bin/tidy.exe")))

(if (equal system-type 'darwin)
	(progn
	  (require 'textmate)
	  (textmate-mode)
	  (setq mac-option-modifier 'control)
	  (setq mac-right-option-modifier 'control)
	  (setq mac-command-modifier 'meta)
	  (setq mac-right-command-modifier 'meta)
	  (setq ns-pop-up-frames nil) 
	  (setq tidy-shell-program "/usr/bin/tidy")))


(defun cygwin-shell ()
  "Run cygwin bash in shell mode"
  (interactive)
  (let ((explicit-shell-file-name "C:/Users/vincentzhao/AppData/Local/Programs/Git/bin/bash")
		(explicit-bash-args '("-login" "-i")))
	(call-interactively 'shell)))

(if (not (equal system-type 'gnu/linux))
	(scroll-bar-mode -1))
