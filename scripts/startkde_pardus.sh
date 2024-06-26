#!/data/data/com.termux/files/usr/bin/bash

# Kill open X11 processes
kill -9 $(pgrep -f "termux.x11") 2>/dev/null

# Enable PulseAudio over Network
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

# Prepare termux-x11 session
export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 >/dev/null &

# Wait a bit until termux-x11 gets started.
sleep 3

# Launch Termux X11 main activity
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity > /dev/null 2>&1
sleep 1

# Login in PRoot Environment. Do some initialization for PulseAudio, /tmp directory
# and run KDE as user droidmaster.
# Replace "pardus" with the name of your PRoot distribution that supports KDE.
# Replace "startplasma-x11" with the appropriate command to start KDE on your distribution.
proot-distro login pardus --user your_username --shared-tmp -- /bin/bash -c  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=${TMPDIR} && env DISPLAY=:0 dbus-launch --exit-with-session startplasma-x11'

exit 0
