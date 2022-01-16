#!/usr/bin/env python
# coding=utf-8
import os
from pathlib import Path
import utils


def main():
    clip_board = utils.run_shell_cmd(["xsel", "-b"])
    repo_name = clip_board.split("/")[~0]
    if not clip_board:
        print("❌Empty cliboard")
        return 1

    if Path(f"/home/tusqasi/clones/{repo_name}").exists():
        print("❌ Directory with reponame already exists")
        utils.send_notification("❌ Directory with reponame already exists")
        return 1

    if clip_board.find("https://github.com") == 0:
        os.system(f"cd ~/clones/; git clone {clip_board}")
        print(f"Cloned {clip_board}")
        utils.send_notification(f"Cloned {clip_board}")
    else:
        print("❌ No valid url found in clipboard")
        utils.send_notification(
            "No url found in clipboard",
            urgency="critical",
        )


if __name__ == "__main__":
    main()
