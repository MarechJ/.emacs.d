;; Builtins
(custom-set-variables
 '(linum-format "%d ")
 '(column-number-mode 1)
 '(show-paren-mode t)
 '(auto-save-default nil)
 )

;; Package repos
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; IDO
(require 'ido)
(ido-mode t)


;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Monokai
(load-theme 'monokai t)

;; Rebinds
(global-set-key (kbd "C-f") 'goto-line) ; Ctrl+f


;;              PYTHON

;; JEDI
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Force indend 4 spaces
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq-default indent-tabs-mode nil)
	    (setq-default tab-width 4)
	    (setq-default python-indent 4)
	    ))
