  (require 'package)
	(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
	(package-initialize)

  ;; use-package to simplify the config file
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package)
  (setq use-package-always-ensure 't)
  
    (setq inhibit-startup-message t)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (defalias 'yes-or-no-p 'y-or-n-p)
  
    (use-package exotica-theme
    :config (load-theme 'exotica t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(elfeed-org elfeed exotica-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

  (use-package elfeed
    :ensure t
    :config
    (setq elfeed-db-directory (expand-file-name "elfeed" user-emacs-directory)
          elfeed-show-entry-switch 'display-buffer)
    :bind
    ("C-x w" . elfeed ))
	
  (use-package elfeed-org
    :ensure t
    :config
    (elfeed-org)
    (setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org")))

	(setq-default elfeed-search-filter "@1-day-ago +unread ")