openArtistAndSelectFirstAlbum() {
    ; Desplazar hacia abajo hasta la sección de álbumes
    Send "{PgDn}"
    Sleep 1000

    ; Hacer clic albumes
    albumTabX := 455, albumTabY := 490    ; filtrar por álbumes
    Click albumTabX, albumTabY
    Sleep 1000

    firstAlbumX := 318, firstAlbumY := 580  ; seleccionar el primer álbum
    Click firstAlbumX, firstAlbumY
    Sleep 4000
}