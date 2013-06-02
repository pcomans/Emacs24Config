;;Emacs Starter Kit
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-bindings)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; My customizations
;; Turn the menu bar on again
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse    
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Do not open files in a new frame
(setq ns-pop-up-frames nil)

(setq ns-alternate-modifier 'none)
(setq ns-command-modifier 'meta)

;;use delete-selection-mode
(delete-selection-mode 1)

;;makes Emacs automatically revert the current buffer every five seconds
(global-auto-revert-mode 1)

(when window-system
   (setq frame-title-format t)
   (tooltip-mode t))

(set-face-attribute 'default nil :height 140)
