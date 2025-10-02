updatePlaylistInfoAndPlay(playlistNameX, playlistNameY, savePlaylistX, savePlaylistY) {
    ; --- clic en nombre de la playlist para editar ---
    Click playlistNameX, playlistNameY
    Sleep 1000
    Send "{Right}"
    Sleep 200
    Send " "
    Sleep 200
    Send "^v"
    Sleep 300

    ; --- pegar en descripción ---
    descriptionX := 500, descriptionY := 400     ; Área de descripción de la playlist
    Click descriptionX, descriptionY
    Sleep 200
    Send "^v"
    Sleep 300

    ; --- guardar playlist ---
    Click savePlaylistX, savePlaylistY
    Sleep 3000

    ; --- reproducir playlist ---
    playPlaylistX := 700, playPlaylistY := 550   ; Botón "Play"
    Click playPlaylistX, playPlaylistY
    Sleep 200
}