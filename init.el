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

;;******************** SMEX ********************
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;******************** HELM ********************
;;(require 'helm)
;;(global-set-key (kbd "M-x") 'helm-M-x)


;;******************** Run TESTS ********************

(global-set-key (kbd "<f9>") 'recompile)


;;******************** Pane switch with shift+arrows ********************

;; use Shift+arrow_keys to move cursor around split panes
(windmove-default-keybindings)
;; when cursor is on edge, move to the other side, as in a toroidal space
(setq windmove-wrap-around t )


;; Tidy up

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; HideShow mode

(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
              (hs-toggle-hiding)
            (error t))
          (hs-show-all))
    (toggle-selective-display column)))

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
         (1+ (current-column))))))

(load-library "hideshow")
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'c++-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)
;; Hide the comments too when you do a 'hs-hide-all'
(setq hs-hide-comments nil)
;; Set whether isearch opens folded comments, code, or both
;; where x is code, comments, t (both), or nil (neither)
(setq hs-isearch-open 'x)


;;******************** Disable toolbars crap ********************
(menu-bar-mode -1)
(tool-bar-mode -1)

;;******************** Package repos ********************
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

;; Auto update packages ()
;;(auto-package-update-mayevery 7 days)
;;(setq auto-package-update-delete-old-versions t)

;;******************** Themes ********************
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; Monokai
(load-theme 'monokai t)


;;******************** IDO ********************
(ido-mode t)


;;******************** Flycheck ********************
(add-hook 'after-init-hook #'global-flycheck-mode)


;;******************** Rebinds ********************
(global-set-key (kbd "C-f") 'goto-line) ; Ctrl+f


;;******************** PYTHON ********************

;; Virtualenv
;; (require 'virtualenvwrapper)
;; (venv-initialize-interactive-shells) ;; if you want interactive shell support
;; (venv-initialize-eshell) ;; if you want eshell support
;; (setq venv-location "~/.virtualenvs")

(add-hook 'python-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command) "nosetests")))
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
