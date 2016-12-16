#!/bin/bash
start_time=`date +'%d/%m/%y %H:%M:%S'`

src_pwd="`pwd`/$1"
dst_pwd="`pwd`/$2"

echo "----------------------------------------------"
echo "Archiving non-AOSP repos"
echo "----------------------------------------------"

if [ "$1" != "" ]; then
  if [ "$2" != "" ]; then
    cd $src_pwd
    tar cvf external_busybox.tar external/busybox
#    tar cvf external_exfat.tar external/exfat
#    tar cvf external_fuse.tar external/fuse
#    tar cvf external_ntfs-3g.tar external/ntfs-3g
#    tar cvf frameworks_opt_cards.tar frameworks/opt/cards
    tar cvf kernel.tar kernel
    tar cvf manifest.tar manifest
    tar cvf packages_apps_masquerade.tar packages/apps/masquerade
#    tar cvf prebuilts_gcc_linux-x86_arm_arm-eabi-4.8.tar prebuilts/gcc/linux-x86/arm/arm-eabi-4.8
#    tar cvf prebuilts_gcc_darwin-x86_arm_arm-eabi-4.8.tar prebuilts/gcc/darwin-x86/arm/arm-eabi-4.8
#    tar cvf system_extras_su.tar system/extras/su
    tar cvf vendor.tar vendor
    mv $src_pwd/*.tar $dst_pwd
    cp $src_pwd/build_rom.sh $dst_pwd
    echo " "
    echo "Started  : $start_time"
    echo "Finished : `date +'%d/%m/%y %H:%M:%S'`"
    echo " "
    echo "Source      : $src_pwd"
    echo "Destination : $dst_pwd"
    ls -al $dst_pwd/*.tar
    exit
  fi
fi
echo "Usage: archive [source] [destination]"
