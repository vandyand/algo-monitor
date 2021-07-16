!x::Pause
!r::Reload

!/::
    WinGetActiveTitle, title

    ControlGetFocus, focused, A
    matchString = SysListView3229
    sleep 100
    cond := (focused == matchString)
    msgbox WinTitle: %title%`nfocused: %focused%`ncond: %cond%
    if(cond){
        msgbox found it!
    }

return
!,::
    
    startDate := 20191117
    
    endDate := 20191215
    
    if(endDate > startDate){
        MsgBox "Gotcha!"
    }
    
    
    Loop{
        
        FormatTime startYear, %startDate%, yyyy
        FormatTime startMonth, %startDate%, MM
        FormatTime startDay, %startDate%, dd
            
        MsgBox start year: %startYear% `nstart month: %startMonth% `nstart day: %startDay%
        
        EnvAdd startDate, -7, Days ; or: Today += 3, days	; or: Today += 3, dd
        
        FormatTime newStartDate, %startDate%, yyyyMMdd
            
        MsgBox new_start_date: %newStartDate%
        startDate = %newStartDate%
        MsgBox startDate: %startDate%
        
    }
    
return

!.::
    iter = 0

    abcs = abcdefghijklmnopqrstuvwxyz
    
    startDate := 20200131
    
    ; foreDate := 20191101
        
    endDate := 20200202
    
    ; startstartDate := 20180101

    freqDays := -1

    runs := 1
    
    generalDelayTime := 1000
    
    Loop {
        
        FormatTime startYear, %startDate%, yyyy
        FormatTime startMonth, %startDate%, MM
        FormatTime startDay, %startDate%, dd
            
        ; FormatTime foreYear, %foreDate%, yyyy
        ; FormatTime foreMonth, %foreDate%, MM
        ; FormatTime foreDay, %foreDate%, dd
            
        FormatTime endYear, %endDate%, yyyy
        FormatTime endMonth, %endDate%, MM
        FormatTime endDay, %endDate%, dd
            
        ; Close charts
        Click 1365, 40
        Sleep 10
        Click 1365, 40
        Sleep 10
        Click 1000, 100
        Sleep %generalDelayTime%
        
        
        ;Click "Inputs"
        Click 190, 700
        Sleep 250

        ; Update "iter" parameter
        Click 500, 540 ;500
        Sleep 10
        Click 500, 540 ;500
        Sleep 10
        SendInput %iter%
        Sleep 10
        SendInput {Enter}
        Click 1000, 100
        Sleep %generalDelayTime%

        ; Update "file_name" parameter
        Click 500, 580 ;570
        Sleep 10
        Click 500, 580 ;570
        Sleep 10
        SendInput %endYear%%endMonth%%endDay%
        Sleep 10
        SendInput {Enter}
        Click 1000, 100
        Sleep %generalDelayTime%


        
        
        ;Click "Settings"
        Click 120, 700
        Sleep 250
        ;Sleep %generalDelayTime%
        
        ;Set start and end times
        ;Start Year
        Click 360, 440
        ;Sleep %generalDelayTime%
        SendInput %startYear%
        ;Sleep %generalDelayTime%
        ;Start month
        Click 385, 440
        ;Sleep %generalDelayTime%
        SendInput %startMonth%
        ;Sleep %generalDelayTime%
        ;Start day
        Click 400, 440
        ;Sleep %generalDelayTime%
        SendInput %startDay%
        ;Sleep %generalDelayTime%
        
        ; ;Fore Year
        ; Click 360, 480
        ; ;Sleep %generalDelayTime%
        ; SendInput %foreYear%
        ; ;Sleep %generalDelayTime%
        ; ;Fore month
        ; Click 385, 480
        ; ;Sleep %generalDelayTime%
        ; SendInput %foreMonth%
        ; ;Sleep %generalDelayTime%
        ; ;Fore day
        ; Click 400, 480
        ; ;Sleep %generalDelayTime%
        ; SendInput %foreDay%
        ; ;Sleep %generalDelayTime%
        
        ;End Year
        Click 480, 440
        ;Sleep %generalDelayTime%
        SendInput %endYear%
        ;Sleep %generalDelayTime%
        ;End month
        Click 505, 440
        ;Sleep %generalDelayTime%
        SendInput %endMonth%
        ;Sleep %generalDelayTime%
        ;End day
        Click 520, 440
        ;Sleep %generalDelayTime%
        SendInput %endDay%

        Click 1000, 100
        Sleep %generalDelayTime%



        ; ;Fore Year
        ; Click 500, 600
        ; Sleep 10
        ; Click 500, 600
        ; Sleep 10
        ; Click 500, 600
        ; Sleep 10
        ; ;Sleep %generalDelayTime%
        ; SendInput %foreYear%
        ; ;Sleep %generalDelayTime%
        ; ;Fore month
        ; Click 530, 600
        ; ;Sleep %generalDelayTime%
        ; SendInput %foreMonth%
        ; ;Sleep %generalDelayTime%
        ; ;Fore day
        ; Click 545, 600
        ; ;Sleep %generalDelayTime%
        ; SendInput %foreDay%
        ; ;Sleep %generalDelayTime%
        
        Loop %runs% {
            
            ;Click start
            Click 1330, 700
            Click 1000, 100
            
            ;Wait for run to finish
            loop{
                Sleep %generalDelayTime%
                ControlGetFocus, focused, A
                matchString1 = SysListView3229
                matchString2 = SysListView3228
                matchString3 = SysListView3225
                matchString4 = ComboBox19
                cond := (focused == matchString1 or focused == matchString2 or focused == matchString3 or focused == matchString4)
                if(cond){
                    Sleep %generalDelayTime%
                    break
                }
            }
            
            ; ;Save forward xml file
            ; Click 220, 380
            ; Sleep %generalDelayTime%
            ; Click Right, 1330, 680
            ; Sleep %generalDelayTime%
            ; Click 1330, 525
            ; Sleep %generalDelayTime%
            ; ;Enter file name
            ; abc := SubStr(abcs, A_Index, 1)
            ; Send fore_%endDate%_%abc%
            ; Send {Enter}
            
            ; ;Exit xml file that opens
            ; Sleep %generalDelayTime%
            ; Sleep %generalDelayTime%
            ; Click 1060, 10
            ; Sleep %generalDelayTime%
            ; Sleep %generalDelayTime%
            
            ; ;Click "Optimization Results"
            ; Click 450, 700
            ; Sleep %generalDelayTime%
            
            ; ;Save backtest xml file
            ; Click Right, 1330, 680
            ; Sleep %generalDelayTime%
            ; Click 1330, 525
            ; Sleep %generalDelayTime%
            ; ;Enter file name
            ; abc := SubStr(abcs, A_Index, 1)
            ; Send back_%endDate%_%abc%
            ; Send {Enter}
            
            ; ;Exit xml file that opens
            ; Sleep %generalDelayTime%
            ; Sleep %generalDelayTime%
            ; Click 1060, 10
            ; Sleep %generalDelayTime%
            ; Sleep %generalDelayTime%
        }
        
        loop {
            EnvAdd startDate, %freqDays%, Days
            FormatTime newStartDate, %startDate%, yyyyMMdd
            startDate = %newStartDate%.
            ; break
            FormatTime startDayOfWeek, %startDate%, WDay
            if(startDayOfWeek != 1 and startDayOfWeek != 7){
                break
            }
        }
        
        ; loop {
        ;     EnvAdd foreDate, %freqDays%, Days
        ;     FormatTime newforeDate, %foreDate%, yyyyMMdd
        ;     foreDate = %newforeDate%
        ;     break
        ;     ; FormatTime foreDayOfWeek, %foreDate%, WDay
        ;     ; if(foreDayOfWeek != 1 and foreDayOfWeek != 7){
        ;     ;     break
        ;     ; }
        ; }
            
        loop {
            EnvAdd endDate, %freqDays%, Days
            FormatTime newendDate, %endDate%, yyyyMMdd
            endDate = %newendDate%
            ; break
            FormatTime endDayOfWeek, %endDate%, WDay
            if(endDayOfWeek != 1 and endDayOfWeek != 7){
                break
            }
        }
        
        ;Increment iter
        iter++

        ; if(endDate < startstartDate){
        ;     return
        ; }
    }
    
return

