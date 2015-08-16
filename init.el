(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
;; themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(require 'ido)
(ido-mode t)

;; JEDI
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)       

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Monokai
(load-theme 'monokai t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" default)))
 '(show-paren-mode t)
 '(auto-save-default nil)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; Theme
 )


