;; ~/.emacs.d/redos-sources.el
(message "redos-sources.el loaded.")


(add-to-list 'package-archives   '("gnu" . "https://elpa.gnu.org/packages/"))

;;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
;;(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/") t)

;; MELPA：软件包比 ELPA 多（软件进入 MELPA 比 ELPA 手续更简单）、新
;; （nightly 级别的更新速度，以时间作为版本号）
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; 稳定版 MELPA （非 nightly，有版本号）
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; org-mode 专用软件源。它几乎只服务于 org-plus-contrib 这一个包
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)


(provide 'redos-sources)



