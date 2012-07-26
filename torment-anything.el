(require 'anything-config)
(require 'anything-show-completion)
(require 'anything-match-plugin)
(require 'descbinds-anything)
(require 'anything-etags)
(require 'anything-project)

(descbinds-anything-install)

;; (anything-read-string-mode 1)

(setq anything-sources
      '(
        anything-c-source-ffap-line
        anything-c-source-ffap-guesser
        anything-c-source-buffers+
        anything-c-source-file-cache
        anything-c-source-file-name-history
        anything-c-source-emacs-commands
        anything-c-source-bookmarks
        anything-c-source-etags-select
;;        anything-c-source-project
        ))

;; (global-set-key (kbd "M-y") 'anything-show-kill-ring)

(ap:add-project
 :name 'emacs-lisp
 :look-for '("torment_init.el")
 :include-regexp '("\\.el$")
 )
 
(ap:add-project
 :name 'python
 :look-for '("setup.py" "config.py" "conf.py")
 :include-regexp '("\\.py$" "\\.rst$")
)

;; (global-set-key (kbd "C-c C-f") 'anything-project)

			
;; (setq anything-c-use-standard-keys nil)
(define-key anything-map (kbd "M-i") 'anything-previous-line)
(define-key anything-map (kbd "M-k") 'anything-next-line)
(define-key anything-map (kbd "M-n") 'anything-next-source)
(define-key anything-map (kbd "M-p") 'anything-previous-source)
(define-key anything-map (kbd "M-h") 'anything-next-page)
(define-key anything-map (kbd "M-y") 'anything-previous-page)
(define-key anything-map (kbd "M-s") 'anything-isearch)
(define-key anything-map (kbd "<escape>") 'anything-quit)

(define-key anything-isearch-map (kbd "M-s") 'anything-isearch-again)

(add-hook 'objc-mode-hook
		  (lambda ()
			(push 'anything-c-source-project anything-sources)))
