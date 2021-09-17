#!/usr/bin/env python3

from subprocess import Popen, PIPE
from time import sleep


def get_battery() -> tuple[bool, int]:
    cmd: list[str] = ["acpi", "-b"]
    p: Popen = (
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


def send_notification(text: str, urgency="normal") -> None:
    cmd = [
        "notify-send",
        "-u",
        urgency,
        text,
    ]
    Popen(
        " ".join(cmd),
        stdout=PIPE,
        shell=True,
    )


def main():
    while True:
        on_ac, bat = get_battery()
        if on_ac:
            if bat > 80:
                send_notification(f"'Warning!\nBattery high: {bat}%'", "critical")
            elif bat > 70:
                send_notification(f"'Warning!\nBattery high: {bat}%'")
            continue

        if bat < 50:
            send_notification(f"'Warning!\nBattery low: {bat}%'")
        elif bat < 30:
            send_notification(f"'Warning!\nBattery low: {bat}%'", "critical")

        sleep(5 * 60)


if __name__ == "__main__":
    main()
