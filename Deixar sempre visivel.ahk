; Defina o título da janela que você espera (título exato ou parte do título da aba do Chrome)
windowTitle := "Horario"  ; O título exato ou parte dele

; Defina o modo de correspondência de título (parcial)
SetTitleMatchMode, 2 ; Permite correspondência parcial no título da janela

; Inicialize uma variável para contar as janelas encontradas
windowsFound := 0

; Procure por todas as janelas do Chrome
WinGet, windowsList, List, ahk_class Chrome_WidgetWin_1

; Verifique se encontrou janelas do Chrome
if (windowsList > 0) {
    Loop, %windowsList% {
        ; Pegue o título da janela
        WinGetTitle, currentTitle, % "ahk_id " windowsList%A_Index%

        ; Verifica se o título contém a palavra desejada
        IfInString, currentTitle, %windowTitle%
        {
            ; Se encontrar a janela, ativa-la
            WinActivate, % "ahk_id " windowsList%A_Index%
            ; Garantir que a janela esteja sempre na frente de outras
            WinSet, AlwaysOnTop, On, % "ahk_id " windowsList%A_Index%
            ; Reaplicar para garantir que ela fique por cima
            WinSet, AlwaysOnTop, On, % "ahk_id " windowsList%A_Index%
            windowsFound := 1
            break ; Saia do loop assim que encontrar a janela desejada
        }
    }

    ; Se não encontrar uma janela com o título correspondente
    if (!windowsFound)
    {
        ; Não fazemos nada aqui, pois o comportamento silencioso foi solicitado.
    }
} else {
    ; Não fazemos nada aqui também.
}

return
