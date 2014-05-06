(require 'tramp)

(cond
 ((eq system-type 'windows-nt)
  (setq tramp-default-method "plink"
        tramp-password-end-of-line "\r\n"))
 ((eq system-type 'gnu/linux)
  (setq tramp-default-method "ssh"))
 ((eq system-type 'darwin)
  (setq tramp-default-method "ssh")))

(setq tramp-default-user "root"
      tramp-default-host "")

(setq password-cache-expiry 36000)

(setq tramp-auto-save-directory "d:\\tmp")

