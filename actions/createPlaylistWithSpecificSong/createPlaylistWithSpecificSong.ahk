#Include ../searchSpecificSong/searchSpecificSong.ahk

createPlaylistWithSpecificSong(song) {
    coords := searchSpecificSong(song)
    firstResultX := coords[1], firstResultY := coords[2]

    ; Click derecho en el primer resultado
    Click firstResultX, firstResultY, "Right"
    Sleep 300

    ; Crear nueva playlist en menú contextual
    addToPlaylistX := 568, addToPlaylistY := 323
    submenuPlaylistX := 756, submenuPlaylistY := 323
    newPlaylistX := 756, newPlaylistY := 350

    Click addToPlaylistX, addToPlaylistY
    Sleep 300
    MouseMove submenuPlaylistX, submenuPlaylistY
    Sleep 200
    Click newPlaylistX, newPlaylistY
    Sleep 500
}