;;; package --- Summary

;;; Commentary:
;;;   This is my linting code for all languages
;;;
;;;   Javascript
;;;   ==========
;;;   Notes:
;;;     ESLint via javascript-eslint
;;;   System requirements: npm install eslint
;;; Code:
;;;
(message "Loading linting...")
(use-package exec-path-from-shell
  :ensure t
  ;; http://www.flycheck.org/en/latest/user/troubleshooting.html#flycheck-macos-exec-path-from-shell
  :config (exec-path-from-shell-initialize)
  )

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  )

(use-package flyparens
  :hook prog-mode-hook)

(provide 'config_linting)
;;; config_linting.el ends here
