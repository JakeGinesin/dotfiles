import gi
import time
gi.require_version('Gio', '2.0')
from gi.repository import Gio, GLib

class PomodoroInterface:
    def __init__(self):
        # Initialize the DBus interface
        self.bus = Gio.bus_get_sync(Gio.BusType.SESSION, None)
        self.dbus_proxy = Gio.DBusProxy.new_sync(self.bus, Gio.DBusProxyFlags.NONE, None,
                                            'org.freedesktop.DBus', '/org/freedesktop/DBus', 'org.freedesktop.DBus', None)

        # Check if Pomodoro is active
        active_services = self.dbus_proxy.ListNames()
        if 'org.gnome.Pomodoro' not in active_services:
            #print("Pomodoro is not active.")
            print("")
            exit(0)

        self.proxy = Gio.DBusProxy.new_sync(self.bus, Gio.DBusProxyFlags.NONE, None,
                                            'org.gnome.Pomodoro', '/org/gnome/Pomodoro', 'org.gnome.Pomodoro', None)

    def get_remaining_time(self):
        # Get the current state and remaining time
        state = self.proxy.get_cached_property('State').unpack()
        if (state == "null"):
            print("")
            exit(0)

        elapsed = self.proxy.get_cached_property('Elapsed').unpack()
        state_duration = self.proxy.get_cached_property('StateDuration').unpack()
        remaining = state_duration - elapsed

        # Format the remaining time as minutes:seconds
        minutes = int(remaining) // 60
        seconds = int(remaining) % 60
        formatted_remaining = f"{minutes}:{seconds:02d}"
        if (state == "short-break"):
            state="break"

        print(f"{state} - {formatted_remaining}")

if __name__ == "__main__":
    pomodoro = PomodoroInterface()
    pomodoro.get_remaining_time()
