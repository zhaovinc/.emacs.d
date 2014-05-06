(require 'textile-mode)
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

(if (equal system-type 'windows-nt)
	(setq httpd-root "c:/work/sandbox/www"))

(if (equal system-type 'darwin)
    (setq httpd-root "~/Sandbox/html"))


(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vm\\'" . web-mode))


(add-hook 'html-mode-hook
          (lambda ()))

(add-to-list 'magic-mode-alist '("<!DOCTYPE html .+DTD XHTML .+>" . nxml-mode))
