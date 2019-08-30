;;; package --- Summary

;;; Commentary:
;;;   This is my linting code for all languages
;;; Code:
;;;
;;; -- Flycheck --
;;;   OSX
;;;    * http://www.flycheck.org/en/latest/user/troubleshooting.html#flycheck-macos-exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize)
  )

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  )
;;;   JAVASCRIPT
;;;   Notes:
;;;     ESLint via javascript-eslint
;;;   System requirements: npm install eslint
(message "Linting configured...")
(provide 'linting)
;;; linting.el ends here
