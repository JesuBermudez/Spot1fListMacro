import json
import os

base_dir = os.path.dirname(os.path.abspath(__file__))

json1_path = os.path.join(base_dir, "../chartsJson/openSp1.json")   # primera mitad
json2_path = os.path.join(base_dir, "../chartsJson/openSp2.json")   # segunda mitad

output_file = os.path.join(base_dir, "../outputs/salidaOpenSp.txt")


def procesar_json(json_path, mode, output_file):
    with open(json_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    items = data["data"]["playlistV2"]["content"]["items"]

    with open(output_file, mode, encoding="utf-8") as out:
        for item in items:
            track = item["itemV2"]["data"]["name"]
            artists = [a["profile"]["name"] for a in item["itemV2"]["data"]["artists"]["items"]]
            artists_str = ", ".join(artists)
            out.write(f"{track} {artists_str}\n")


procesar_json(json1_path, "w", output_file)
procesar_json(json2_path, "a", output_file)
