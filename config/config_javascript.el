;;; package --- Summary

;;; Commentary:
;;;   This is my javascript setup
;;; Code:
;;;
(message "Loading javascript setup...")

;;; runs eslint --fix on the current file after save
;;; alpha quality -- use at your own risk
;;; https://gist.github.com/ustun/73321bfcb01a8657e5b8

(defun my-setup-hook ()
  "Set up Javascript."
  ;; enable eldoc-mode
  (eldoc-mode)
  ;; enable flycheck
  (flycheck-mode)
  ;; enable flyspell in comments only
  (flyspell-prog-mode)

  ;; format typescript files using prettier
  ;; (prettier-js-mode)

  ;; company-backends setup
  (set (make-local-variable 'company-backends)
       '((company-files :with company-yasnippet)
         (company-dabbrev-code company-dabbrev)))
  )

(use-package tern)  ;; Javascript auto-completion with Company

(use-package tern-auto-complete
  :after tern
  :init (tern-ac-setup)
  )

(use-package swagger-mode
  :ensure f
  :after ((flycheck-swagger-tools))  ;;; https://github.com/magoyette/flycheck-swagger-tools
  )

(use-package yaml-mode)
(use-package css-mode)

(use-package nvm
  :config (nvm-use (caar (last (nvm--installed-versions))))
  )

(use-package js2-mode
  ;;; :mode ("\\.js\\'" . js2-mode)
  :hook ((js2-mode . (lambda ()
                       (hs-minor-mode)
                       (flycheck-mode)
                       (my-setup-hook)
                       (company-mode)
                       (tern-mode t)
                       (js2-refactor-mode)
                       )))
  :ensure t
  :after ((js-mode projectile-mode js2r-paredit flycheck-mode eslintd-fix-mode))
  :init
  (setq js2-bounce-indent-p t
        js2-global-externs (quote
                            ("expect" "describe" "context" "beforeAll" "beforeEach" "afterAll" "afterEach" "jest" "it" "xit" "test"))
        js2-include-browser-externs t
        js2-include-node-externs t
        js2-additional-externs t
        js2-missing-semi-one-line-override t
        js2-mode-indent-ignore-first-tab t
        js2-strict-missing-semi-warning nil
        js2-strict-trailing-comma-warning nil
        )
  :config
  (setq-default js2-basic-offset 2
                js-chain-indent t
                js-expr-indent-offset 0
                js-flat-functions t
                js-switch-indent-offset 2
                )
  ;; use eslint_d insetad of eslint for faster linting
  (setq flycheck-javascript-eslint-executable "eslint_d")
  (setq flycheck-checker nil)

  ;; Try to highlight most ECMA built-ins
  (setq js2-highlight-level 3)

  ;;; turn off all warnings in js2-mode
  (setq js2-mode-show-parse-errors t
        js2-mode-show-strict-warnings nil
        js2-strict-missing-semi-warning nil
        js2-missing-semi-one-line-override t)

  ;;; The projectile setup for Node projects
  (projectile-register-project-type 'npm '("package.json")
                                    :compile "npm ci"
                                    :test "npm run test -- --watch"
                                    :run "npm run dev"
                                    :test-suffix ".spec.js*"
                                    :src-dir "src"
                                    :test-dir "test")
  :interpreter (("nodejs" . js2-mode) ("node" . js2-mode))
  :bind (:map js2-mode-map
         ("C-k" . js2r-kill)) ;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
  )

