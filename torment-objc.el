(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))

			
;; created by the following command: 
;; find /Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.0.sdk/System/Library/Frameworks -name "*.h" | xargs ~/bin/etags -f objc.TAGS -l objc --declarations

;;(add-to-list  'etags-table-alist
;;             '("\\.[mh]$" "~/.emacs.d/tags/objc.TAGS"))
