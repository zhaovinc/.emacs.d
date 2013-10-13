
(add-hook 'c-mode-common-hook
		  (lambda ()
			(add-to-list 'ac-sources 'ac-source-clang)
			(add-to-list 'ac-sources 'ac-source-yasnippet)))

(if (equal system-type 'windows-nt)	
	    (setq ac-clang-flags  (list   
                                     "-IC:/MinGW/include"  
                                     "-IC:/MinGW/lib/gcc/mingw32/4.6.2/include"
                                     "-IC:/MinGW/lib/gcc/mingw32/4.6.2/include/c++" 
                                     "-D__MSVCRT__=")))
(if (equal system-type 'darwin)
	(setq ac-clang-flags
		  (mapcar (lambda (item) (concat "-I" item))
					(split-string "
 /usr/llvm-gcc-4.2/bin/../lib/gcc/i686-apple-darwin11/4.2.1/include
 /usr/include/c++/4.2.1
 /usr/include/c++/4.2.1/backward
 /usr/local/include
 /Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include
 /usr/include
"))))

(setq c-default-style "linux"
      c-basic-offset 4)

(setq-default c-basic-offset 4)


(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key (kbd "C-c o") 'ff-find-other-file)
    (local-set-key (kbd "M-.") 'semantic-ia-fast-jump)
    (local-set-key (kbd "M-,") 'semantic-mrub-switch-tags)))

(add-hook 'c-mode-common-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))
