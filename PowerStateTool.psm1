# https://www.tenforums.com/general-support/13611-windows-10-sleep-shortcut.html
# https://answers.microsoft.com/en-us/windows/forum/all/pc-not-entering-sleep-using-rundll32exe/d4161b9c-534c-414e-8826-40736f96e2c8
# https://superuser.com/questions/1755107/rundll32-exe-powrprof-dll-setsuspendstate-0-1-0-does-nothing
# https://www.action1.com/how-to-script-powershell-to-sleep-remote-computer-action1-rmm/
#
# https://learn.microsoft.com/en-us/windows/win32/api/powrprof/
# https://learn.microsoft.com/en-us/windows/win32/api/powrprof/nf-powrprof-setsuspendstate
# powrprof.dll,SetSuspendState 0,1,0
# BOOLEAN SetSuspendState(
#  [in] BOOLEAN bHibernate,
#  [in] BOOLEAN bForce,
#  [in] BOOLEAN bWakeupEventsDisabled
#);

function Go-Hibernate {
    $rundll = Join-Path -Path ($env:windir) -ChildPath “System32\rundll32.exe”
    & ($rundll) powrprof.dll,SetSuspendState 0,1,0
}
