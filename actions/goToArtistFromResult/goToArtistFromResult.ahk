goToArtistFromResult() {
    ; Click derecho en el primer resultado (artista)
    firstResultX := 553, firstResultY := 300    ;  primer resultado en la lista
    Click firstResultX, firstResultY, "Right"
    Sleep 300

    ; Opción "Ir al artista" en el menú contextual
    goToArtistX := 568, goToArtistY := 430      ; opción "Ir al artista"
    Click goToArtistX, goToArtistY
    Sleep 500

    ; Entrada del artista en el submenú (abrir su página)
    artistEntryX := 760, artistEntryY := 455    ; nombre del artista
    Click artistEntryX, artistEntryY
    Sleep 3500 ; esperar a que cargue la página del artista
}