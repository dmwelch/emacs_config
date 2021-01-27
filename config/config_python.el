;;; package --- Summary

;;; Commentary:
;;;   This is my Python setup
;;; Code:
;;;
(message "Loading Python setup...")
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config
  ;; enable flyspell in comments only
  (flyspell-prog-mode)

  (setq python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt"
        python-check-command "flake8 --config ~/.config/flake8"
        elpy-folding-fringe-indicators t
        python-check-buffer-name "*Python linting: %s*"
        python-fill-docstring-style (quote django)
        python-indent-guess-indent-offset nil
        python-shell-completion-native-output-timeout 1.0
        python-shell-exec-path (quote ("/usr/local/bin/python3"))
        python-shell-interpreter "python3"
        python-skeleton-autoinsert t
        python-shell-prompt-detect-failure-warning nil
        tab-width 2
        )
  (add-to-list 'python-shell-completion-native-disabled-interpreters
               "jupyter")
  )

(provide 'config_python)
;;; config_python.el ends here
