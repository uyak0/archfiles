#Requires AutoHotkey v2.0

;--CHEATSHEET--;
; ^ : CTRL
; + : SHIFT
; # : WIN
; ! : ALT 
;----------;

; VSCODE
^!V:: {
    if WinExist("ahk_exe Code.exe")
        WinActivate 
    else
        Run "C:\Users\Asus\AppData\Local\Programs\Microsoft VS Code\Code.exe"
}

; DISCORD
^!D:: {
    if WinExist("ahk_exe Discord.exe")
        WinActivate 
    else
        Run "C:\Users\Asus\AppData\Local\Discord\Update.exe --processStart Discord.exe"
}

; NOTION
^!N:: {
    if WinExist("ahk_exe Notion.exe")
        WinActivate
    else
        Run "C:\Users\Asus\AppData\Local\Programs\Notion\Notion.exe"
        WinWait "ahk_exe Notion.exe"
        WinMaximize
}

; GOOGLE DRIVE
^!G:: {
    if WinExist("My Drive")
        WinActivate
    else
        Run "C:\Google Drive (M)\My Drive"
}

; EXPLORER
^!E:: {
    if WinExist("ahk_class CabinetWClass")
        WinActivate
    else
        Run "explorer"
}

; TERMINAL (UBUNTU)
^!T:: {
    if WinExist("ahk_exe WindowsTerminal.exe")
        WinActivate
    else
        Run "Ubuntu.exe"
}

; OBSIDIAN
^!O:: {
    if WinExist("ahk_exe Obsidian.exe")
        WinActivate
    else
        Run "C:\Users\Asus\AppData\Local\Obsidian\Obsidian.exe"
}

; BROWSER (BRAVE)
^!B:: {
    list := []
    if WinExist("ahk_exe brave.exe")
        list := WinGetList("ahk_exe brave.exe")
        for id in list {
            if !WinActive(id) {
                WinActivate id
                break
            }
        }
    else
        Run "brave.exe"
}

; WECHAT
^!W:: {
    if WinExist("ahk_exe WeChat.exe")
        WinActivate
    else
        Run "C:\Program Files (x86)\Tencent\WeChat\WeChat.lnk"
}

; WHATSAPP 
^!A:: {
    if WinExist("ahk_exe ApplicationFrameHost.exe") ;LMFAO what the hell is this name man
        WinActivate
    else
        Run "E:\temp\WhatsApp.lnk"
}

; IN-BROWSER COMMANDS
#Hotif WinActive("ahk_exe brave.exe") 
    ^N:: {                      ; New Maximized Window in another monitor
        Run "brave.exe --new-window"
        WinWait("ahk_exe brave.exe")
        WinActivate
        WinMaximize
        Send "{LWin down}+{Right 3}+{Up}+{LWin Up}"
    }

    ^+Y:: {                     ; Youtube
        if WinExist("YouTube") 
            WinActivate
        else
            Run "brave.exe https://youtube.com/ --new-tab"
    }

    ^+C:: {                     ; Google Calendar
        if WinExist("Google Calendar") 
            WinActivate
        else
            Run "brave.exe https://calendar.google.com/calendar/u/0/r/custom/7/d?pli=1 --new-tab"
    }
#HotIf