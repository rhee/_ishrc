;; .emacs

(global-set-key "\C-c;" 'set-mark-command)

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;;(setq require-final-newline 'query)

(setq package-archives '( ("marmalade" . "http://marmalade-repo.org/packages/")
			  ("gnu" . "http://elpa.gnu.org/packages/")
			  ("melpa" . "http://melpa.milkbox.net/packages/")))

;;;(load "~/.emacs-gdb-bindings")

;; tramp ssh and sudo


(unwind-protect
    nil ;;;(error "tramp proxy setting problem")
  (progn
    (require 'tramp)
    (add-to-list 'tramp-default-proxies-alist '("sudo-push001" nil "/ssh:push001.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push002" nil "/ssh:push002.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push003" nil "/ssh:push003.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push004" nil "/ssh:push004.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push005" nil "/ssh:push005.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push007" nil "/ssh:push007.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push008" nil "/ssh:push008.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push009" nil "/ssh:push009.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push010" nil "/ssh:push010.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push011" nil "/ssh:push011.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push012" nil "/ssh:push012.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push012-101" nil "/ssh:push012-101:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-push012-103" nil "/ssh:push012-103:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-xcentos6" nil "/ssh:push012-101:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-xcentos5" nil "/ssh:push012-103:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-loc" nil "/ssh:loc.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-wrdb" nil "/ssh:wrdb.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-sksvc" nil "/ssh:sksvc.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-family" nil "/ssh:family.safe4kid.co.kr:"))
    (add-to-list 'tramp-default-proxies-alist '("sudo-school-1" nil "/ssh:www-1.safeschool.kr:"))
  ))


(display-time)

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(if (fboundp 'cscope-minor-mode)
    (progn (defvar cscope-program "/usr/local/bin/cscope" )))

(setq inferior-R-program-name "~/.local/bin/R-wrapper")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (js2-mode php-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
