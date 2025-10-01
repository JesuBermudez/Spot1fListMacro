#Include actions/copyLineFromVS/copyLineFromVS.ahk
#Include actions/switchChromeTab/switchChromeTab.ahk
#Include actions/createPlaylistWithSpecificSong/createPlaylistWithSpecificSong.ahk
#Include actions/addSpecificSongToPlaylist/addSpecificSongToPlaylist.ahk
#Include actions/goToArtistFromResult/goToArtistFromResult.ahk
#Include actions/openArtistAndSelectFirstAlbum/openArtistAndSelectFirstAlbum.ahk
#Include actions/addFirstTwoAlbumSongsToPlaylist/addFirstTwoAlbumSongsToPlaylist.ahk
#Include actions/reorderSpecificSongs/reorderSpecificSongs.ahk
#Include actions/saveCoverFromGoogle/saveCoverFromGoogle.ahk
#Include actions/copyLyricsFromGoogle/copyLyricsFromGoogle.ahk
#Include actions/updatePlaylistInfoAndPlay/updatePlaylistInfoAndPlay.ahk
#Include actions/updatePlaylistCover/updatePlaylistCover.ahk

Esc:: Pause   ; Si presionas Esc, se pausa el script
; Presiona F2 para ejecutar la secuencia
F2:: {
    ; --- Coordenadas de la playlist nueva, a la izquierda ---
    playlistDropX := 58
    playlistDropY := 292
    firstSongX := 318, firstSongY := 580   ; Primera canción del álbum
    songsGap := 30                         ; Distancia entre canciones (ajústalo según tu pantalla)
    googleSearchX := 154, googleSearchY := 63  ; Barra de búsqueda de Google
    playlistNameX := 603, playlistNameY := 300 ; Posición del nombre de la playlist
    savePlaylistX := 793, savePlaylistY := 504 ; Botón "Guardar" al editar playlist
    songE1 := "Echoes of Us Jaye"   ; Canción específica 1
    songE2 := "Infinite Pulse Jaye" ; Canción específica 2

    Loop 10 {
        i := A_Index - 1

        copyLineFromVS(i)
        switchChromeTab(i)
        createPlaylistWithSpecificSong(songE1)
        addSpecificSongToPlaylist(songE2, playlistDropX, playlistDropY)
        songClipboard := Clipboard  ; Guardar lo que esta copiado (Ctrl+C en VS)
        addSpecificSongToPlaylist(songClipboard, playlistDropX, playlistDropY)
        goToArtistFromResult()
        openArtistAndSelectFirstAlbum()
        addFirstTwoAlbumSongsToPlaylist(firstSongX, firstSongY, songsGap, playlistDropX, playlistDropY)
        reorderSpecificSongs(firstSongX, firstSongY, songsGap)
        saveCoverFromGoogle(i, googleSearchX, googleSearchY)
        copyLyricsFromGoogle(googleSearchX, googleSearchY)
        updatePlaylistInfoAndPlay(playlistNameX, playlistNameY, savePlaylistX, savePlaylistY)
        updatePlaylistCover(playlistNameX, playlistNameY, savePlaylistX, savePlaylistY)
    }
}