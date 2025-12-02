#!/usr/bin/env bash

_get_battery_status() {
  local _current_status
  local _charging="Yes"

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    local _battery_info=$(upower -i /org/freedesktop/UPower/devices/DisplayDevice)
    _current_status=$(echo $_battery_info | grep -o 'percentage' | awk '{printf "%.0f", $2}')
    _charging=$(echo $_battery_info | awk '/state:/ {print ($2 == "charging" ? "Yes" : "")}')
    echo $_current_status
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    local _battery_info=$(ioreg -rc AppleSmartBattery)
    _current_status=$(echo $_battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
    _charging=$(echo $_battery_info | grep -o '"ExternalConnected" = Yes' | awk '{print $3}')
  fi

  if [ "$_charging" = "Yes" ]; then
    printf ""
  elif [ "$_current_status" -le "20" ]; then
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
}

_get_battery_status
