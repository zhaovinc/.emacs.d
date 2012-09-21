(let ((default-directory "~/.emacs.d/"))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path))) ;; Shadow
           (append 
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))
      
(load "torment-init")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-indent-next-pair-timer-interval (quote ((c-mode 0.0006409063165838068) (emacs-lisp-mode 1.5) (lisp-interaction-mode 1.5) (default 0.0005))))
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes (quote ("401dd114d0de46ed898ebcdc107156d102bcd308357e8dedaf9709f7ab8cbd9e" default)))
 '(display-time-mode nil)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(scroll-bar-mode nil)
 '(session-use-package t nil (session))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Consolas")))))
 
 (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Monaco" :size 16)))
                      
                      
