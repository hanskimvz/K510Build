echo enabled > /sys/class/thermal/thermal_zone0/mode
temp=$(cat /sys/class/thermal/thermal_zone0/temp)
echo "Temperature:${temp}"