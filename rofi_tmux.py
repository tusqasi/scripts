#!/usr/bin/env python3
from subprocess import Popen, run, PIPE

terminal = "alacritty"


def get_sessions():

    sessions: list[str] = (
        run("tmux list-session -F #S".split(), capture_output=True)
        .stdout.decode()
        .split()
    )
    return sessions


def get_choice(sessions):
    """get session choice"""
    sessions: bytes = "\n".join(sessions).encode()
    cmd: list[str] = ["rofi", "-dmenu", '-p "Select existing tmux session"']
    p: Popen = Popen(cmd, stdout=PIPE, stdin=PIPE, stderr=PIPE)
    choice, error = p.communicate(input=sessions)
    return choice.decode()


def main():
    sessions = get_sessions()
    choice = get_choice(sessions)
    if len(choice) == 0:
        return 0
    Popen(
        [f"{terminal} -e tmux new-session -A -s {choice}"],
        shell=True,
        stdin=None,
        stdout=None,
        stderr=None,
        close_fds=True,
    )

 

if __name__ == "__main__":
    # testing()
    main()
