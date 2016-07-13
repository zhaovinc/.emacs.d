;;; --------------------------------------------------
;;; css mode 

;; (add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)
;; (add-hook 'html-mode-hook 'hexcolour-add-to-font-lock)

(add-hook 'css-mode-hook (lambda ()
						   (rainbow-mode)))

(add-hook 'html-mode-hook (lambda ()
                           (rainbow-mode)))

(add-hook 'css-mode-hook
		  (lambda ()))

(add-hook 'sass-mode-hook (lambda ()
							(ranbow-mode)))

(setq css-indent-offset 2)
