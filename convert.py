import json
from pprint import pprint as P

with open("./gitmojis.json") as fp:
    gitmojis = [f"{x['emoji']} {x['description']}\n" for x in json.load(fp)["gitmojis"]]
P(gitmojis)
with open("./emojis.csv", "w") as fp:
    fp.writelines(gitmojis)
