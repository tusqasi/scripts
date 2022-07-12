import subprocess


def run_shell_cmd(cmd: list[str]) -> str:
    """Returns the output of the command"""
    cmd = " ".join(cmd)
    p: str = (
        subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            shell=True,
        )
        .communicate()[0]
        .decode()
    )
    return p


def send_notification(text: str, urgency: str = "normal") -> None:
    """Sends a notification from shell with notify-send"""
    cmd = [
        "notify-send",
        "-u",
        urgency,
        text,
    ]
    run_shell_cmd(cmd)


def main():
    send_notification("hello 'there how is it going'")


if __name__ == "__main__":
    main()
