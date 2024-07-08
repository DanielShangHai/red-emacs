;;;; ~/.emacs.d/redos-search.el



;;搜索、跳转和替换
(use-package helm-ag)

(use-package ctrlf
  :config
  (ctrlf-mode t))
;; 此时 C-s 已经被替换成 ctrlf 版本的了



(provide 'redos-search)
