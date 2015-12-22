(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)
(package-initialize)
(setq mac-option-modifier 'meta)
(require 'evil)
(evil-mode 1)
(require 'ido)
(ido-mode t)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(global-git-gutter-mode +1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (mbo70s)))
 '(custom-safe-themes
   (quote
    ("0fb6369323495c40b31820ec59167ac4c40773c3b952c264dd8651a3b704f6b5" "9d7e517b49068e9fef941fe4083ad3d2a4b040895dca5175b84be48739689707" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
