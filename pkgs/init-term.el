(when (eq system-type 'windows-nt)
  (setq explicit-shell-file-name "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe")
  (setq explicit-powershell.exe-args '("-NoExit" "& \"C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/Tools/Launch-VsDevShell.ps1\"" "-Arch" "arm64")))

(provide 'init-term)
