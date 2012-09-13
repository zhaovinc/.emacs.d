(require 'ack-and-a-half)
(require 'ido)
(require 'bm)
(require 'escreen)
(require 'highlight-symbol)
(require 'highlight-parentheses)
(require 'mic-paren)
(require 'rainbow-delimiters)
(require 'autopair)
(require 'lusty-explorer)
(require 'iedit)
(require 'hungry-delete)
(require 'window-number)
(require 'color-theme-sanityinc-tomorrow)
(require 'expand-region)
(require 'wrap-region)
(require 'smex)
(require 'inline-string-rectangle)
(require 'mark-more-like-this)
(require 'idle-highlight-mode)
(require 'undo-tree)
(require 'sml-modeline)
(require 'restclient)
(require 'graphviz-dot-mode)
(require 'maxframe)
(require 'cycbuf)
(require 'ace-jump-mode)
(require 'session)
(require 'auto-indent-mode)

(set-language-environment "utf-8")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(color-theme-sanityinc-tomorrow-bright)

(add-hook 'after-init-hook 'session-initialize)
(add-hook 'window-setup-hook 'maximize-frame t)

(setq frame-title-format
	  '((:eval (system-name)) ": " (:eval (if (buffer-file-name)
											  (abbreviate-file-name (buffer-file-name))
											"%b"))))

(delete-selection-mode 1)
(cua-mode t)
(autopair-global-mode)
(ido-mode t)
(global-linum-mode t)
(tool-bar-mode 0)

(sml-modeline-mode 1)
(scroll-bar-mode -1)

(if (equal system-type 'windows-nt) 
	(menu-bar-mode 0))

(setq split-height-threshold nil)
(setq split-width-threshold 85)

(window-number-meta-mode)

(smex-initialize)

(paren-activate)
(global-rainbow-delimiters-mode)

(setq escreen-prefix-char "\C-t")
(escreen-install)

(wrap-region-mode t)

(auto-indent-global-mode)
(setq auto-indent-current-pairs nil)

(setq undo-tree-mode-lighter "")
(global-undo-tree-mode)

(setq redisplay-dont-pause t
	  scroll-margin 10
	  scroll-step 1
	  scroll-conservatively 100000
	  scroll-preserve-screen-position 1)

(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
	  `((".*" ,temporary-file-directory t)))


(setq-default tab-width 4)
(setq autopair-autowrap t)
(setq make-backup-files nil)
(setq cua-enable-cua-keys nil)
(setq inhibit-startup-message t)
(setq frame-title-format "emacs@%b")
(setq cua--rectangle-modifier-key 'control)

(put 'set-goal-column 'disabled nil)

;; Always start a new shell 
(defadvice shell (around always-new-shell)
  "Always start a new shell."
  (let ((buffer (generate-new-buffer-name "*shell*"))) ad-do-it))

(ad-activate 'shell)

;; Buffer switch
(global-set-key (kbd "M-{") 'cycbuf-switch-to-next-buffer-no-timeout)
(global-set-key (kbd "M-}") 'cycbuf-switch-to-previous-buffer-no-timeout)


;; Bookmarks
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)


;; Aliases
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ggrep 'vc-git-grep)

(defalias 'yes-or-no-p 'y-or-n-p)

(defalias 'rr 'replace-regexp)
(defalias 'qr 'query-replace)
(defalias 'qrr 'query-replace-regexp)
(defalias 'lml 'list-matching-lines)
(defalias 'dml 'delete-matching-lines)
(defalias 'rof 'recentf-open-files)

(defalias 'eb 'eval-buffer)
(defalias 'er 'eval-region)
(defalias 'ee 'eval-expression)

(defalias 'ms 'magit-status)
(defalias 'ttl 'toggle-truncate-lines)

;; Mark Multiple
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-*") 'mark-all-like-this)

;; Nifty textmate mode binding 
(global-set-key (kbd "<M-return>") 'auto-indent-eol-newline)

;; Textmate Mode key (obsolete)
;; (global-set-key (kbd "C-M-t") 'textmate-clear-cache)
;; (global-set-key (kbd "C-M-]") 'align)
;; (global-set-key (kbd "C-M-[") 'indent-according-to-mode)
;; (global-set-key (kbd "M-]")  'textmate-shift-right)
;; (global-set-key (kbd "M-[") 'textmate-shift-left)
;; (global-set-key (kbd "M-\\") 'comment-or-uncomment-region-or-line)
;; (global-set-key (kbd "M-L") 'textmate-select-line)
;; (global-set-key (kbd "M-t") 'textmate-goto-file)
;; (global-set-key (kbd "M-T") 'textmate-goto-symbol)

;; Single char cursor movement
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)

;; Move by word
(global-set-key (kbd "M-u") 'backward-word)
(global-set-key (kbd "M-o") 'forward-word)

;; Move to beginning/ending of line
(global-set-key (kbd "C-a") 'beginning-of-line)
(global-set-key (kbd "C-e") 'end-of-line)

;; Screen Scroll
(global-set-key (kbd "M-y") 'scroll-down)
(global-set-key (kbd "M-h") 'scroll-up)

;; Auto selection
;; (global-set-key (kbd "M-e") 'extend-selection)
(global-set-key (kbd "M-e") 'er/expand-region)

;; Move to beginning/ending of buffer
(global-set-key (kbd "M-<") 'beginning-of-buffer)
(global-set-key (kbd "M->") 'end-of-buffer)

;; Move by character
(define-key global-map (kbd "M-f") 'go-to-char)
(define-key global-map (kbd "M-b") 'back-to-char)
(define-key global-map (kbd "C-f") 'zap-up-to-char)
(define-key global-map (kbd "C-b") 'zap-back-to-char)

;; isearch
(global-set-key (kbd "M-s") 'isearch-forward)
(global-set-key (kbd "M-r") 'isearch-backward)

;;; MAJOR EDITING COMMANDS

;; Delete previous/next char.
(global-set-key (kbd "C-d") 'delete-char)

;; Delete previous/next word.
(global-set-key (kbd "C-w") 'backward-kill-word)

;; Copy Cut Paste, Paste previous
(global-set-key (kbd "M-x") 'kill-region)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-V") 'yank-pop)
(global-set-key (kbd "M-C") 'copy-all)
(global-set-key (kbd "M-X") 'cut-all)

;; undo and redo
(global-set-key (kbd "M-Z") 'redo)
(global-set-key (kbd "M-z") 'undo)

; Kill line 
;(global-set-key (kbd "??") 'kill-line) 
;(global-set-key (kbd "??") 'kill-line-backward)

;;; Textual Transformation
(global-set-key (kbd "M-P") 'mark-paragraph)
;;(global-set-key ergoemacs-shrink-whitespaces-key 'shrink-whitespaces)

;;; Imenu symbol
(global-set-key (kbd "M-g") 'ido-goto-symbol)


;;; EMACS'S SPECIAL COMMANDS

;; Mark point.
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; Execute command
(global-set-key (kbd "M-'") 'smex)
;; (global-set-key (kbd "M-'") 'execute-extended-command)

;; Repeat last command
;; (global-set-key (kbd "M-.") 'repeat-complex-command)

;;; --------------------------------------------------
;;; STANDARD SHORTCUTS

(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-n") 'new-empty-buffer)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "M-A") 'mark-whole-buffer)

(global-set-key (kbd "<delete>") 'delete-char) ; the Del key for forward delete

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-h o") 'where-is-old-binding)

;; Ctrl+Break is a common IDE shortcut to stop compilation/find/grep
(global-set-key (kbd "C-<pause>") 'kill-compilation)
(global-set-key (kbd "M-<backspace>") 'delete-indentation)

(global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-x b")   'lusty-buffer-explorer)


;;; --------------------------------------------------
;;; OTHER SHORTCUTS

;(global-set-key (kbd "M-5") 'query-replace)
;(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-r") 'iedit-mode)

(global-set-key (kbd "<escape>") 'delete-other-windows)
(global-set-key (kbd "M-+") 'toggle-truncate-lines)


;;; --------------------------------------------------
;;; symbol highlight

(global-set-key (kbd "M-p") 'highlight-symbol-prev)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-*") 'highlight-symbol-at-point)

;;; -------------------------------------------------
(global-set-key (kbd "C-9") '(lambda()(interactive)(opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)(opacity-modify)))

;;; --------------------------------------------------
;;; ace jump mode
(global-set-key (kbd "M-m") 'ace-jump-mode)

;;; --------------------------------------------------
;;; tag navigation
;(global-set-key (kbd "M-??") 'pop-tag-mark)

;;; --------------------------------------------------
;;; paren matching
;; (global-set-key (kbd "M-??") 'move-to-matching-paren)

;;; --------------------------------------------------
;;; anything
;;;(global-set-key (kbd "M-a") 'anything)

;;; --------------------------------------------------
;;; isearch mode
(add-hook 'isearch-mode-hook
 (lambda ()
 (define-key isearch-mode-map (kbd "M-s") 'isearch-repeat-forward)
 (define-key isearch-mode-map (kbd "M-r") 'isearch-repeat-backward)
 (define-key isearch-mode-map (kbd "M-w") 'backward-kill-word)
 (define-key isearch-mode-map (kbd "M-v") 'isearch-yank-kill)
 (define-key isearch-mode-map (kbd "M-V") 'isearch-yank-word-or-char)))
 
 
;;; --------------------------------------------------
;;; isearch mode 
(add-hook 'Info-mode-hook
 (lambda ()
 (define-key Info-mode-map (kbd "M-s") 'isearch-forward)
 (define-key Info-mode-map (kbd "M-r") 'isearch-backward)
  )
)


