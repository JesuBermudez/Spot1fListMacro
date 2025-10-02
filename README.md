# Spotify & YouTube Charts Extractor

Este proyecto permite extraer listas de canciones con artistas desde los JSON que usan las páginas de:

- YouTube Charts
- Spotify Charts
- Playlists de open.spotify.com

y generar un archivo `.txt` con el formato:

```
Canción - Artista1, Artista2, ...
```

---

## 🚀 Requisitos

- Python 3.8 o superior
- Paquetes estándar de Python (`json`, `os`) → ya vienen incluidos, no necesitas instalar nada extra

---

## 📂 Estructura del proyecto

```
.
├── chartsJson/                 # Aquí van los JSON descargados desde el navegador
│   ├── chartsSp.json           # Spotify Charts
│   ├── chartsYt.json           # YouTube Charts
│   ├── openSp1.json            # Primera mitad de playlist de open.spotify.com
│   └── openSp2.json            # Segunda mitad de playlist de open.spotify.com
│
├── getSongList/                # Scripts de Python
│   ├── getSongArtistChartSp.py     # Procesa chartsSp.json
│   ├── getSongArtistChartYt.py     # Procesa chartsYt.json
│   └── getSongArtistOpenSp.py      # Procesa openSp1.json + openSp2.json
│
├── outputs/                    # Resultados de los scripts
│   ├── salidaChartSp.txt
│   ├── salidaChartYt.txt
│   └── salidaOpenSp.txt
│
├── SpotifyLists.ahk            # Script AutoHotkey (para manejo en Spotify)
└── README.md                   # Este archivo
```

---

## 📝 Pasos para obtener los JSON

### 1. YouTube Charts

- Ir a [YouTube Charts](https://charts.youtube.com)
- Abrir el Inspector del navegador (F12).
- Ir a la pestaña **Network**.
- Filtrar por `browse`.
- Abrir la petición → pestaña **Response**.
- Seleccionar todo el contenido (`Ctrl + A`) y copiarlo.
- Vaciar el archivo `chartsYt.json` y pegar el contenido copiado.

### 2. Spotify Charts

- Ir a [Spotify Charts](https://spotifycharts.com)
- Abrir el Inspector del navegador (F12).
- Ir a la pestaña **Network**.
- Filtrar por `charts`.
- Abrir la petición → pestaña **Response**.
- Copiar todo el contenido.
- Vaciar el archivo `chartsSp.json` y pegar el contenido.

### 3. Playlists en open.spotify.com

- Abrir la playlist en [open.spotify.com](https://open.spotify.com)
- Abrir el Inspector del navegador (F12).
- Ir a la pestaña **Network**.
- Filtrar por `query`.
- Ubicar las 2 peticiones grandes que en la respuesta empiezan con:

```
"data": {
  "playlistV2": {
    "__typename": "Playlist",
    ...
```

- Guardar la primera en `openSp1.json` y la segunda en `openSp2.json`.

---

## ▶️ Ejecución

Ejecutar los siguientes comandos desde la raíz del proyecto:

```
# Procesar YouTube Charts
python getSongList/getSongArtistChartYt.py

# Procesar Spotify Charts
python getSongList/getSongArtistChartSp.py

# Procesar open.spotify.com playlists
python getSongList/getSongArtistOpenSp.py
```

Los resultados aparecerán en la carpeta `outputs/`:

- `salidaChartYt.txt`
- `salidaChartSp.txt`
- `salidaOpenSp.txt`

---

## ✅ Resultado esperado

Formato de salida en los `.txt`:

```
Put On - Jeezy, Kanye West
Golden - HUNTR/X, EJAE, AUDREY NUNA, REI AMI, KPop Demon Hunters Cast
back to friends - sombr
...
```

Este formato usa bloques de código para diferenciar segmentos de código, comandos, y estructura. Los títulos usan el símbolo `#` para encabezados. Así los símbolos se mantienen legibles y es fácil copiar todo sin que el frontend lo interprete mal.
