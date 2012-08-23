
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


(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
     
(add-hook 'c-mode-common-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))
