saveCoverFromGoogle(i, googleSearchX, googleSearchY) {
    newTabX := 100, newTabY := 50          ; icono "+" para nueva pestaña
    imagesTabX := 300, imagesTabY := 200   ; pestaña "Imágenes"
    firstImageX := 350, firstImageY := 400 ; primera imagen en resultados
    imageClickX := 600, imageClickY := 450 ; centro de la imagen arriba (para click derecho)
    saveImageX := 100, saveImageY := 120   ; posición "Guardar imagen como..." en menú contextual

    ; --- abrir nueva pestaña y buscar ---
    Click newTabX, newTabY
    Sleep 300
    Click googleSearchX, googleSearchY
    Sleep 300
    Send "^v"
    Sleep 200
    Send " filetype:jpg"
    Sleep 100
    Send "{Enter}"
    Sleep 7000

    ; --- click en imágenes y en 1ra imagen ---
    Click imagesTabX, imagesTabY
    Sleep 8000 ; esperar que carguen las imágenes (demora más que la búsqueda web)
    Click firstImageX, firstImageY
    Sleep 2000

    ; --- guardar imagen como ---
    Click imageClickX, imageClickY, "Right"
    Sleep 300
    Click saveImageX, saveImageY
    Sleep 1500

    ; --- nombre dinámico de archivo ---
    Send "^a"
    Sleep 200
    portadaNum := 10 - i
    Send "portada " portadaNum
    Sleep 200
    Send "{Enter}"
    Sleep 300
}