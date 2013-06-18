(require 'eclim)
(require 'eclimd)
(require 'ac-emacs-eclim-source)

(global-eclim-mode)

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

(ac-emacs-eclim-config)

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))


