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

;; Fix the PATH
;; This sets $MANPATH, $PATH and exec-path from your shell, but only on OS X.
(unless (package-installed-p 'exec-path-from-shell)
  (package-refresh-contents)
  (package-install 'exec-path-from-shell))
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;; Set new lines to be indented automatically
(define-key global-map (kbd "RET") 'newline-and-indent)

;;; Auto indent on paste
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode  cuda-mode
                                                     html-mode       java-mode
                                                     js-mode         css-mode
                                                     ))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

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
