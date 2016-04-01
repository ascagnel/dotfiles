(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
(package-initialize)
(setq mac-option-modifier 'meta)
(require 'evil)
(evil-mode 1)
(require 'ido)
(ido-mode 1)
(linum-mode 1)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq fiplr-root-markers '(".git"))
(setq fiplr-ignored-globs '(directories (".git", ".npmrc")))
(global-set-key (kbd "C-x f") 'fiplr-find-file)
