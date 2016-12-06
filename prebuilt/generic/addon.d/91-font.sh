#!/sbin/sh
#
# Script: /system/addon.d/91-font.sh
# This addon.d script will make your custom font survive a dirty flash:

. /tmp/backuptool.functions

list_files() {
cat << EOF
fonts/DroidSansFallback.ttf
fonts/Roboto-Black.ttf
fonts/Roboto-BlackItalic.ttf
fonts/Roboto-Bold.ttf
fonts/Roboto-BoldItalic.ttf
fonts/Roboto-Italic.ttf
fonts/Roboto-Light.ttf
fonts/Roboto-LightItalic.ttf
fonts/Roboto-Medium.ttf
fonts/Roboto-MediumItalic.ttf
fonts/Roboto-Regular.ttf
fonts/Roboto-Thin.ttf
fonts/Roboto-ThinItalic.ttf
fonts/RobotoCondensed-Bold.ttf
fonts/RobotoCondensed-BoldItalic.ttf
fonts/RobotoCondensed-Italic.ttf
fonts/RobotoCondensed-Light.ttf
fonts/RobotoCondensed-LightItalic.ttf
fonts/RobotoCondensed-Regular.ttf
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
