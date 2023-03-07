#!/bin/sh

echo "1. test led:"
ls /sys/class/leds

echo "2. test usb:"
lsusb

echo "3. test uart:"
ls /dev/tty*

echo "4. test i2c codec:"
i2cdetect -y 0

echo "5. test i2c pmic:"
i2cdetect -y 3

echo "6. test uSD Card:"
cat /proc/partitions | grep mmcblk0

echo "7. test ethernet:"
ifconfig

echo "8. test audio:"
#aplay -D plughw:CARD=STM32MP15DK /home/root/somewhere.wav
amixer -q -D pulse sset Master 30%; aplay /home/root/somewhere.wav &

echo "9. test 4G:"
./test-4g

echo "9. test done!"