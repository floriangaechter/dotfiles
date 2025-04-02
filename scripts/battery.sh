#!/bin/bash

BATTERY_DIR="/sys/class/power_supply/BAT0"

_get_battery_status() {
    if [[ `uname` == 'Linux' ]]; then
        _current_status=$(cat /proc/acpi/battery/BAT1/state | grep 'remaining capacity' | awk '{print $3}')
    else
        battery_info=`ioreg -rc AppleSmartBattery`
        _current_status=$(echo $battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
        _charging=$(echo $battery_info | grep -o '"ExternalConnected" = Yes' | awk '{print $3}')
    fi

    if [ "$_current_status" -le "20" ]; then
        printf ""
    elif [ "$_current_status" -le "40" ]; then
        printf ""
    elif [ "$_current_status" -le "60" ]; then
        printf ""
    elif [ "$_current_status" -le "80" ]; then
        printf ""
    else
        printf ""
    fi

    printf "  $_current_status%%"

    [ "$_charging" = "Yes" ] && printf " "
}

_get_battery_status
