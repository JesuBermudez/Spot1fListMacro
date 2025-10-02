reorderSpecificSongs(songFirstX, songFirstY, songsGap) {
    ; Reordena las dos primeras canciones:
    ;  - La primera a posición 3
    ;  - La primera a posición 4

    Loop 2 {
        idx := A_Index + 1
        toY := songFirstY + (songsGap * idx)

        ; Arrastrar canción desde fromY hasta toY
        Click songFirstX, songFirstY, "Down"
        Sleep 200
        MouseMove songFirstX, toY, 50
        Sleep 200
        Click "Down"
        Sleep 200
        Click "Up"
        Sleep 800
    }
}