#!/bin/sh
# Script to check if charging has been completed and to send notifications if so
# Excuted when system is in charging mode

BAT0="/sys/class/power_supply/BAT0"
LED_INDICATOR=90

BATTERY_STATUS="$(cat $BAT0/status)"
BATTERY_PERCENTAGE="$(cat $BAT0/capacity)"


if [ $BATTERY_STATUS = "Charging" ]; then
    while [ $BATTERY_PERCENTAGE -lt $LED_INDICATOR ]; do
        sleep 1
        BATTERY_PERCENTAGE="$(cat $BAT0/capacity)"
    done

    if [ $BATTERY_PERCENTAGE -ge $LED_INDICATOR ]; then
        'notify-send' -i "/usr/share/icons/breeze-dark/status/32/battery-100-charging.svg" -a "Battery" "Charging Completed" "Unplug Power Supply"
    fi
fi
