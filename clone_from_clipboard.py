#!/usr/bin/python3.10

import os
from pathlib import Path
import utils
from rich import print


def main():
    clip_board = utils.run_shell_cmd("xsel -b -o".split())
    repo_name = clip_board.split("/")[-1]
    if not clip_board:
        print("[red]❌[/red] Empty cliboard")
        return 1

    if Path(f"/home/tusqasi/clones/{repo_name}").exists():
        print("[red]❌[/red] Directory with reponame already exists")
        utils.send_notification("[red]❌[/red] Directory with reponame already exists")
        return 1

    if clip_board.find("https://github.com") == 0:
        os.system(f"cd ~/clones/; git clone {clip_board}")
        print(f"[green]Cloned[/green] {clip_board}")
        utils.send_notification(f"Cloned {clip_board}")
    else:
        print("[red]❌[/red] No valid url found in clipboard")
        utils.send_notification(
            "No url found in clipboard",
            urgency="critical",
        )


if __name__ == "__main__":
    main()
