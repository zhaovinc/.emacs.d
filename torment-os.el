(require 'ispell)
(require 'multi-term)

(if (equal system-type 'windows-nt)	
	(progn
      (setq tidy-shell-program "C:/Users/vincentzhao/AppData/Local/Programs/Git/bin/tidy.exe")))

(if (equal system-type 'darwin)
	(progn
	  (textmate-mode)
	  (setq mac-option-modifier 'control)
	  (setq mac-right-option-modifier 'control)
	  (setq mac-command-modifier 'meta)
	  (setq mac-right-command-modifier 'meta)
	  (setq ns-pop-up-frames nil) 
	  (setq tidy-shell-program "/usr/bin/tidy")
	  (setq multi-term-program "/bin/zsh")))


(defun cygwin-shell ()
  "Run cygwin bash in shell mode"
  (interactive)
  (let ((explicit-shell-file-name "C:/Users/vincentzhao/AppData/Local/Programs/Git/bin/bash")
		(explicit-bash-args '("-login" "-i")))
	(call-interactively 'shell)))

(defun toggle-full-screen-win32 ()
  "Toggles full screen mode on win32"
  (interactive)
  (shell-command "emacs_fullscreen.exe"))

(if (equal system-type 'windows-nt) 
	(global-set-key [f12] 'toggle-full-screen-win32))


(if (not (equal system-type 'gnu/linux))
	(scroll-bar-mode -1))
