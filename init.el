;;; package -- Summary
;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:
(package-initialize)

;; DEBUGGING INIT
;; (setq exec-path-from-shell-debug t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-auto-complete-p t t)
 '(company-backends
   (quote
    ((company-dabbrev-code company-keywords)
     company-capf company-files)))
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(company-tooltip-limit 10)
 '(custom-enabled-themes (quote (tsdh-dark wheatgrass)))
 '(dabbrev-upcase-means-case-search t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(ispell-extra-args (quote ("-C")))
 '(ispell-following-word t)
 '(ispell-help-in-bufferp (quote electric))
 '(ispell-program-name "/usr/local/Cellar/ispell/3.4.00/bin/ispell")
 '(ispell-silently-savep t)
 '(ispell-use-framepop-p t)
 '(js-chain-indent t)
 '(js-flat-functions t)
 '(js-indent-level 2)
 '(js-react-redux-yasnippets-want-semicolon nil)
 '(js-switch-indent-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-highlight-level 3)
 '(js2-include-node-externs t)
 '(js2-missing-semi-one-line-override t)
 '(js2-mode-indent-ignore-first-tab t)
 '(js2-mode-show-strict-warnings nil)
 '(js2-strict-missing-semi-warning nil)
 '(json-reformat:indent-width 2)
 '(json-reformat:pretty-string\? t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (tide dockerfile-mode hardcore-mode heaven-and-hell typing-game speed-type js-react-redux-yasnippets react-snippets elpy flyparens sr-speedbar yaml-mode tern-auto-complete company-tern add-node-modules-path eslintd-fix js-mode ac-js2 skewer-mode coffee-mode yasnippet-classic-snippets emojify markdown-mode markdown-mode+ use-package 0blayout javadoc-lookup maven-test-mode mvn scala-mode vlf logview js2-refactor projectile-speedbar rjsx-mode gh-md flycheck all-the-icons all-the-icons-dired indium projectile nvm web-mode company json-mode js2-mode yasnippet org magit ##)))
 '(prog-mode-hook (quote (linum-mode prettify-symbols-mode)))
 '(projectile-globally-ignored-files (quote ("TAGS")))
 '(safe-local-variable-values
   (quote
    ((projectile-globally-ignored-files "npm-shrinkwrap.json" "build/*" "lib/raphael-min.js" "node_modules/*" "package-lock.json"))))
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
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 154 :width normal :foundry "nil" :family "Monaco"))))
 '(ediff-even-diff-A ((t (:background "gray25"))))
 '(ediff-even-diff-B ((t (:background "gray24"))))
 '(ediff-even-diff-C ((t (:background "gray24"))))
 '(ediff-odd-diff-A ((t (:background "gray24"))))
 '(fringe ((t nil)))
 '(js2-external-variable ((t (:foreground "orange" :underline (:color foreground-color :style wave)))))
 '(js2-function-call ((t (:inherit default :foreground "DarkOrange2"))))
 '(js2-warning ((t (:underline (:color "OrangeRed1" :style wave)))))
 '(speedbar-button-face ((t (:foreground "green3" :height 0.9))))
 '(speedbar-directory-face ((t (:foreground "light blue" :height 0.9 :width extra-expanded))))
 '(speedbar-file-face ((t (:foreground "cyan" :height 0.9 :width extra-expanded))))
 '(speedbar-highlight-face ((t (:background "sea green" :height 1.1))))
 '(speedbar-selected-face ((t (:foreground "orange1" :underline "orange1" :height 1.1))))
 '(speedbar-separator-face ((t (:background "blue" :foreground "white" :overline "gray" :height 0.75))))
 '(trailing-whitespace ((t (:background "gray30")))))

