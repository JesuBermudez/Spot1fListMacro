copyLineFromVS(index) {
    ; Hacer click en la ventana de Visual Studio
    vsX := 165, vsY := 760    ; Icono de VS en la barra de tareas
    Click vsX, vsY
    Sleep 300

    ; Seleccionar línea en el editor
    vsLineX := 386, vsLineY := 117    ; Primer línea en VS
    vsLinesGap := 20                  ; Espaciado entre líneas
    Click vsLineX, vsLineY + (index * vsLinesGap)
    Sleep 300

    ; Copiar línea seleccionada
    Send "^c"
    Sleep 300
}