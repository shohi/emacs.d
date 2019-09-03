;; -*- coding: utf-8; lexical-binding: t; -*-
;; system monitor, https://github.com/zk-phi/symon

(use-package symon
  :ensure t
  :init
  (setq symon-monitors
        (cond ((memq system-type '(gnu/linux))
               '(symon-current-time-monitor
                 symon-linux-memory-monitor
                 symon-linux-cpu-monitor
                 symon-linux-network-rx-monitor
                 symon-linux-network-tx-monitor
                 symon-linux-battery-monitor))
              ((memq system-type '(darwin))
               '(symon-current-time-monitor
                 symon-darwin-memory-monitor
                 symon-darwin-cpu-monitor
                 symon-darwin-network-rx-monitor
                 symon-darwin-network-tx-monitor
                 symon-darwin-battery-monitor))))
  (setq symon-delay 1)
  (setq symon-sparkline-width 120)
  ;; not enable by default.
  ;; :config (symon-mode)
  )

(provide 'init-sysmon)
;;; init-sysmon.el ends here.
