(require 'yasnippet)
(require 'etags-table)
(require 'company)

(load-file "~/.emacs.d/src/cedet/common/cedet.el")
(global-ede-mode 1)

(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)

(setq yas-snippet-dirs
      (list "~/.emacs.d/snippets"
            (concat (file-name-as-directory
                     (file-name-directory
                      (find-library-name "yasnippet")))
                    "snippets")))

(yas-global-mode 1)
    
;;(setq yas/use-menu nil)
;;(setq yas/trigger-key nil)

(setq yas/prompt-functions '(yas/dropdown-prompt
                            yas/ido-prompt
                            yas/completing-prompt))

(global-company-mode)

(global-set-key (kbd "M-/") 'company-complete)
(define-key company-active-map "\M-i" 'company-select-previous)
(define-key company-active-map "\M-k" 'company-select-next)
(define-key company-active-map "\M-s" 'company-search-candidates)

(add-to-list 'company-backends 'company-omnisharp)
(add-to-list 'company-backends 'company-yasnippet)


