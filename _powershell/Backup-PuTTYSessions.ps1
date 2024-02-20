# https://stackoverflow.com/questions/13023920/how-to-export-import-putty-sessions-list
# Exports registry to desktop
# Created the putty/putty-sessions.reg file
reg export HKCU\Software\SimonTatham\PuTTY\Sessions ([Environment]::GetFolderPath("Desktop") + "\putty-sessions.reg")
