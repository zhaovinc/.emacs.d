(require 'eclim)
(require 'eclimd)
(require 'ac-emacs-eclim-source)

(global-eclim-mode)

(setq help-at-pt-display-when-idle nil)
;; (setq help-at-pt-timer-delay 3)
;; (help-at-pt-set-timer)

(ac-emacs-eclim-config)

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))


