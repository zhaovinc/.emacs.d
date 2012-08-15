(require 'auto-complete-config)
(require 'auto-complete-clang)
(require 'dropdown-list)
(require 'yasnippet)
(require 'etags-table)

(setq yas/root-directory "~/.emacs.d/yasnippet/snippets")
(yas/load-directory yas/root-directory)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")

(load-file "~/.emacs.d/cedet/common/cedet.el")
(global-ede-mode 1)

(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)

(ac-config-default)

(setq ac-auto-start nil)
(setq ac-auto-show-menu nil)
(setq ac-dwim nil)
;;(setq ac-delay 0.2)

(add-to-list 'ac-modes 'nxml-mode)
(add-to-list 'ac-modes 'nxhtml-mode)
(add-to-list 'ac-modes 'c-mode)
(add-to-list 'ac-modes 'cpp-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'js2-mode)
(add-to-list 'ac-modes 'css-mode)

(global-set-key (kbd "M-/") 'auto-complete)
(define-key ac-completing-map "\t" 'ac-complete)
    
    
;;(setq yas/use-menu nil)
;;(setq yas/trigger-key nil)

;;(setq yas/prompt-functions '(yas/dropdown-prompt
;;                             yas/ido-prompt
;;                             yas/completing-prompt))

(yas/initialize)

(defvar ac-source-etags
  '((candidates . (lambda ()
         (all-completions ac-target (tags-completion-table))))
    (candidate-face . ac-candidate-face)
    (selection-face . ac-selection-face)
    (requires . 3))
  "etags source")






