;; main nyxt config file

(defvar nord-theme (make-instance 'theme:theme
                                  :dark-p t
                                  :background-color "#2e3440"
                                  :on-background-color "#d8dee9"
                                  :primary-color "#8fbcbb"
                                  :on-primary-color "#2e3440"
                                  :secondary-color "#81a1c1"
                                  :on-secondary-color "#d8dee9"
                                  :accent-color "#bf616a"
                                  :on-accent-color "#2e3440"
                                  :font-family "IBM Plex"
                                  ))

(define-configuration buffer
        ((default-modes (append '(vi-normal-mode) %slot-default%))))
(define-configuration browser ((theme my-theme)))
