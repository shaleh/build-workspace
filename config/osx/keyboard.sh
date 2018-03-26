#!/bin/bash

VENDOR_ID=$(ioreg -n IOHIDInterface -r | awk '$2 == "\"VendorID\"" { print $4 }')
PRODUCT_ID=$(ioreg -n IOHIDInterface -r | awk '$2 == "\"ProductID\"" { print $4 }')

n1=$(echo -n "$VENDOR_ID" | grep -c "^")
n2=$(echo -n "$PRODUCT_ID" | grep -c "^")

if [ $n1 -ne $n2 ]; then
    echo "Failed to find VENDOR and PRODUCT!"
    exit 1
fi

KBS=""

# Handling multiple VendorID and ProductID combos
while read -r VID && read -r PID <&3; do
    if [ -n "$KBS" ]; then
	KBS+=" "
    fi

    KBS+="$VID-$PID-0"
done <<< "$VENDOR_ID" 3<<< "$PRODUCT_ID"

KBS=$(echo $KBS | xargs -n1 | sort -u)
while read -r KB; do
    defaults -currentHost write -g com.apple.keyboard.modifiermapping.$KB -array \
'<dict>
<key>HIDKeyboardModifierMappingDst</key>
<integer>30064771296</integer>
<key>HIDKeyboardModifierMappingSrc</key>
<integer>30064771129</integer>
</dict>'
done <<< "$KBS"
