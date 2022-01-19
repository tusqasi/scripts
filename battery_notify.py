#!/usr/bin/env python3

import time
import utils

# In seconds
INTERVAL = 1 * 60

# Thresholds for the battery charging
MAX_BATT = 80
MIN_BATT = 30


def get_battery() -> tuple[bool, int]:
    """Get battery info
    charging"""
    cmd: list[str] = ["acpi", "-b"]
    p = utils.run_shell_cmd(cmd).split("\n")[0].split()
    charging = True
    if p[2] == "Discharging,":
        charging = False
    bat = int(p[3].split("%")[0])
    return charging, bat


def send_notification(
    text: str,
    urgency: str = "normal",
) -> None:
    cmd = [
        "notify-send",
        "-u",
        urgency,
        text,
    ]
    utils.run_shell_cmd(cmd)


def main():
    while "FOREVER":
        time.sleep(INTERVAL)
        charging: bool
        current_batt: int
        charging, current_batt = get_battery()
        print(f"CHARGING:{charging} BATT:{current_batt}")
        if charging:

            if current_batt > MAX_BATT:
                print(f"Warning HIGH 🔋{current_batt}%")
                send_notification(
                    f"'🛑Warning🛑\nHIGH 🔋{current_batt}%\n🔌UNPLUG'",
                    urgency="critical",
                )
            elif current_batt > MAX_BATT - 10:
                print(f"Warning HIGH 🔋{current_batt}%")
                send_notification(f"'Warning\nHIGH 🔋{current_batt}%\n'")

        elif not charging:
            if current_batt < MIN_BATT + 10:
                print(f"Warning LOW 🔋{current_batt}%")
                send_notification(
                    f"'🛑Warning🛑\nLOW 🔋{current_batt}%\n⚡ PLUG IN'",
                    urgency="critical",
                )
            elif current_batt < MIN_BATT:
                print(f"Warning LOW 🔋{current_batt}%")
                send_notification(f"'Warning\nLOW 🔋{current_batt}%'")
        else:
            print("🔋Battery has enough charge")


if __name__ == "__main__":
    main()
