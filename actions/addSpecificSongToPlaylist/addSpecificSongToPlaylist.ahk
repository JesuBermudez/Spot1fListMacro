#Include ../searchSpecificSong/searchSpecificSong.ahk
#Include ../dragSongToPlaylist/dragSongToPlaylist.ahk

addSpecificSongToPlaylist(song, playlistDropX, playlistDropY) {
    coords := searchSpecificSong(song)
    firstResultX := coords[1], firstResultY := coords[2]

    ; Arrastrar resultado a la playlist existente
    dragSongToPlaylist(firstResultX, firstResultY, playlistDropX, playlistDropY)
}