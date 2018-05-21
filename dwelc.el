(require 'package) ;; You might already have this line
;; Use the bleeding edge packages (for Jade)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;; (package-initialize) ;; You might already have this line

;;
(starter-kit-load "js")
(starter-kit-load "python")
