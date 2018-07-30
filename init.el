;;; package -- Summary
;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-auto-complete t)
 '(company-auto-complete-chars (quote (32 40 41 34 36 39)))
 '(company-backends
   (quote
    (company-tern company-capf company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-semantic company-css company-dabbrev company-clang company-cmake)))
 '(company-minimum-prefix-length 1)
 '(company-tooltip-limit 5)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(dired-listing-switches "-al")
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(ispell-extra-args (quote ("-C")))
 '(ispell-following-word t)
 '(ispell-help-in-bufferp (quote electric))
 '(ispell-program-name "/usr/local/Cellar/ispell/3.4.00/bin/ispell" t)
 '(ispell-silently-savep t)
 '(ispell-use-framepop-p t)
 '(js-expr-indent-offset 0)
 '(js-flat-functions t)
 '(js-switch-indent-offset 2)
 '(js2-bounce-indent-p nil)
 '(js2-include-browser-externs t)
 '(js2-include-node-externs t)
 '(js2-missing-semi-one-line-override t)
 '(js2-mode-indent-ignore-first-tab t)
 '(js2-strict-missing-semi-warning nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (company-tern use-package 0blayout javadoc-lookup maven-test-mode mvn scala-mode vlf logview js2-refactor projectile-speedbar rjsx-mode gh-md flycheck pomidor all-the-icons all-the-icons-dired exec-path-from-shell indium projectile nvm web-mode company json-mode js2-mode yasnippet org magit ##)))
 '(prog-mode-hook (quote (linum-mode prettify-symbols-mode)))
 '(projectile-globally-ignored-files (quote ("TAGS")))
 '(show-paren-mode t)
 '(speedbar-after-create-hook (quote (speedbar-frame-reposition-smartly)))
 '(speedbar-default-position (quote left))
 '(speedbar-directory-button-trim-method (quote trim))
 '(speedbar-directory-unshown-regexp "")
 '(speedbar-verbosity-level 5)
 '(sr-speedbar-default-width 20)
 '(sr-speedbar-delete-windows t)
 '(sr-speedbar-max-width 20)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-skip-other-window-p t)
 '(tab-always-indent (quote complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 110 :width normal :foundry "nil" :family "PT Mono"))))
 '(fringe ((t nil)))
 '(js2-warning ((t (:underline (:color "gray30" :style wave)))))
 '(speedbar-button-face ((t (:foreground "green3" :height 0.9))))
 '(speedbar-directory-face ((t (:foreground "light blue" :height 0.9 :width extra-expanded))))
 '(speedbar-file-face ((t (:foreground "cyan" :height 0.9 :width extra-expanded))))
 '(speedbar-highlight-face ((t (:background "sea green" :height 1.1))))
 '(speedbar-selected-face ((t (:foreground "orange1" :underline "orange1" :height 1.1))))
 '(speedbar-separator-face ((t (:background "blue" :foreground "white" :overline "gray" :height 0.75))))
 '(trailing-whitespace ((t (:background "gray30")))))