(use-package js2-refactor
  :after js2-mode
  :ensure t
  :config (js2r-add-keybindings-with-prefix "C-c C-m")
  ;; Keybindings:
  ;; Note: node type is array, object, function, or call args
  ;;
  ;;  * `ee` is `expand-node-at-point`: Expand bracketed list according to node type
  ;;  * `cc` is `contract-node-at-point`: Contract bracketed list according to node type
  ;;  * `ef` is `extract-function`: Extracts the marked expressions out into a new named function.
  ;;  * `em` is `extract-method`: Extracts the marked expressions out into a new named method in an object literal.
  ;;  * `tf` is `toggle-function-expression-and-declaration`: Toggle between function name() {} and var name = function ();
  ;;  * `ta` is `toggle-arrow-function-and-expression`: Toggle between function expression to arrow function.
  ;;  * `ts` is `toggle-function-async`: Toggle between an async and a regular function.
  ;;  * `ip` is `introduce-parameter`: Changes the marked expression to a parameter in a local function.
  ;;  * `lp` is `localize-parameter`: Changes a parameter to a local var in a local function.
  ;;  * `wi` is `wrap-buffer-in-iife`: Wraps the entire buffer in an immediately invoked function expression
  ;;  * `ig` is `inject-global-in-iife`: Creates a shortcut for a marked global by injecting it in the wrapping immediately invoked function expression
  ;;  * `ag` is `add-to-globals-annotation`: Creates a `/*global */` annotation if it is missing, and adds the var at point to it.
  ;;  * `ev` is `extract-var`: Takes a marked expression and replaces it with a var.
  ;;  * `el` is `extract-var`: Takes a marked expression and replaces it with a let.
  ;;  * `ec` is `extract-var`: Takes a marked expression and replaces it with a const.
  ;;  * `iv` is `inline-var`: Replaces all instances of a variable with its initial value.
  ;;  * `rv` is `rename-var`: Renames the variable on point and all occurrences in its lexical scope.
  ;;  * `vt` is `var-to-this`: Changes local `var a` to be `this.a` instead.
  ;;  * `ao` is `arguments-to-object`: Replaces arguments to a function call with an object literal of named arguments.
  ;;  * `3i` is `ternary-to-if`: Converts ternary operator to if-statement.
  ;;  * `sv` is `split-var-declaration`: Splits a `var` with multiple vars declared, into several `var` statements.
  ;;  * `ss` is `split-string`: Splits a `string`.
  ;;  * `st` is `string-to-template`: Converts a `string` into a template string.
  ;;  * `uw` is `unwrap`: Replaces the parent statement with the selected region.
  ;;  * `lt` is `log-this`: Adds a console.log() statement for what is at point (or region).  With a prefix argument, use JSON pretty-printing.
  ;;  * `dt` is `debug-this`: Adds a debug() statement for what is at point (or region).
  ;;  * `sl` is `forward-slurp`: Moves the next statement into current function, if-statement, for-loop or while-loop.
  ;;  * `ba` is `forward-barf`: Moves the last child out of current function, if-statement, for-loop or while-loop.
  ;;  * `k` is `kill`: Kills to the end of the line, but does not cross semantic boundaries.

  ;; There are also some minor conveniences bundled:

  ;;  * `C-S-down` and `C-S-up` moves the current line up or down.  If the line is an
  ;;    element in an object or array literal, it makes sure that the commas are
  ;;    still correctly placed.
  ;;  * `k` `kill-line`: Like `kill-line` but respecting the AST.
  )

;;; DISABLED: Prettier doesn't respect ESLint files
;; prettier-emacs: minor-mode to prettify javascript files on save
;; https://github.com/prettier/prettier-emacs
;; (use-package prettier-js
;;   :after ((js2-mode rjsx-mode))
;;   :ensure t
;;   :hook ((js2-mode . prettier-js-mode)
;;          (rjsx-mode . prettier-js-mode)))

;; json-snatcher: get the path of any JSON element easily
;; https://github.com/Sterlingg/json-snatcher
(use-package json-snatcher
  :after json-mode
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
  :hook ((rjsx-mode . add-node-modules-path))
  )

;; json-mode: Major mode for editing JSON files with emacs
;; https://github.com/joshwnj/json-mode
(use-package json-mode
  :mode "\\.[json\\|jshint\\|jshintrc\\|jslint\\|jslintrc\\|babelrc]\\'"
  :config
  (setq json-reformat:indent-width 2
        json-reformat:pretty-string? t
        json-encoding-default-indentation 2
        )
  :hook (json-mode . hs-minor-mode)
  )

;; eslintd-fix: Emacs minor-mode to automatically fix javascript with eslint_d.
;; https://github.com/aaronjensen/eslintd-fix/tree/master
(use-package eslintd-fix
  :config
  (setq eslintd-fix-executable "/Users/dwelc/.nvm/versions/node/v12.13.1/bin/eslint_d"
        eslintd-fix-host "localhost"
        )
  )

(use-package rjsx-mode
  :after js2-mode
  :mode "\\.js[x]\\'"
  :hook (rjsx-mode . (lambda ()
                       (flycheck-mode)
                       (company-mode)
                       (indium-interaction-mode -1)
                       (js2-refactor-mode -1)
                       ;; (js2-imenu-extras-mode)
                       ))
  :init
  (defun javascript-jsx-file-p ()
    "Detect React or preact imports early in the file."
    (and buffer-file-name
         (string= (file-name-extension buffer-file-name) "js")
         (re-search-forward "\\(^\\s-*import +React\\|\\( from \\|require(\\)[\"']p?react\\)"
                            magic-mode-regexp-match-limit t)
         (progn (goto-char (match-beginning 1))
                (not (sp-point-in-string-or-comment)))))
  (add-to-list 'magic-mode-alist '(javascript-jsx-file-p . rjsx-mode))
  :config
  (setq js2-strict-missing-semi-warning nil)
  (unbind-key "C-c C-l" rjsx-mode-map)
  ;; The projectile setup for React projects
  (projectile-register-project-type 'react '(("package.json" "style.css"))
                                    :compile "npm ci"
                                    :test "npm run test -- --watch"
                                    :run "npm run dev"
                                    :test-suffix ".[spec|cypress].js*"
                                    :src-dir "public|src"
                                    :test-dir "test")
  )

;; indium: javascript awesome development environment
;; https://github.com/NicolasPetton/indium
(use-package indium
  :after rjsx-mode
  :bind (:map js2-mode-map
              ("C-c C-l" . indium-eval-buffer))
  :hook (rjsx-mode . indium-interaction-mode)
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
;; (message (format "Indent level is: %d" js-indent-level))
(message "Loading javascript setup... done")
(provide 'config_javascript)
;;; config_javascript.el ends here
