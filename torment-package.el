(require 'package)

;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))        


(package-initialize)

(require-package 'ag)
(require-package 'apache-mode)
(require-package 'ace-jump-mode)
(require-package 'ace-isearch)
(require-package 'auto-indent-mode)
(require-package 'autopair)
(require-package 'auto-complete)
(require-package 'bm)
(require-package 'browse-kill-ring)
(require-package 'csharp-mode)
(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'color-theme-sanityinc-solarized)
(require-package 'cycbuf)
(require-package 'deft)
(require-package 'dictionary)
(require-package 'elisp-slime-nav)
(require-package 'escreen)
(require-package 'emacs-eclim)
(require-package 'etags-table)
(require-package 'expand-region)
(require-package 'ensime)
(require-package 'graphviz-dot-mode)
(require-package 'helm)
(require-package 'helm-gtags)
(require-package 'helm-projectile)
(require-package 'helm-swoop)
(require-package 'highlight-parentheses)
(require-package 'highlight-symbol)
(require-package 'hungry-delete)
(require-package 'idle-highlight-mode)
(require-package 'iedit)
(require-package 'js2-mode)
(require-package 'lusty-explorer)
(require-package 'magit)
(require-package 'multiple-cursors)
(require-package 'monokai-theme)
(require-package 'mic-paren)
(require-package 'mo-git-blame)
(require-package 'markdown-mode)
(require-package 'omnisharp)
(require-package 'paredit)
(require-package 'php-mode)
(require-package 'projectile)
(require-package 'rainbow-delimiters)
(require-package 'rainbow-mode)
(require-package 'rinari)
(require-package 'rhtml-mode)
(require-package 'ruby-tools)
(require-package 'scala-mode2)
(require-package 'session)
(require-package 'sass-mode)
(require-package 'slim-mode)
(require-package 'smart-mode-line)
(require-package 'smex)
(require-package 'skewer-mode)
(require-package 'slime)
(require-package 'tern)
(require-package 'tern-auto-complete)
(require-package 'fill-column-indicator)
(require-package 'textile-mode)
(require-package 'tidy)
(require-package 'undo-tree)
(require-package 'web-mode)
(require-package 'wrap-region)
(require-package 'window-number)
(require-package 'yaml-mode)
(require-package 'yasnippet)
