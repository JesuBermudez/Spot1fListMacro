dragSongToPlaylist(x, y, playlistDropX, playlistDropY) {
    emptyClickX := 1050, emptyClickY := 195 ; espacio en blanco en esquina superior derecha

    MouseMove x, y
    Sleep 200
    Click "Down"
    Sleep 200
    MouseMove playlistDropX, playlistDropY, 50
    Sleep 200
    Click "Down"
    Sleep 200
    Click "Up"
    Sleep 500

    ; Click vacío por seguridad (cerrar popups si aparecen)
    Click emptyClickX, emptyClickY
    Sleep 200
}