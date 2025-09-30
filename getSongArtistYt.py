import json

with open(r"C:\Users\jesma\Documentos\AutoHotkey\charts.json", "r", encoding="utf-8") as f:
    data = json.load(f)

track_views = data["contents"]["sectionListRenderer"]["contents"][0] \
    ["musicAnalyticsSectionRenderer"]["content"]["trackTypes"][0]["trackViews"]

rows = []
for track in track_views:
    title = track.get("name", "")
    artists = [a["name"] for a in track.get("artists", [])]
    artist_str = ", ".join(artists)
    combined = f"{title} {artist_str}"
    rows.append(combined)

# Guardar en un TXT, cada fila en una línea
with open("salida.txt", "w", encoding="utf-8") as f:
    f.write("\n".join(rows))
