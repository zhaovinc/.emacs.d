;;(require 'eclim)
;;(require 'eclimd)
(require 'web-mode)

;; (global-eclim-mode)

;;(setq help-at-pt-display-when-idle nil)
;; (setq help-at-pt-timer-delay 3)
;; (help-at-pt-set-timer)


(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))

;; bug: https://github.com/senny/emacs-eclim/issues/58
;;(add-to-list 'eclim--file-coding-system-mapping '("iso-latin-1-unix" . "iso-8859-1"))

(add-hook 'java-mode-hook
		  (lambda ()
			(electric-pair-mode 0)))
