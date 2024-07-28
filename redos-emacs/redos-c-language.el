;; ~/.emacs.d/redos-c-language.el


;; sudo apt-get install global
;; https://blog.csdn.net/eidolon_foot/article/details/78058732

(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode)
              (ggtags-mode 1))))

(message "redos-c-language.")

;; if want to use cxscope, could follow  
;; https://www.cnblogs.com/aqing1987/p/4335327.html




(provide 'redos-c-language)
