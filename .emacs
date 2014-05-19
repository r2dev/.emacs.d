(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/smooth-scrolling")
(add-to-list 'load-path "~/.emacs.d/auto-complete")
;;;;;;;;;;;;;;;
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(set-face-attribute 'default nil :font "Inconsolata 14")

(setq default-frame-alist
      '((width . (* 20 1.618))
        (height . 20)
        (left . 250)
        (top . 20)))

;;;;;;;;;;;;;;;;;;;;
(tool-bar-mode 0)
(menu-bar-mode 1)
(global-font-lock-mode t)
(setq visible-bell t)
(setq-default visual-line-mode t)
(setq mode-require-final-newline nil)
(setq x-select-enable-clipboard t)
(set-language-environment "utf-8")
(setq mouse-yank-at-point t)

;;Information
(setq frame-title-format "current - %b ")
(setq user-full-name "R2")

;; time
(display-time)

;; indentation
(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)
(defun range (start end step)
  (cond
   ((> start end) '())
   (t (cons start (range (+ step start) end step)))))

(setq tab-stop-list (mapcar (lambda (x) (* default-tab-width x)) (range 1 40 1)))

(setq sentence-end "\\([¡££¡£¿]\\|¡­¡­\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; color theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-snowish)
))

;; matching pair of parenthess
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; scrolling before at the least 5 lines
(require 'smooth-scrolling)
(setq smooth-scroll-margin 5)

;; disable minimize window
(global-unset-key (kbd "C-z"))

;; windmove keys
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;;c/c++
(setq c-default-style "linux"
      c-basic-offset 4)

;;auto-complete
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")