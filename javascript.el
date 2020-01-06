;;; package --- Summary

;;; Commentary:
;;;   This is my javascript setup
;;; Code:
;;;
(message "Loading javascript setup...")

(defun my-setup-hook ()
  ;;enable eldoc-mode
  (eldoc-mode)
  ;; enable flycheck
  (flycheck-mode)
  
  ;; format typescript files using prettier
  (prettier-js-mode)
  
  ;; company-backends setup
  (set (make-local-variable 'company-backends)
       '((company-files :with company-yasnippet)
         (company-dabbrev-code company-dabbrev)))
  (flycheck-add-next-checker 'javascript-eslint 'append)
  )

(use-package tern)  ;; Javascript auto-completion with Company

(use-package tern-auto-complete
  :after tern
  :init
  (tern-ac-setup)
  )

(use-package swagger-mode)
(use-package yaml-mode)
(use-package css-mode
  :mode "\\.[c|less$"
  )
(use-package nvm
  :config (nvm-use (caar (last (nvm--installed-versions))))
  )

(use-package js2-mode
  :ensure t
  :config
  (setq js-indent-level 2
        js2-basic-offset 2
        js-chain-indent t
        js-expr-indent-offset 0
        js-flat-functions t
        js-switch-indent-offset 2
        )
  ;; use eslint_d insetad of eslint for faster linting
  (setq flycheck-javascript-eslint-executable "eslint_d")

  ;; Try to highlight most ECMA built-ins
  (setq js2-highlight-level 3)

  ;; turn off all warnings in js2-mode
  (setq js2-mode-show-parse-errors t)
  (setq js2-mode-show-strict-warnings nil)
  (setq js2-strict-missing-semi-warning nil)
  :init
  (setq js2-bounce-indent-p t
        js2-global-externs (quote
                            ("expect" "describe" "context" "beforeAll" "beforeEach" "afterAll" "afterEach" "jest" "it" "xit"))
        js2-include-browser-externs t
        js2-include-node-externs t
        js2-missing-semi-one-line-override t
        js2-mode-indent-ignore-first-tab t
        js2-strict-missing-semi-warning nil
        js2-strict-trailing-comma-warning nil
        )
  :mode "\\.js\\'"
  :interpreter ("node" . js2-mode)
  :interpreter ("nodejs" . js2-mode)
  :hook ((js2-mode . (lambda ()
                       (flycheck-mode)
                       (my-setup-hook)
                       (company-mode)
                       (tern-mode t)
                       (hs-minor-mode)
                       (js2-refactor-mode))))
  :bind ("C-k" . 'js2r-kill) ;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
  )

(use-package js2-refactor
  :after js2-mode
  :ensure t
  :config (js2r-add-keybindings-with-prefix "C-c C-r")
  :hook ((js2-mode . js2-refactor-mode))
  )

;; prettier-emacs: minor-mode to prettify javascript files on save
;; https://github.com/prettier/prettier-emacs
(use-package prettier-js
  :hook ((js2-mode . prettier-js-mode)
         (rjsx-mode . prettier-js-mode)))

;; json-snatcher: get the path of any JSON element easily
;; https://github.com/Sterlingg/json-snatcher
(use-package json-snatcher
  :hook ((json-mode . js-mode-bindings))
  :config
  (defun js-mode-bindings ()
    "Sets a hotkey for using the json-snatcher plugin"
    (when (string-match  "\\.json$" (buffer-name))
      (local-set-key (kbd "C-c C-g") 'jsons-print-path)))
  )

;; Adds the node_modules/.bin directory to the buffer exec_path. E.g. support project local eslint installations.
;; https://github.com/codesuki/add-node-modules-path/tree/master
(use-package add-node-modules-path
  :hook ((js2-mode . add-node-modules-path)
         (rjsx-mode . add-node-modules-path))
  )

;; json-mode: Major mode for editing JSON files with emacs
;; https://github.com/joshwnj/json-mode
(use-package json-mode
  :mode "\\.js\\(?:on\\|[hl]int\\(rc\\)?\\)\\'"
  :config
  (setq json-reformat:indent-width 2)
  (setq json-reformat:pretty-string? t)
  (setq js-indent-level 2)
  :hook (json-mode . (lambda ()
                       (prettier-js-mode)
                       (hs-minor-mode)))
  )

;; eslintd-fix: Emacs minor-mode to automatically fix javascript with eslint_d.
;; https://github.com/aaronjensen/eslintd-fix/tree/master
(use-package eslintd-fix)

(use-package rjsx-mode
  :after js2-mode
  :mode (("\\.jsx$" . rjsx-mode)
         ("components/.+\\.js$" . rjsx-mode))
  :hook (rjsx-mode . (lambda ()
                       (flycheck-mode)
                       (company-mode)
                       (indium-interaction-mode -1)
                       (js2-refactor-mode -1)
                       (js2-imenu-extras-mode)))
  :init
  (defun +javascript-jsx-file-p ()
    "Detect React or preact imports early in the file."
    (and buffer-file-name
         (string= (file-name-extension buffer-file-name) "js")
         (re-search-forward "\\(^\\s-*import +React\\|\\( from \\|require(\\)[\"']p?react\\)"
                            magic-mode-regexp-match-limit t)
         (progn (goto-char (match-beginning 1))
                (not (sp-point-in-string-or-comment)))))
  (add-to-list 'magic-mode-alist '(+javascript-jsx-file-p . rjsx-mode))
  (setq js2-strict-missing-semi-warning nil)
  :config
  (unbind-key "C-c C-l" rjsx-mode-map)
  )

;; indium: javascript awesome development environment
;; https://github.com/NicolasPetton/indium
(use-package indium
  :after js2-mode
  :bind (:map js2-mode-map
              ("C-c C-l" . indium-eval-buffer))
  :hook ((js2-mode rjsx-mode) . indium-interaction-mode)
  )
  
;; Misc
;; (add-to-list 'auto-mode-alist '("\\*node process\\*" . shell-mode))
;;   :ensure t
;;   :init (global-company-mode)
;;   :custom ((company-backends
;;             (quote 
;;              (
;;               (company-dabbrev-code
;;                company-keywords)  ;; merged backends
;;               company-capf
;;               company-files
;;               )
;;              )
;;             )
;;            (company-auto-complete-p t)
;;            (company-idle-delay 0)
;;            (company-minimum-prefix-length 1)
;;            (company-tooltip-limit 10)
;;            )
;;   :bind (("C-<tab>" . company-complete-common)
;;          ("C-<space>" . company-abort))
;;   )

(message "Loading javascript setup... done")

