play() {
  dir="~/Music/iTunes/iTunes Media/Music"
  find $dir -type f -iregex ".*$1.*" | while read -r file; do
    FIELDS=(${(s:/:)file#$dir/})
    echo
    echo 'Playing...'
    echo
    echo "    Artist: $FIELDS[1]"
    echo "    Album:  $FIELDS[2]"
    echo "    Song:   $FIELDS[3]"
    afplay $file
  done
}
