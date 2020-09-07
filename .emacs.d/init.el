;;(setq debug-on-error t)

;; load part 1 of initialisation

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/part1.el")

;; load part 2 of initialisation
(load "~/.emacs.d/part2.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["white" "red" "green" "yellow" "white" "magenta" "cyan" "black"])
 '(blink-cursor-mode nil)
 '(browse-url-browser-function (quote browse-url-w3))
 '(browse-url-firefox-startup-arguments (quote ("")))
 '(case-fold-search t)
 '(delete-selection-mode t nil (delsel))
 '(desktop-restore-frames nil)
 '(desktop-save-mode t)
 '(dired-recursive-deletes t)
 '(display-time-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(latex-run-command "pdflatex")
 '(midnight-mode t nil (midnight))
 '(scroll-bar-mode (quote right))
 '(tool-bar-mode nil nil (tool-bar))
 '(tooltip-mode nil nil (tooltip))
 '(vc-handled-backends (quote (Git))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rst-level-1-face ((t (:background "grey40"))) t)
 '(rst-level-2-face ((t (:background "grey40"))) t))




