(require 'ispell)

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


(defun cygwin-shell ()
  "Run cygwin bash in shell mode"
  (interactive)
  (let ((explicit-shell-file-name "c:/program files (x86)/git/bin/bash")
		(explicit-bash-args '("-login" "-i")))
	(call-interactively 'shell)))

(defun toggle-full-screen-win32 ()
  "Toggles full screen mode on win32"
  (interactive)
  (shell-command "emacs_fullscreen.exe"))

(if (equal system-type 'windows-nt) 
	(global-set-key [f12] 'toggle-full-screen-win32))


(if (equal system-type 'windows-nt) 
	(defun ack-and-a-half-shell-quote (string)
	  "Workaround for the issue that ack does not work with pattern with single quote in win32"
	  (message string)))
