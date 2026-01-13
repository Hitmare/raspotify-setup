#!/bin/bash

# Run librespot device listing
#OUTPUT="$(librespot -d 2>&1)"
OUTPUT="$(aplay -l 2>&1)"
DEVICE1="surround40:CARD=Device,DEV=0"
DEVICE2="surround40:CARD=Bar,DEV=0"

DEV2="HP Speaker Bar"
DEV1="USB Audio Device"

FOUND_DEVICE=""

# Detect which device appears
if echo "$OUTPUT" | grep -q "$DEV1"; then
    FOUND_DEVICE="$DEVICE1"
elif echo "$OUTPUT" | grep -q "$DEV2"; then
    FOUND_DEVICE="$DEVICE2"
else
    echo "No matching device found."
    exit 1
fi

CONF_FILE="/etc/raspotify/conf"

# Replace the LIBRESPOT_DEVICE= line
if grep -q "^LIBRESPOT_DEVICE=" "$CONF_FILE"; then
    sed -i "s|^LIBRESPOT_DEVICE=.*|LIBRESPOT_DEVICE=$FOUND_DEVICE|" "$CONF_FILE"
else
    echo "LIBRESPOT_DEVICE=$FOUND_DEVICE" >> "$CONF_FILE"
fi

echo "Updated LIBRESPOT_DEVICE to: $FOUND_DEVICE"


# Restart raspotify
systemctl restart raspotify
echo "raspotify restarted."
