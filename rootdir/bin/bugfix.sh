#! /vendor/bin/sh
if [ "$1" == "bt_off" ]; then
 if [ -f "/data/system/users/0/settings_global.xml" ]  && [ `/vendor/bin/grep -c "name\=\"bluetooth_on\"\ value\=\"1\"" /data/system/users/0/settings_global.xml` -eq '1' ]; then
  #/vendor/bin/awk 'BEGIN{FS=OFS=" ";RS=ORS="\n"}/bluetooth_on/{$4="value\=\"0\"";$6="defaultValue\=\"0\""}{print > "/data/system/users/0/settings_global.xml"}' /data/system/users/0/settings_global.xml
  /vendor/bin/sed -i 's/name\=\"bluetooth_on\"\ value\=\"1\"/name\=\"bluetooth_on\"\ value\=\"0\"/' /data/system/users/0/settings_global.xml
  /vendor/bin/touch /data/local/tmp/bluetooth_on
 elif [ -f "/data/local/tmp/bluetooth_on" ]; then
  /vendor/bin/rm /data/local/tmp/bluetooth_on
 fi
elif [ "$1" == "bt_on" ]; then
 if [ -f "/data/local/tmp/bluetooth_on" ]; then
  /system/bin/service call bluetooth_manager 6
 fi
fi
