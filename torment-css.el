;;; --------------------------------------------------
;;; css mode 

;; (add-hook 'css-mode-hook 'hexcolour-add-to-font-lock)
;; (add-hook 'html-mode-hook 'hexcolour-add-to-font-lock)

(add-hook 'css-mode-hook (lambda ()
						   (rainbow-mode)))

(add-hook 'html-mode-hook (lambda ()
                           (rainbow-mode)))

(add-hook 'css-mode-hook
		  (lambda ()
			(skewer-css-mode)))
