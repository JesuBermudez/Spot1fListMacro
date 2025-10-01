copyLyricsFromGoogle(googleSearchX, googleSearchY) {
    ; --- buscar letras en Google ---
    Click googleSearchX, googleSearchY
    Sleep 300
    Send "letras "
    Send "^v"
    Send "{Enter}"
    Sleep 5000

    ; --- coordenadas de selección (arriba-izquierda → abajo-derecha) ---
    pointAX := 176, pointAY := 300 ; arriba-izquierda de la letra
    pointBX := 347, pointBY := 220 ; abajo-derecha de la letra

    ; --- copiar letra ---
    MouseMove pointAX, pointAY
    Sleep 200
    Click "Down"
    Sleep 200
    MouseMove pointBX, pointBY, 50
    Sleep 200
    Click "Up"
    Sleep 300
    Send "^c"
    Sleep 300

    ; --- pegar en buscador y volver a copiar ---
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
    spotifyTabX := 75, spotifyTabY := 20 ; pestaña de Spotify
    Click spotifyTabX, spotifyTabY
    Sleep 300
}