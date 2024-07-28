;; ~/.emacs.d/init.el
;; 这两段一定要在 init.el 的最上方
(add-to-list 'load-path "~/.emacs.d/redos-emacs")

(require 'package)
(require 'redos-sources)
;; 初始化包管理器
(package-initialize)


;; 可以使用了。我们先更新本地缓存，相当于 apt-get update
;;(package-refresh-contents)
;; 然后安装一个软件包
;; 会被安装在 ~/.emacs.d/elpa 下
;;(package-install 'better-defaults)
;; 你不用关心 'load-path 怎么改。这里你可以直接 require 它：
;;(require 'better-defaults)

;; 如果 use-package 没安装
(unless (package-installed-p 'use-package)
  ;; 更新本地缓存
  (package-refresh-contents)
  ;; 之后安装它。use-package 应该是你配置中唯一一个需要这样安装的包。
  (package-install 'use-package))

(require 'use-package)
;; 让 use-package 永远按需安装软件包
(setq use-package-always-ensure t)

;; 之后就可以使用它了。
;; 比如上文安装并 require better-defaults 的过程就可以简化为这一行：
(use-package better-defaults)
(use-package compat)


;; 1. 它会判断是否已安装。没有时才会更新 package 缓存并安装它
;; 2. 它会自动 (require)
;; 3. 它有很多配置项能让你控制每个环节，从而做到把和这个软件包有关的所
;; 有配置写在一个闭包里。你可以去看它的文档，或者抄我下面的用例


;; quelpa - For those packages which are not in MELPA
(use-package quelpa
  :config ; 在 (require) 之后需要执行的表达式
  (use-package quelpa-use-package) ; 把 quelpa 嵌入 use-package 的宏扩展
  (quelpa-use-package-activate-advice)) ; 启用这个 advice

;; 直接 HTTP get 一个 elisp
(use-package dired+
  :quelpa (dired+ :fetcher url :url "https://www.emacswiki.org/emacs/download/dired+.el"))

;; git clone 一个 GitHub repo
(use-package elixir-mode
  :quelpa (elixir-mode :fetcher github :repo "elixir-editors/emacs-elixir"))

;; 只使用 repo 中的某些文件
(use-package mix
  :quelpa (mix.el :fetcher github :repo "ayrat555/mix.el" :files ("mix.el" "LICENSE"))
  :hook ((elixir-mode . mix-minor-mode)))


(require 'redos-general)
(require 'redos-git)
(require 'redos-lsp)
(require 'redos-search)
(require 'redos-terminal)
(require 'redos-c-language)

;; it is done
(provide 'init)
;;; init.el ends here
