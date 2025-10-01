#Include ../dragSongToPlaylist/dragSongToPlaylist.ahk

addFirstTwoAlbumSongsToPlaylist(firstSongX, firstSongY, songsGap, playlistDropX, playlistDropY) {
    Loop 2 {
        j := A_Index - 1
        songX := firstSongX
        songY := firstSongY + (j * songsGap)   ; Primera canción (j=0), segunda canción (j=1)

        dragSongToPlaylist(songX, songY, playlistDropX, playlistDropY)
    }

    ; Abrir playlist resultante
    Click playlistDropX, playlistDropY
    Sleep 3500
}