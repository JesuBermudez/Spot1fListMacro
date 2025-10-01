updatePlaylistCover(playlistNameX, playlistNameY, savePlaylistX, savePlaylistY) {
    ; --- clic en nombre de playlist ---
    Click playlistNameX, playlistNameY
    Sleep 1000

    ; --- abrir editor de portada ---
    coverEditX := 440, coverEditY := 400           ; Icono/área para cambiar portada
    Click coverEditX, coverEditY
    Sleep 2000

    ; --- seleccionar imagen descargada más reciente ---
    downloadImageX := 300, downloadImageY := 600   ; Imagen más reciente en la carpeta descargas
    Click downloadImageX, downloadImageY
    Sleep 200
    Send "{Enter}"

    ; --- guardar cambios ---
    Click savePlaylistX, savePlaylistY
    Sleep 200
}