#! /vendor/bin/sh
if [ -f "/data/system/users/0/settings_global.xml" ]  && [ `/vendor/bin/grep -c "name\=\"bluetooth_on\"\ value\=\"1\"" /data/system/users/0/settings_global.xml` -eq '1' ]; then
 /vendor/bin/sed -i 's/name\=\"bluetooth_on\"\ value\=\"1\"/name\=\"bluetooth_on\"\ value\=\"0\"/' /data/system/users/0/settings_global.xml
fi
