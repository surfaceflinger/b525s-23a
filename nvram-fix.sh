#!/usr/bin/env bash
pushd usbdload
balong_usbdload -f -t ptable-11.1xx.bin usblsafe_b525.bin
popd

partitions=(
  "m3boot"
  "fastboot"
  "fastbootbk"
  "nvbacklte"
  "nvimg"
  "nvdload"
  "nvsys"
  "kernel"
  "kernelbk"
  "dts"
  "dtsbk"
  "m3image"
  "m3imagebk"
  "teeos"
  "userdata"
  "online"
  "modem_fw"
  "hifi"
  "wbdata"
  "reserve3"
  "om"
  "app"
  "webui"
  "system"
  "teeosbk"
)

# theres also nvdefault and oeminfo but we don't wipe it woaaah

for partition in "${partitions[@]}"
do
  fastboot erase "$partition"
done

echo "You will need to powercycle the router now, it's safe - ofc reboot with the two pins shorted to get into the dfu and install either stock or mod :)"
