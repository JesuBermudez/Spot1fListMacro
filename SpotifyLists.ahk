Esc:: Pause   ; Si presionas Esc, termina el script
; Presiona F2 para ejecutar la secuencia
F2:: {
    ; --- Configuración ---
    vsX := 83, vsY := 744
    vsLineX := 44, vsLineY := 121
    vsLinesGap := 20

    chromeX := 112, chromeY := 743
    chromeGap := 33

    spotifySearchX := 715, spotifySearchY := 165
    firstResultX := 560, firstResultY := 300
    mouseMovePlaylistX := 195

    songLastX := 325, songLastY := 640
    songsGap := 37
    playlistDropX := 65, playlistDropY := 292
    descriptionX := 666, descriptionY := 415
    savePlaylistX := 800, savePlaylistY := 504
    playPlaylistY := 400

    newTabX := 301, newTabY := 21
    googleSearchX := 161, googleSearchY := 63
    imagesTabX := 340, imagesTabY := 251
    firstImageX := 130, firstImageY := 455
    imageClickX := 1080, imageClickY := 421
    saveImageX := -15, saveImageY := 159

    emptyClickX := 1050, emptyClickY := 195
    downloadFirstImageX := 240, downloadFirstImageY := 165

    songE1 := "Echoes of Us Jaye"
    songE2 := "Infinite Pulse Jaye"

    Loop 10 {
        i := A_Index - 1

        ; --- Visual Studio: copiar línea ---
        Click vsX, vsY
        Sleep 300
        Click vsLineX, vsLineY + (i * vsLinesGap)
        Sleep 300
        Send "^c"
        Sleep 300

        ; --- Chrome ventana i ---
        Click chromeX + (i * chromeGap), chromeY
        Sleep 1500

        if (true) {
            ; --- clic en Musica si sale ---
            Click songLastX + 65, playlistDropY - 90
            Sleep 1500 ; 325  640
            ; --- Reproducir la primera lista en inicio ---
            MouseMove songLastX + 90, playlistDropY + 75
            Sleep 200
            Click "Down"
            Click "Up"
            Sleep 1000
        } else {
            ; --- recargar pagina primero ---
            Send "^r"
            Sleep 7000
        }


        ; --- Buscar en Spotify ---
        Click spotifySearchX, spotifySearchY
        Sleep 300
        Send "^v"
        Sleep 100
        Send "{Enter}"
        Sleep 2500

        ; --- Primer resultado y agregar a playlist ---
        Click firstResultX, firstResultY, "Right"
        Sleep 300
        Click firstResultX + 15, firstResultY + 23
        Sleep 300
        MouseMove firstResultX + 15 + mouseMovePlaylistX, firstResultY + 23
        Sleep 200
        Click firstResultX + 15 + mouseMovePlaylistX, firstResultY + 23 + 27
        Sleep 500

        ; --- Clic en artista ---
        Click firstResultX, firstResultY, "Right"
        Sleep 300
        Click firstResultX + 15, firstResultY + 23 + 107
        Sleep 300
        Click firstResultX + 15 + mouseMovePlaylistX, firstResultY + 23 + 155
        Sleep 3500

        ; --- clic en albums, album de artista ---
        Send "{PgDn}"
        Sleep 1000
        Click 455, 490
        Sleep 1000
        Click songLastX, songLastY - 60
        Sleep 4000

        ; --- Mover últimas 2 canciones a playlist ---
        Loop 2 {
            j := A_Index - 1
            MouseMove songLastX, songLastY - (j * songsGap)
            Sleep 200
            Click "Down"
            Sleep 200
            MouseMove playlistDropX, playlistDropY, 50
            Sleep 200
            Click "Down"
            Sleep 200
            Click "Up"
            Sleep 500
            ; --- Clic en vacío para cerrar popup ---
            Click emptyClickX, emptyClickY
            Sleep 200
        }

        ; --- buscar canción específica 1 ---
        Click spotifySearchX, spotifySearchY
        Sleep 200
        Send songE1
        Send "{Enter}"
        Sleep 3500

        ; --- mover canción a playlist ---
        MouseMove firstResultX, firstResultY
        Sleep 200
        Click "Down"
        Sleep 200
        MouseMove playlistDropX, playlistDropY, 50
        Sleep 200
        Click "Down"
        Sleep 200
        Click "Up"
        Sleep 300

        ; --- buscar canción específica 2 ---
        Click spotifySearchX, spotifySearchY
        Sleep 200
        Send "^a"
        Sleep 200
        Send songE2
        Send "{Enter}"
        Sleep 3500

        ; --- mover canción a playlist ---
        MouseMove firstResultX, firstResultY
        Sleep 200
        Click "Down"
        Sleep 200
        MouseMove playlistDropX, playlistDropY, 50
        Sleep 200
        Click "Down"
        Sleep 200
        Click "Up"
        Sleep 300

        ; --- abrir playlist ---
        Click playlistDropX, playlistDropY
        Sleep 3500
        Click emptyClickX, emptyClickY
        Sleep 1000

        ; --- ordenar canciones intercaladas (dos movimientos) ---
        MouseMove songLastX, songLastY
        Sleep 200
        Click "Down"
        Sleep 200
        MouseMove songLastX, songLastY - 5 - songsGap * 3, 50
        Sleep 200
        Click "Down"
        Sleep 200
        Click "Up"
        Sleep 1000

        MouseMove songLastX, songLastY
        Sleep 200
        Click "Down"
        Sleep 200
        MouseMove songLastX, songLastY - 5 - songsGap * 1, 50
        Sleep 200
        Click "Down"
        Sleep 200
        Click "Up"
        Sleep 500

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
        Sleep 4000

        ; --- click en imágenes y en 1ra imagen ---
        Click imagesTabX, imagesTabY
        Sleep 7000
        Click firstImageX, firstImageY
        Sleep 2000

        ; --- guardar imagen como ---
        Click imageClickX, imageClickY, "Right"
        Sleep 300
        Click imageClickX + saveImageX, imageClickY + saveImageY
        Sleep 1500

        ; --- nombre dinámico de archivo ---
        Send "^a"
        Sleep 200
        portadaNum := 10 - i
        Send "portada " portadaNum
        Sleep 200
        Send "{Enter}"
        Sleep 300

        ; --- buscar letras ---
        Click googleSearchX, googleSearchY
        Sleep 300
        Send "^v"
        Send " letras"
        Send "{Enter}"
        Sleep 5000

        ; --- copiar letra ---
        MouseMove googleSearchX + 22, firstImageY + 15
        Sleep 200
        Click "Down"
        Sleep 200
        MouseMove googleSearchX + 22 + 347, firstImageY + 15 + 220, 50
        Sleep 200
        Click "Up"
        Sleep 300
        Send "^c"
        Sleep 300

        ; --- pegar en buscador y copiar ---
        Click googleSearchX, googleSearchY
        Sleep 300
        Send "^a"
        Sleep 200
        Send "^v"
        Sleep 200
        Send "^a"
        Sleep 200
        Send "^c"
        Sleep 300

        ; --- volver a Spotify ---
        Click 75, 20
        Sleep 300

        ; --- clic en nombre de playlist y pegar ---
        Click firstResultX + 50, firstResultY
        Sleep 1000
        Send "{Right}"
        Sleep 200
        Send " "
        Sleep 200
        Send "^v"
        Sleep 300

        ; --- pegar en descripción ---
        Click descriptionX, descriptionY
        Sleep 200
        Send "^v"
        Sleep 300

        ; --- guardar y reproducir playlist ---
        Click savePlaylistX, savePlaylistY
        Sleep 3000
        Click songLastX, playPlaylistY
        Sleep 200

        ; --- clic en nombre de playlist ---
        Click firstResultX + 50, firstResultY
        Sleep 1000

        ; --- cambiar imagen de portada ---
        Click descriptionX - 60, descriptionY
        Sleep 2000

        ; --- seleccionar imagen más reciente ---
        Click downloadFirstImageX, downloadFirstImageY
        Sleep 200
        Send "{Enter}"
        ; --- guardarla ---
        Click savePlaylistX, savePlaylistY
        Sleep 200
    }
}