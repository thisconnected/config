;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;       (bootstrap-version 5))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-enabled-themes '(tango-dark)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;; (straight-use-package 'helm)

;; (helm-mode 1)

;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (setq completion-styles '(flex))


(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))


;;packages
(straight-use-package 'use-package)

(straight-use-package 'helm)

(straight-use-package 'php-mode)

(straight-use-package 'magit)

(straight-use-package 'flycheck)

(straight-use-package 'json-mode)

(straight-use-package 'auto-complete)

(straight-use-package 'yasnippet)

(straight-use-package 'yasnippet-snippets)

(straight-use-package 'auto-yasnippet)

(straight-use-package 'htmlize)

(straight-use-package 'ctags-update)

(straight-use-package 'cmake-mode)

(straight-use-package 'org-bullets)

(straight-use-package 'ansible)

(straight-use-package 'yaml-mode)

(straight-use-package 'jinja2-mode)

(straight-use-package 'systemd)

(straight-use-package 'docker-compose-mode)

(straight-use-package 'docker)

(straight-use-package 'dockerfile-mode)

(straight-use-package 'ispell)

;; (straight-use-package 'jedi)

(straight-use-package 'pyvenv)

(straight-use-package 'markdown-mode)

(straight-use-package 'jenkinsfile-mode)

(straight-use-package 'magit-delta)

(straight-use-package 'lsp-mode)

(add-hook 'prog-mode-hook #'lsp)

(straight-use-package 'lsp-jedi)


(straight-use-package 'exec-path-from-shell)

(when (daemonp)
  (exec-path-from-shell-initialize))

;;--------------------
;;python stuff
(defun enable-scripting ()
  "Enables scripting config for python."
  (interactive)
  (setenv "PYTHONPATH" "/home/thisconnect/microservices/enhancement-ms/"))
(defun enable-microservices ()
  "Enables microservices config for python."
  (interactive)
  (setenv "PYTHONPATH" "/var/www/enhancement-microservices/enhancement-ms/app/common"))

(add-hook 'python-mode-hook "setq 'lsp-pylsp-plugins-flake8-config \"/home/thisconnect/microservices/.flake8\"")
;; (setq lsp-jedi-workspace-extra-paths
;;   (vconcat lsp-jedi-workspace-extra-paths
;;            ["/home/thisconnect/microservices/enhancment-ms/app/common"]))

;; python autocomplete via jedi
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)

;;end pythonstuff
;;--------------------
;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable))

;; (straight-use-package 'org-tempo)

;;(setq default-directory "C:/Documents and Settings/Patryk Kaniewski/")

;;(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)


(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)



(add-hook 'after-init-hook #'global-flycheck-mode)

(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t))
 )

(org-babel-do-load-languages 'org-babel-load-languages
    '(
        (shell . t)
    )
)

(add-hook 'org-mode-hook #'(lambda ()
                             ;; make the lines in the buffer wrap around the edges of the screen.
                             ;; to press C-c q  or fill-paragraph ever again!
                             (visual-line-mode)
                             (org-indent-mode)))

(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(setq org-log-done t)



;; (setq
;;  helm-gtags-ignore-case t
;;  helm-gtags-auto-update t
;;  helm-gtags-use-input-at-cursor t
;;  helm-gtags-pulse-at-cursor t
;;  helm-gtags-prefix-key "\C-cg"
;;  helm-gtags-suggested-key-mapping t
;;  )

;; (require 'helm-gtags)
;; ;; Enable helm-gtags-mode
;; (add-hook 'dired-mode-hook 'helm-gtags-mode)
;; (add-hook 'eshell-mode-hook 'helm-gtags-mode)
;; (add-hook 'c-mode-hook 'helm-gtags-mode)
;; (add-hook 'c++-mode-hook 'helm-gtags-mode)
;; (add-hook 'asm-mode-hook 'helm-gtags-mode)

;; (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;; (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
;; (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;; (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;; (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;; (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(require 'org-tempo)
;;(add-to-list 'org-modules 'org-tempo t) ;;add easy templating

;;test
(setf org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))

;;move line up

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

;; ISPELL
(add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\):" . ":END:"))
(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))


(global-set-key [(meta up)]  'move-line-up)
(global-set-key [(meta down)]  'move-line-down)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "LOWPRIORITY" "ONGOING" "PENDING" "VERIFY" "BLOCKED" "DONE" )))
(setq org-todo-keyword-faces
      '(("PENDING" . org-warning)
	("TODO" . "orange")
	("ONGOING" . "cyan")
	("WAITING" . "white")
	("LOWPRIORITY" . "purple")
	("VERIFY" . (:foreground "green" :weight bold))
	("BLOCKED" . (:foreground "white" :weight bold))
	))

;;add python keyword
(setq python-font-lock-keywords-maximum-decoration
      (append python-font-lock-keywords-maximum-decoration
	      '(("f\\(['\"]\\{1,3\\}\\)\\(.+?\\)\\1"
		 ("{[^}]*?}"
		  (progn (goto-char (match-beginning 0)) (match-end 0))
		  (goto-char (match-end 0))
		              (0 font-lock-type-face t))))))
;; globally display numbers
(global-display-line-numbers-mode)
;; show lineendings everywhere
;; (global-whitespace-newline-mode)
;; show lineendings with custom sign
(setq whitespace-display-mappings
      '((newline-mark 10 [172 10])))

(defun kill-other-buffers ()
  "Kill all buffer except current one."
  (interactive)
    (mapc 'kill-buffer (cdr (buffer-list (current-buffer)))))

(put 'upcase-region 'disabled nil)
(add-to-list 'exec-path "/home/thisconnect/.local/bin")
(provide '.emacs)
;;; .emacs ends here


