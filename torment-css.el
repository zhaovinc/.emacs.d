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
			(define-key css-mode-map "\M-\C-x" 'slime-js-refresh-css)
			(define-key css-mode-map "\C-c\C-r" 'slime-js-embed-css)))
