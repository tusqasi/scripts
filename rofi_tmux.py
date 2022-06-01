#!/usr/bin/python

import subprocess
import utils

terminal = "alacritty"


def get_sessions() -> list[str]:
    """Get open tmux session"""
    sessions: list[str] = utils.run_shell_cmd(
        ["tmux list-session", "-F '#S'"],
    ).split()
    return sessions


def get_choice(sessions: str) -> str:
    """Get session choice"""
    sessions: bytes = "\n".join(sessions).encode()
    cmd: list[str] = ["rofi", "-dmenu", '-p "Select existing tmux session"']

    choice: str = (
        subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stdin=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
        .communicate(input=sessions)[0]
        .decode()
    )
    return choice


def main():
    sessions = get_sessions()
    choice = get_choice(sessions)
    if len(choice) == 0:
        return 0

    """New session with name given in the input"""
    subprocess.Popen(
        [f"{terminal} -e tmux new-session -A -s {choice}"],
        shell=True,
        stdin=None,
        stdout=None,
        stderr=None,
        close_fds=True,
    )


if __name__ == "__main__":
    main()
