(require 'dictionary)
(require 'sdcv)

(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra"))
(setq ispell-personal-dictionary "~/.ispell")

;; (when (equal system-type 'windows-nt)
;;   (setf dictionary-use-http-proxy t)
;;   (setf dictionary-proxy-server "proxy.wdf.sap.corp")
;;   (setf dictionary-proxy-port 8080))


(setq sdcv-dictionary-simple-list   
      '("牛津现代英汉双解词典" "WordNet"))



