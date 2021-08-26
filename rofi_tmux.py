#!/usr/bin/env python

import os
import sys
import subprocess
from subprocess import Popen, PIPE, STDOUT


"""a script to spawn a tmux session
"""


terminal: str = "alacritty"


def switch_to(session: str):
    """spawn a terminal with the session"""
    subprocess.Popen(
        [f"{terminal} -e tmux a -t {session}"],
        shell=True,
        stdin=None,
        stdout=None,
        stderr=None,
        close_fds=True,
    )


def make_session(session: str):
    """create a tmux session"""
    subprocess.Popen(
        [f"tmux new-session -d -s {session}"],
        shell=True,
        stdin=None,
        stdout=None,
        stderr=None,
        close_fds=True,
    )


def get_sessions():
    """get running sessions"""
    sessions: list[str] = os.popen("tmux list-session -F '#S'").read().split()
    return sessions


def display_session(sessions: bytes):
    """display sessions and get input"""
    sessions: bytes = "\n".join(sessions).encode()
    cmd: list[str] = ["rofi", "-dmenu", '-p "Select existing tmux session"']
    # print(subprocess.run(cmd,stdin=sessions))
    p: Popen = Popen(cmd, stdout=PIPE, stdin=PIPE, stderr=PIPE)
    choice, error = p.communicate(input=sessions)
    if not choice:
        exit()
    return choice.decode()[:-1]


def main():
    sessions = get_sessions()
    session_choice = display_session(sessions)
    if session_choice in sessions:
        switch_to(session_choice)
    else:
        make_session(session_choice)
        switch_to(session_choice)


if __name__ == "__main__":
    main()
