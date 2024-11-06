; Caminho do arquivo HTML, assumindo que está na mesma pasta que o script AHK
htmlFile := A_ScriptDir . "\\index.html"  ; Caminho do arquivo index.html

; Verificar se o arquivo existe
IfNotExist, % htmlFile
{
    MsgBox, O arquivo index.html não foi encontrado!
    ExitApp
}

; Corrigir o caminho para o formato correto "file://"
fileURL := "file:///" . StrReplace(htmlFile, "\", "/")

; Defina o título da janela que você espera
windowTitle := "Horario"  ; Aqui, você pode colocar o título exato da janela do Chrome ou parte do título.

; Verificar se já existe uma janela com o título correspondente
SetTitleMatchMode, 2 ; Permite correspondência parcial no título da janela

; Procurar pela janela que contém o título definido
IfWinExist, % windowTitle
{
    ; Se encontrar a janela, ativá-la
    WinActivate ; Ativa a janela correspondente ao título
    ; Garantir que a janela esteja sempre na frente de outras
    WinSet, AlwaysOnTop, On
}
else
{
    MsgBox, Não encontrei uma janela com o título "%windowTitle%" aberto no Chrome.
}

return
