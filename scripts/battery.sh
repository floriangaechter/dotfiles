#!/bin/bash

_get_battery_status() {
    local _current_status
    local _charging="Yes"

    if [[ `uname` == 'Linux' ]]; then
        # Check if both battery files exist
        if [[ -f "/sys/class/power_supply/BAT0/capacity" && -f "/sys/class/power_supply/BAT1/capacity" ]]; then
            # Get capacity of both batteries
            local _bat0_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
            local _bat1_capacity=$(cat /sys/class/power_supply/BAT1/capacity)

            # Average the capacities
            _current_status=$(( (_bat0_capacity + _bat1_capacity) / 2 ))

            # Check if either battery is charging
            if [[ -f "/sys/class/power_supply/BAT0/status" && $(cat /sys/class/power_supply/BAT0/status) == "Discharging" ]] || \
               [[ -f "/sys/class/power_supply/BAT1/status" && $(cat /sys/class/power_supply/BAT1/status) == "Discharging" ]]; then
                _charging="No"
            fi
        elif [[ -f "/sys/class/power_supply/BAT0/capacity" ]]; then
            # Only BAT0 exists
            _current_status=$(cat /sys/class/power_supply/BAT0/capacity)
            [[ -f "/sys/class/power_supply/BAT0/status" && $(cat /sys/class/power_supply/BAT0/status) == "Discharging" ]] && _charging="No"
        elif [[ -f "/sys/class/power_supply/BAT1/capacity" ]]; then
            # Only BAT1 exists
            _current_status=$(cat /sys/class/power_supply/BAT1/capacity)
            [[ -f "/sys/class/power_supply/BAT1/status" && $(cat /sys/class/power_supply/BAT1/status) == "Discharging" ]] && _charging="No"
        fi
    else
        local _battery_info=`ioreg -rc AppleSmartBattery`
        _current_status=$(echo $_battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
        _charging=$(echo $_battery_info | grep -o '"ExternalConnected" = Yes' | awk '{print $3}')
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
