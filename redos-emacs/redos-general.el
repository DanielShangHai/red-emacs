;; ~/.emacs.d/redos-general.el

(message "redos-general.el loaded.")


(use-package helm
  ;; 等价于 (bind-key "M-x" #'helm-M-x)
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files))
  :config
  ;; 全局启用 Helm minor mode
  (helm-mode 1))
(message "redos-general helm.")

(use-package company
  ;; 等价于 (add-hook 'after-init-hook #'global-company-mode)
  :hook (after-init . global-company-mode)
  :config
  ;; setq 可以像这样连着设置多个变量的值
  (setq company-tooltip-align-annotations t ; 注释贴右侧对齐
        company-tooltip-limit 20            ; 菜单里可选项数量
        company-show-numbers t              ; 显示编号（然后可以用 M-数字 快速选定某一项）
        company-idle-delay .2               ; 延时多少秒后弹出
        company-minimum-prefix-length 1     ; 至少几个字符后开始补全
        ))
(message "redos-general company.")


;;错误 / 警告提示引擎 flycheck 是一个更「现代」的引擎，功能更多，呈现样式更丰富，同时和 lsp-mode 结合最好。
(use-package flycheck
  :init ;; 在 (require) 之前需要执行的
  (setq flycheck-emacs-lisp-load-path 'inherit)
  :config
  (global-flycheck-mode))
(message "redos-general flycheck.")



(use-package projectile
  :config
  ;; 把它的缓存挪到 ~/.emacs.d/.cache/ 文件夹下，让 gitignore 好做
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  ;; 全局 enable 这个 minor mode
  (projectile-mode 1)
  ;; 定义和它有关的功能的 leader key
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map))

(use-package helm-projectile
  :if (functionp 'helm) ;; 如果使用了 helm 的话，让 projectile 的选项菜单使用 Helm 呈现
  :config
  (helm-projectile-on))

(message "redos-general projectile helm-projectile.")

;;(use-package srcery-theme
;;     :config
;;     (load-theme 'srcery t))


;; (load-theme 'solarized-light t) ;;magit theme  should be after magit installed


;;(list-packages)
;;show the line number
(global-display-line-numbers-mode 1)
(setq confirm-kill-emacs #'yes-or-no-p)      ; 在关闭 Emacs 前询问是否确认关闭，防止误触
(electric-pair-mode t)                       ; 自动补全括号
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
(column-number-mode t)                       ; 在 Mode line 上显示列号
(global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(add-hook 'prog-mode-hook #'hs-minor-mode)   ; 编程模式下，可以折叠代码块






(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsel-mark-ring); 在某些终端上 C-x C-SPC 会被映射为 C-x C-@，比如在 macOS 上，所以要手动设置
   ("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))





(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode)
              (ggtags-mode 1))))


(message "redos-general finished.")



(provide 'redos-general)
