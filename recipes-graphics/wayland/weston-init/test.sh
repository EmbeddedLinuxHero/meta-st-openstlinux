#!/bin/sh

echo "1. test led"
ls /sys/class/leds

echo "2. test uart"
ls /dev/tty*

echo "3. test i2c codec"
i2cdetect -y 0

echo "4. test i2c pmic"
i2cdetect -y 3

echo "5. test audio"
aplay -D plughw:CARD=STM32MP15DK /home/root/somewhere.wav