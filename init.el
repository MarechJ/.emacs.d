;; Builtins
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(column-number-mode 1)
 '(inhibit-startup-screen t)
 '(linum-format "%d ")
 '(show-paren-mode t)
 '(global-linum-mode 1)
)

;; Disable toolbars crap
(menu-bar-mode -1)
(tool-bar-mode -1)

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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
