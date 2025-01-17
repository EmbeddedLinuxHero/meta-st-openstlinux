#!/bin/sh

### Check if a directory does not exist ###
if [ -f "setup.sh" ]; then
    ./setup.sh
    rm setup.sh
fi

echo "1. test led:"
ls /sys/class/leds

echo "2. test uart:"
ls /dev/tty*

echo "3. test i2c codec:"
i2cdetect -y 0

echo "4. test i2c pmic:"
i2cdetect -y 3

echo "5. test uSD Card:"
cat /proc/partitions | grep mmcblk0

echo "6. test audio:"
#aplay -D plughw:CARD=STM32MP15DK /home/root/somewhere.wav
amixer -q -D pulse sset Master 30%; aplay /home/root/somewhere.wav &

echo "7. test 4G:"
/usr/local/linuxapp/bin/reset-4g

echo "8. test ethernet:"
ifconfig

echo "9. test done!"