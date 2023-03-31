;; https://github.com/shaunsingh/nix-darwin-dotfiles/blob/main/configs/nyxt/status.lisp

(define-configuration status-buffer ((height 32)))

(defun status-style ()
    (theme:themed-css (theme *browser*)
        `(*
           :font-family ,*font*
           :font-size "12px")

        `(body
           :margin "9px"
           :background-color "#3b4252"
           :color "#d8dee9")

        `("#container"
           :display "flex"
           :white-space "nowrap"
           :overflow "hidden")

        `("#url"
           :color "#8fbcbb"
           :font-weight "bold")

        `("#modes"
           :color "#5e81ac")

        `(button
           :all "unset"
           :color "#88c0d0")

        `("button:hover"
          :font-weight "bold")
        )
)

(defmethod format-status ((status status-buffer))
  (let* ((buffer (current-buffer (window status)))
         (buffer-count (1+ (or (position buffer
                                         (sort (buffer-list) #'url-equal :key #'url))
                               0))))
    (setf (style status) (my-status-style))
    (spinneret:with-html-string
      (:div :id "container"
            ;; for looks, I should probably make this functional
            (:div :id "vi-mode" "U:**-")
            ;; display current/total buffesr
            (:div :id "buffers"
                  (format nil "[~a/~a]"
                      buffer-count
                      (length (buffer-list))))
            (:div :id "percentage"
                  (format nil "L~a"
                      (%percentage)))
            ;; format url and loading icon if nessecary
            (:div :id "url"
                  (:raw
                   (my-format-status-load-status status)
                   (my-format-status-url status)))
            ;; view modes
            (:div :id "minions"
                  (:raw 
                   (my-format-minions status)))
            ;; show open tabs
            (:div :id "tabs"
                  (:raw
                   (format-status-tabs status)))
            ;; show open tabs
            (:div :id "modes"
                  (:raw
                   "("
                   (nyxt::modes-string buffer)
                   ")"))))))

