(require 'textile-mode)

(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

(if (equal system-type 'windows-nt)
	(setq httpd-root "c:/work/sandbox/www"))

(if (equal system-type 'darwin)
    (setq httpd-root "~/Sandbox/html"))

(add-hook 'html-mode-hook
          (lambda ()
            (skewer-html-mode)))

(add-to-list 'magic-mode-alist '("<!DOCTYPE html .+DTD XHTML .+>" . nxml-mode))
