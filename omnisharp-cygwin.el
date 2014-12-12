(require 'cygwin-mount)
(require 'windows-path)

(defun omnisharp-cygwin-check-versions ()
  (setq omnisharp-cygwin-shell (string-match ".*cygwin.*" (shell-command-to-string "help")))
  (setq omnisharp-cygwin-curl (string-match ".*cygwin.*" (shell-command-to-string "curl --version")))
  system-type)

(defun omnisharp-cygwin-curl-path (path)
  "translates the path for curl as required by the version of curl."
  (start-process "curl-v" (generate-new-buffer "curl-v") "curl" "--version")
  (if (string-match ".*cygwin.*" (shell-command-to-string "curl --version"))
      (windows-path-convert-file-name path)
    path))

(provide 'omnisharp-cygwin)