(setq dired-listing-switches "-aAlpsh")
(defalias 'yes-or-no-p 'y-or-n-p)  ;; Make the "yes or no" prompt shorter
;; (setq exec-path-from-shell-arguments '("-i")) ;; avoid message that PATH is modified in .bashrc file when opening from shell

(setq-default inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)
(winner-mode 1) ;; preserve frame layout and switch using C-c <left> | <right>

;;; Hardcode mode - stop using arrow keys to move
(setq too-hardcore-backspace t)
(setq too-hardcore-return t)
(require 'hardcore-mode)
(global-hardcore-mode)
(add-hook 'minibuffer-setup-hook (lambda () (hardcore-mode 0)))
(add-hook 'minibuffer-exit-hook (lambda () (hardcore-mode 1)))

;;; Switch quickly between light and dark themes
(setq heaven-and-hell-theme-type 'dark)
(setq heaven-and-hell-themes
      '((light . tsdh-light)
        (dark . (tsdh-dark wheatgrass))))
(setq heaven-and-hell-load-theme-no-confirm t)
(add-hook 'after-init-hook 'heaven-and-hell-init-hook)
(global-set-key (kbd "C-c <f6>") 'heaven-and-hell-load-default-theme)
(global-set-key (kbd "<f6>") 'heaven-and-hell-toggle-theme)

;;; https://www.emacswiki.org/emacs/UntabifyUponSave
;; if indent-tabs-mode is off, untabify before saving
(add-hook 'write-file-hooks
          (lambda () (if (not indent-tabs-mode)
                    (untabify (point-min) (point-max)))
            nil ))
(add-hook 'before-save-hook 'delete-trailing-whitespace)  ;; remove trailing whitespace on save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)  ;; remove trailing whitespace on save

(setq-default tab-width 2)
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
(windmove-default-keybindings)  ;; Move around buffers with "Shift-<arrow>" keys

;; Rectangle
(global-set-key (kbd "C-x r k") 'kill-rectangle)
(global-set-key (kbd "C-x r y") 'yank-rectangle)
(global-set-key (kbd "C-x r i") 'string-rectangle)
(global-set-key (kbd "C-x r n") 'rectangle-number-lines)

;; directory icons
(require 'all-the-icons)
(require 'all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; For error "ls does not support --dired; see ‘dired-use-ls-dired’ for more details." see
;; https://stackoverflow.com/a/4081094, and install coreutils via Homebrew then link gls to ls

;; RE-builder
(require 're-builder)
(setq reb-re-syntax 'string)

;;
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(require 'config_linting)
(require 'config_completions)
(require 'config_javascript)
(require 'config_python)
(require 'config_hideshow)
(message "All configuration files loaded")

(add-to-list 'load-path (expand-file-name "local" user-emacs-directory))

;; (add-hook 'after-init-hook 'global-company-mode)

;;; Cucumber
;; (add-to-list 'load-path (expand-file-name "local/cucumber.el" user-emacs-directory))
;; (require 'feature-mode)
;; (setq feature-default-language "fi")
;; (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;;;;;;;;;;;;;;;;;;;
;; Shell options ;;
;;;;;;;;;;;;;;;;;;;
;; Cause .bashrc to be run on subshells
;; (setenv "BASH_ENV" "~/.bashrc")

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
;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))
;; (exec-path-from-shell-copy-env "PYTHONPATH")  ;; call after `exec-path-from-shell-initialize`


(add-hook 'grep-mode-hook 'my-grep-mode-hook)
(defun my-grep-mode-hook ()
  "'grep-mode' has a huge line at the beginning which sucks so this is a hacky way around that."
  (setq truncate-lines t))

(require 'electric)
(setq electric-pair-mode t)
(setq electric-quote-mode t)

;; GIT
(require 'magit)

;; Pomidoro
;; TODO

;; Project management
(use-package projectile
  :bind (("s-p" . 'projectile-command-map)
         ("C-c p" . 'projectile-command-map))
  :config
  (projectile-mode 1)
  ;; set folders to check for projects
  (setq projectile-project-search-path '("~/src/cosmos" "~/src/presentations" "~/src/commitizen" "~/src/innovation_day" "~/src"))
  ;; sort files by recently active buffers and then recently opened files
  (setq projectile-sort-order 'recently-active)
  ;; enable unconditional caching
  (setq projectile-enable-caching t)
  ;;;; Remove the mode name for projectile-mode, but show the project name.
  ;; static part of the mode indicator (default: "Projectile")
  ;; (setq projectile-mode-line-prefix "@")
  ;; the actual function to be invoked to generate the mode-line
  (setq projectile-mode-line-function '(lambda() (format "@%s" (projectile-project-name))))
  ;; bind useful actions to "Command-<key>"  (NOT WINDOWS-friendly!)
  (define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
  (define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
  (define-key projectile-mode-map [?\s-f] 'projectile-find-file)
  (define-key projectile-mode-map [?\s-g] 'projectile-grep)
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
)

;; Speedbar
(use-package sr-speedbar
  ;;; https://gist.github.com/cstrahan/1975217
  :config
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
  ;; fix so speedbar is in same window
  :init
  (with-eval-after-load "speedbar"
    (autoload 'sr-speedbar-toggle "sr-speedbar" nil t)
    (global-set-key (kbd "s-s") 'sr-speedbar-toggle)
    )
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

;;::  TODO:
;; (global-auto-revert-mode t)
;; (setq auto-revert-verbose nil)  ;; don't generate a message when a buffer is reverted

;; Always use shell-mode if file starts with #!/usr/bin/sh or #!/usr/bin/bash
(use-package sh-mode
  :magic ("#!/usr/bin/\\(ba|\\=\\)sh\\'" . sh-mode)
  )  ;;; TODO: verify

;; Code commenting
;; Original idea from
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
  "Replacement for the 'comment-dwim' command.  ARG is optional.
If no region is selected and current line is not blank and we are not at the
end of the line, then comment current line.  Replaces default behaviour of
'comment-dwim', when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))

(global-set-key "\M-;" 'comment-dwim-line)
(global-set-key "\M-:" 'uncomment-region)

(defun open-init-file ()
  "Shortcut to open user's local Emacs config file."
  (interactive "")
  (find-file (expand-file-name "init.el" user-emacs-directory))
  )

(message "Init file complete")
(provide 'init)
;;; init.el ends here
