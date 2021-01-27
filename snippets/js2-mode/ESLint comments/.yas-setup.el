;;; package --- Summary
;;; Commentary:
;; TODO: write script to query eslint to identify warnings and put in a variable `yas-eslint-warnings`
;;; Code:

(defun parse-rule-file(filename)
  "Parse the eslint rules file FILENAME for rule name and description."
  (interactive "s")
  (print (parse-rule-name filename))
  (print (parse-rule-description filename))
  )

(defun parse-rule-name(filename)
  "Parse the rule name from FILENAME."
  (replace-regexp-in-string ".js$" "" (file-name-nondirectory filename))
  )

(defun parse-rule-description(filename)
  "Parse the rule description from FILENAME.
Find the description assuming the file is in the form:
module.exports = { ...
  meta: { ...
    docs: { ...
      description: \"description\",
      ...
."
  ;; (let contents
  (setq my-regex
        (concat "\("
                (regexp-quote "module.exports")
                "[\n =}{a-zA-Z0-9:\",]*"
                (regexp-quote "description: ")
                "\)\([a-zA-Z0-9, ]+\)"
                )
        )

  ;; (message "%s" my-regex)

  (string-match my-regex
                (with-temp-buffer
                  ;; Read the file with no character code conversion.
                  (let ((coding-system-for-read 'no-conversion))
                    (insert-file-contents filename))
                  (buffer-string)
                  )
                )
  (match-string 2)
  )

;;; Test:
(let (filename (expand-file-name "~/src/cosmos/experimental-set-creation-ui/node_modules/eslint/lib/rules/quotes.js"))
  )
;; (message "%s" filename)
(message "%s" (parse-rule-description filename))

(provide '.yas-setup)

;;; .yas-setup.el ends here