;;(require 'package) ;; You might already have this line
;;;; Use the bleeding edge packages (for Jade)
;; (add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/"))
;;(when (< emacs-major-version 24)
;; ;; For important compatibility libraries like cl-lib
;;  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;;;; (package-initialize) ;; You might already have this line

(setq-default inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)
;;; https://www.emacswiki.org/emacs/UntabifyUponSave
;; if indent-tabs-mode is off, untabify before saving
(add-hook 'write-file-hooks
          (lambda () (if (not indent-tabs-mode)
                    (untabify (point-min) (point-max)))
            nil ))
(setq-default tab-width 4)
(show-paren-mode t)
(global-linum-mode 1)
(global-subword-mode 1)
;; desktop management
(global-set-key (kbd "C-c C-d") 'desktop-read)
(global-set-key (kbd "C-c C-s") 'desktop-save)
(global-set-key (kbd "C-c C-f") 'find-grep)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(desktop-save-mode 1)  ;; automatic desktop saving
(setq-default desktop-restore-eager 8)
(savehist-mode 1)
;; directory icons
(require 'all-the-icons)
(require 'all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; RE-builder
(require 're-builder)
(setq reb-re-syntax 'string)
;;
(add-to-list 'load-path (expand-file-name "local" user-emacs-directory))

;; Swagger
(require 'swagger-mode)
(require 'yaml-mode)

;;; Cucumber
(add-to-list 'load-path (expand-file-name "local/cucumber.el" user-emacs-directory))
(require 'feature-mode)
(setq feature-default-language "fi")
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; complete anything
(add-to-list 'load-path "/Users/dwelc/.nvm/versions/node/v8.6.0/lib/node_modules/tern/emacs")
(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(setq company-idle-delay 0)  ;; tern doesn't accept nil as a value! http://disq.us/p/1o3j7lw

(add-hook 'after-init-hook 'global-company-mode)
(define-key company-active-map (kbd "TAB") 'company-complete-common)
(define-key company-active-map (kbd "<tab>") 'company-complete-common)
(define-key company-active-map (kbd "SPC") 'company-abort)
(define-key company-active-map (kbd "<space>") 'company-abort)

;;;;;;;;;;;;;;;;;;;
;; Shell options ;;
;;;;;;;;;;;;;;;;;;;
;; support ANSI color escape sequences
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
;;; Use the Emacsclient as $EDITOR
(add-hook 'shell-mode-hook  'with-editor-export-editor)
(add-hook 'term-exec-hook   'with-editor-export-editor)
(add-hook 'eshell-mode-hook 'with-editor-export-editor)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ever find that a command works in your shell, but not in Emacs? ;;
;; https://github.com/purcell/exec-path-from-shell                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; (exec-path-from-shell-copy-env "PYTHONPATH")  ;; call after `exec-path-from-shell-initialize`

(require 'electric)
(setq electric-pair-mode t)
(setq electric-quote-mode t)

;; if you have a host-specific .el file, load it
(let ((host-file-el (format "~/.emacs.d/%s.el" system-name)))  ;; using ${HOME} breaks the file-exists-p... why?  ;; use user-emacs-directory instead?
  (when (file-exists-p host-file-el)
    (load-file host-file-el))
  )
;; GIT
(require 'magit)
;; JAVASCRIPT
(require 'js2-mode)
(eval-after-load 'js2-mode
  '(setq-default js-indent-level 2) ;; set indenting to 2 spaces
  )

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'interpreter-mode-alist '("nodejs" . js2-mode))

(require 'rjsx-mode)
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook (lambda ()
                           ;; (setq js-indent-level 2)
                           (js2-refactor-mode)
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
                           (tern-mode)
                           (company-mode)
                           (js2-imenu-extras-mode))) ;; Better imenu
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)
;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'rjsx-mode-hook (lambda ()
                            (js2-refactor-mode)
                            (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
                            (tern-mode)
                            (company-mode)
                            (js2-imenu-extras-mode))) ;; Better imenu

(add-hook 'json-mode-hook 'hs-minor-mode)
(add-hook 'js-mode-hook 'hs-minor-mode)
(add-hook 'js-mode-hook 'js2-minor-mode)  ;; ---

;; Indium
(require 'indium)
(add-hook 'rjsx-mode-hook #'indium-interaction-mode)

;; Linting
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Misc
(add-to-list 'auto-mode-alist '("\\*node process\\*" . shell-mode))
(add-to-list 'auto-mode-alist '("\\.less?\\'" . css-mode))

;; Pomidoro
(require 'pomidor)
(global-set-key (kbd "<f12>") #'pomidor)

;; Project management
(require 'projectile)
;;; Ignore these files/directories
(add-to-list 'projectile-globally-ignored-files ".DS_Store")
(add-to-list 'projectile-globally-ignored-files "isolate-*.log")
(add-to-list 'projectile-globally-ignored-directories "build")
(add-to-list 'projectile-globally-ignored-directories "coverage")
(add-to-list 'projectile-globally-ignored-directories "node_modules")
(add-to-list 'projectile-globally-ignored-directories ".idea")
(add-to-list 'projectile-globally-ignored-directories "benchmarks")
(add-to-list 'projectile-globally-ignored-directories ".nyc_output")
(add-to-list 'projectile-globally-ignored-directories "dist")
;;; Go to the top-level dir of a project
(setq projectile-switch-project-action #'projectile-dired)
;;; Use system methods to index (find, git, ... vs. lisp methods)
(setq projectile-indexing-method 'alien)
(projectile-register-project-type 'npm '("package.json")
                  :compile "npm install"
                  :test "npm run test"
                  :run "npm run dev"
                  :test-suffix ".spec")
                  ;; :test-dir "test*")

;; Speedbar
(require 'sr-speedbar)
;; fix so speedbar is in same window
(with-eval-after-load "speedbar"
  (autoload 'sr-speedbar-toggle "sr-speedbar" nil t)
  (global-set-key (kbd "s-s") 'sr-speedbar-toggle)
  )
;;; https://gist.github.com/cstrahan/1975217
(setq speedbar-frame-parameters
      '((minibuffer)
        (width . 40)
        (border-width . 0)
        (menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (unsplittable . t)
        (left-fringe . 0)))
(setq speedbar-hide-button-brackets-flag t)
(setq speedbar-show-unknown-files t)
(setq speedbar-smart-directory-expand-flag t)
(setq speedbar-use-images nil)
(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-max-width 70)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width-console 40)

(when window-system
  (defadvice sr-speedbar-open (after sr-speedbar-open-resize-frame activate)
    (set-frame-width (selected-frame)
                     (+ (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-open 'after 'sr-speedbar-open-resize-frame)

  (defadvice sr-speedbar-close (after sr-speedbar-close-resize-frame activate)
    (sr-speedbar-recalculate-width)
    (set-frame-width (selected-frame)
                     (- (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-close 'after 'sr-speedbar-close-resize-frame))

;; https://writequit.org/articles/working-with-logs-in-emacs.html
(use-package hideshow
  :bind (("C-c TAB" . hs-toggle-hiding)
        ("C-\\" . hs-toggle-hiding)
         ("M-+" . hs-show-all))
  :init (add-hook #'prog-mode-hook #'hs-minor-mode)
  :diminish hs-minor-mode
  :config
  (setq hs-special-modes-alist
        (mapcar 'purecopy
                '((c-mode "{" "}" "/[*/]" nil nil)
                  (c++-mode "{" "}" "/[*/]" nil nil)
                  (java-mode "{" "}" "/[*/]" nil nil)
                  (js2-mode "{" "}" "/[*/]" nil)
                  (rjsx-mode "{" "}" "/[*/]" "<*>*<\*>" nil)
                  (json-mode "{" "}" "/[*/]" nil)
                  ;; (javascript-mode  "{" "}" "/[*/]" nil)
                  )
                )
        )
  )

;; Markdown mode
;; (autoload 'markdown-mode "markdown-mode"
;;   "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
;; requires Marked (npm i -g marked)
(put 'magit-clean 'disabled nil)

;; Layout management
(use-package 0blayout
  :ensure t

  ;; Optionally set default layout name
  ;; :init (setq-default 0blayout-default "my-layout-name")

  ;; Load the mode
  :config (0blayout-mode t)
  )
(provide 'init)
;;; init.el ends here
