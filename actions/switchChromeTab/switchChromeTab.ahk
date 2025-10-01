switchChromeTab(index) {
    ; Cambiar a ventana de Chrome en la barra de tareas
    chromeX := 203, chromeY := 753    ; Primer icono de Chrome
    chromeGap := 38                   ; Espaciado entre ventanas abiertas de Chrome
    Click chromeX + (index * chromeGap), chromeY
    Sleep 1500
}