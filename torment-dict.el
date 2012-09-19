(require 'dictionary)

(if (equal system-type 'windows-nt)
	(progn
	  (setf dictionary-use-http-proxy t)
	  (setf dictionary-proxy-server "proxy.wdf.sap.corp")
	  (setf dictionary-proxy-port 8080)))
