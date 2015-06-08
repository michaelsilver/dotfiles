;; Octave mode for .m files
(setq auto-mode-alist
      (cons
       '("\\.m$" . octave-mode)
       auto-mode-alist))

;; C-x g mapped to goto-line
(global-set-key "\C-xg" 'goto-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-font-lock-mode t)
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; use ispell for spell checking
(setq ispell-program-name "/usr/local/bin/ispell")

;; LaTeX Stuff:
;; AUTeX
(load "/Users/michaelsilver/.emacs.d/elpa/auctex-11.88.2/auctex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; make C-c C-c save and do LaTeX compilation automatically,
;; without query
(setq TeX-save-query nil) ;;autosave before compiling
(setq TeX-command-force "LaTeX")  

;; (add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;; (require 'tex-site)

;; RefTeX
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

;; LaTeX with Fill Mode
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'latex-mode-hook 'turn-on-autofill)
