Esc:: Pause   ; Si presionas Esc, termina el script
; Presiona F2 para ejecutar la secuencia
F2:: {
    ; --- Configuración ---
    vsX := 165, vsY := 1035
    vsLineX := 260, vsLineY := 100
    vsLinesGap := 20

    chromeX := 203, chromeY := 1035
    chromeGap := 37

    spotifySearchX := 720, spotifySearchY := 171
    firstResultX := 650, firstResultY := 375
    addPlaylistX := 715, addPlaylistY := 410
    mouseMovePlaylistX := 325
    playlistX := 1030, playlistY := 450

    songLastX := 465, songLastY := 815
    songsGap := 57
    playlistDropX := 125, playlistDropY := 375

    googleSearchX := 161, googleSearchY := 63
    imagesTabX := 390, imagesTabY := 251

    emptyClickX := 1250, emptyClickY := 270

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
        Sleep 300

        ; --- Reproducir la primera lista en inicio ---
        MouseMove songLastX + 100, playlistY + 10
        Sleep 200
        Click "Down"
        Click "Up"
        Sleep 1000

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
        Click addPlaylistX, addPlaylistY
        Sleep 300
        MouseMove addPlaylistX + mouseMovePlaylistX, playlistY
        Sleep 200
        Click playlistX, playlistY
        Sleep 500

        ; --- Clic en artista ---
        Click firstResultX, firstResultY, "Right"
        Sleep 300
        Click addPlaylistX, addPlaylistY + 165
        Sleep 300
        Click addPlaylistX + 250, addPlaylistY + 165
        Sleep 3500

        ; --- clic en albums, album de artista ---
        Send "{PgDn}"
        Sleep 1000
        Click 650, 516
        Sleep 1000
        Click songLastX + 90, 610
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
        Send "Mystic Jaye"
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
        Send "Deepl Jaye"
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
        MouseMove 532, 880
        Sleep 200
        Click "Down"
        Sleep 200
        MouseMove 532, 700, 50
        Sleep 200
        Click "Down"
        Sleep 200
        Click "Up"
        Sleep 1000

        MouseMove 532, 880
        Sleep 200
        Click "Down"
        Sleep 200
        MouseMove 532, 812, 50
        Sleep 200
        Click "Down"
        Sleep 200
        Click "Up"
        Sleep 500

        ; --- abrir nueva pestaña y buscar ---
        Click 292, 19
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
        Click 148, 455
        Sleep 2000

        ; --- guardar imagen como ---
        Click 1445, 500, "Right"
        Sleep 300
        Click 1416, 803
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
        MouseMove 230, 572
        Sleep 200
        Click "Down"
        Sleep 200
        MouseMove 553, 698, 50
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
        Click 816, 566
        Sleep 200
        Send "^v"
        Sleep 300

        ; --- guardar y reproducir playlist ---
        Click 1011, 695
        Sleep 3000
        Click 452, 530
        Sleep 200

        ; --- clic en nombre de playlist ---
        Click firstResultX + 50, firstResultY
        Sleep 1000

        ; --- cambiar imagen de portada ---
        Click 690, 541
        Sleep 2000

        ; --- seleccionar imagen más reciente ---
        Click 231, 202
        Sleep 200
        Send "{Enter}"
        ; --- guardara ---
        Click 1011, 700
        Sleep 200
    }
}