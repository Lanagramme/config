#!/usr/bin/env bash
#
# start-piano.sh — Automatically start FluidSynth and connect your MIDI keyboard

SOUNDFONT="/usr/share/sounds/sf2/FluidR3_GM.sf2"
AUDIO_DRIVER="pulseaudio"   # could be 'alsa' if PulseAudio doesn’t work
KEYBOARD_NAME="iRig KEYS Pro"  # name from `aconnect -l`

echo "🎹 Starting FluidSynth..."
fluidsynth -a "$AUDIO_DRIVER" -m alsa_seq "$SOUNDFONT" > /tmp/fluidsynth.log 2>&1 &
FS_PID=$!

# Wait for FluidSynth to register its MIDI port
echo "⏳ Waiting for FluidSynth to initialize..."
for i in {1..10}; do
    sleep 0.5
    if aconnect -l | grep -q "FluidSynth"; then
        break
    fi
done

# Get client numbers
KEYBOARD_ID=$(aconnect -l | grep -A1 "$KEYBOARD_NAME" | head -n1 | awk -F' ' '{print $2}' | tr -d ':')
FS_ID=$(aconnect -l | grep -A1 "FluidSynth" | head -n1 | awk -F' ' '{print $2}' | tr -d ':')

if [[ -z "$KEYBOARD_ID" || -z "$FS_ID" ]]; then
    echo "❌ Could not detect MIDI devices!"
    kill $FS_PID
    exit 1
fi

echo "🔗 Connecting MIDI keyboard ($KEYBOARD_ID) → FluidSynth ($FS_ID)..."
aconnect "$KEYBOARD_ID:0" "$FS_ID:0" 2>/dev/null

echo "✅ All set! Play your keyboard to hear sound."
echo "🛑 To stop, press Ctrl+C — or run: kill $FS_PID"

wait $FS_PID

