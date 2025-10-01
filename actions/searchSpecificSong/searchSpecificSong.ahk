searchSpecificSong(song) {
    spotifySearchX := 708, spotifySearchY := 165  ; Barra de búsqueda
    firstResultX := 553, firstResultY := 300      ; Primer resultado

    Click spotifySearchX, spotifySearchY
    Sleep 200
    Send "^a"   ; Limpiar búsqueda
    Sleep 200
    Send song
    Send "{Enter}"
    Sleep 3500

    return [firstResultX, firstResultY]
}