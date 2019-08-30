;;; package --- Summary

;;; Commentary:
;;;   This is my completion code for all languages
;;; Code:
;;;
(message "Loading completions...")
(use-package company
  :ensure t
  :init (global-company-mode)
  :custom ((company-backends
            (quote 
             (
              (company-dabbrev-code
               company-keywords)  ;; merged backends
              company-capf
              company-files
              )
             )
            )
           (company-auto-complete-p t)
           (company-idle-delay 0)
           (company-minimum-prefix-length 1)
           (company-tooltip-limit 10)
           )
  :bind (("C-<tab>" . company-complete-common)
         ("C-<space>" . company-abort))
  )
