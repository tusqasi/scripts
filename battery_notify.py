#!/usr/bin/env python3

from subprocess import Popen, PIPE
from time import sleep


def get_battery() -> tuple[bool, int]:
    cmd: list[str] = ["acpi", "-b"]
    p: list[str] = (
        Popen(
            " ".join(cmd),
            stdout=PIPE,
            shell=True,
        )
        .communicate()[0]
        .decode()
        .split()
    )

    on_ac = True
    if p[2] == "Discharging,":
        on_ac = False
    bat = int(p[3][:-2])
    return on_ac, bat


def send_notification(text: str, urgency: str = "normal") -> None:
    cmd = [
        "notify-send",
        "-u",
        urgency,
        text,
    ]
    print(" ".join(cmd))
    Popen(
        " ".join(cmd),
        stdout=PIPE,
        shell=True,
    )


def main():
    warning = "Warning\nBattery"
    while True:
        on_ac, bat = get_battery()
        if on_ac:
            if bat > 80:
                send_notification(f"'{warning} high {bat}%'", urgency="critical")
            elif bat > 70:
                send_notification(f"'{warning} high {bat}%'")
            continue

        if bat < 30:
            send_notification(f"'{warning} low {bat}%'", urgency="critical")
        elif bat < 50:
            send_notification(f"'{warning} low {bat}%'")
        sleep(5 * 60)


if __name__ == "__main__":
    main()
