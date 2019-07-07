(defvar observable-buffer-name "julius-emacs.log")

(defun my-buffer-observe ()
  (let* ((current-buf (current-buffer)))
    (save-current-buffer
      (set-buffer (get-buffer-create observable-buffer-name))
      (let* ((str (buffer-substring-no-properties (point-min) (point-max))))
        (julius-action current-buf str)
        (erase-buffer)))))

(defun julius-action (buf str)
  (save-current-buffer
    (set-buffer buf)
    (if (string-match "^コピー" str)
        (cool-copy))
    (if (string-match "^貼り付け" str)
        (yank))))

(defun start-my-buffer-observe ()
  (interactive)
  (setq my-buffer-observe-timer
        (run-with-idle-timer 0.5 t 'my-buffer-observe)))

(defun stop-my-buffer-observe ()
  ((interactive))
  (cancel-timer my-buffer-observe-timer))
