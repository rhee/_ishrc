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

(setq diff-switches "-u") ;; default to unified diffs

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

(setq package-archives
  '(("marmalade" . "http://marmalade-repo.org/packages/")
    ("gnu" . "http://elpa.gnu.org/packages/")
    ("melpa" . "http://melpa.milkbox.net/packages/")))

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(if (fboundp 'cscope-minor-mode)
    (progn (defvar cscope-program "/usr/local/bin/cscope" )))

(add-hook
 'ess-mode-hook
 '(lambda()
    (when t
      (let ((cust-alist ess-r-customize-alist))
	(setcdr (assoc 'inferior-ess-primary-prompt cust-alist)
		"In \\[[0-9]+\\]: ")
	(setcdr (assoc 'inferior-ess-secondary-prompt cust-alist)
		"\\.\\.\\.\\.: ")
	nil))))

(add-hook
 'go-mode-hook
 '(lambda()
    (flycheck-mode)))

(add-hook
 'js2-mode-hook
 '(lambda()
    (flycheck-mode)))

(let ((list (directory-files "~/.local/etc/profile.d/" t ".*\.el$")))
    (while list
    (message (format "loading %s" (car list)))
    (load-library (car list))
    (setq list (cdr list))))


(display-time)

(menu-bar-mode -1)
;;(toggle-scroll-bar -1)
(tool-bar-mode -1)

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
