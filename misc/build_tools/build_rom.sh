#!/bin/bash
start_time=`date +'%d/%m/%y %H:%M:%S'`

echo "."
echo "."
echo "."
echo "-----------------------------------------------------------------------------"
echo "Setting up environment to build AOSP"
echo "-----------------------------------------------------------------------------"

cd /home/yank555-lu/android/git/AOSP
rm out/target/product/*/system/build.prop
source build/envsetup.sh
croot

if [ "$1" = "shamu" ]; then
   lunch aosp_shamu-userdebug
else if [ "$1" = "hammerhead" ]; then
   lunch aosp_hammerhead-userdebug
else if [ "$1" = "flo" ]; then
   lunch aosp_flo-userdebug
else if [ "$1" = "angler" ]; then
   lunch aosp_angler-userdebug
else if [ "$1" = "flounder" ]; then
   lunch aosp_flounder-userdebug
else if [ "$1" = "bullhead" ]; then
   lunch aosp_bullhead-userdebug
else
   echo "-----------------------------------------------------------------------------"
   echo "Unsupported device '$1', stopping ..."
   echo "-----------------------------------------------------------------------------"
   exit
fi
fi
fi
fi
fi
fi

echo "-----------------------------------------------------------------------------"
echo "Building AOSP for $1"
echo "-----------------------------------------------------------------------------"

make -j `getconf _NPROCESSORS_ONLN` dist

echo "Started  : $start_time"
echo "Finished : `date +'%d/%m/%y %H:%M:%S'`"

AOSP_TARGET_PACKAGE="out/target/product/$1/YAOSP-$1-`grep ro.build.version.release= out/target/product/$1/system/build.prop | awk -F= '{print $2;}'`-`grep ro.build.id= out/target/product/$1/system/build.prop | awk -F= '{print $2;}'`-`date +'%Y%m%d'`.zip"

if [ -e out/dist/aosp_$1-ota-eng.$USER.zip ]; then

   echo
   echo "-----------------------------------------------------------------------------"
   echo "Package complete for $1"
   echo "-----------------------------------------------------------------------------"

   ln -f out/dist/aosp_$1-ota-eng.$USER.zip $AOSP_TARGET_PACKAGE

   echo

   md5sum $AOSP_TARGET_PACKAGE

   echo

   exit

fi

   echo
   echo "-----------------------------------------------------------------------------"
   echo "Package for $1 - Not completed due to errors"
   echo "-----------------------------------------------------------------------------"

