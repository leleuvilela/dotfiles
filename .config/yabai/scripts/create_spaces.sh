#!/bin/sh

DESIRED_SPACES_PER_DISPLAY=5
DISPLAYS_DATA="$(yabai -m query --displays | jq -r '.[] | "\(.index):\(.spaces | @sh)"')"

DELTA=0
while read -r line
do
  DISPLAY_INDEX="$(echo "$line" | cut -d: -f1)"
  SPACES_LINE="$(echo "$line" | cut -d: -f2-)"

  LAST_SPACE="$(echo "${SPACES_LINE##* }")"
  LAST_SPACE=$(($LAST_SPACE+$DELTA))
  EXISTING_SPACE_COUNT="$(echo "$SPACES_LINE" | wc -w)"
  MISSING_SPACES=$(($DESIRED_SPACES_PER_DISPLAY - $EXISTING_SPACE_COUNT))

  if [ "$MISSING_SPACES" -gt 0 ]; then
    for i in $(seq 1 $MISSING_SPACES)
    do
      yabai -m space --create "$DISPLAY_INDEX"
      LAST_SPACE=$(($LAST_SPACE+1))
    done
  elif [ "$MISSING_SPACES" -lt 0 ]; then
    for i in $(seq 1 $((-$MISSING_SPACES)))
    do
      yabai -m space --destroy "$LAST_SPACE"
      LAST_SPACE=$(($LAST_SPACE-1))
    done
  fi
  DELTA=$(($DELTA+$MISSING_SPACES))
done <<< "$DISPLAYS_DATA"

# Rename spaces based on number of displays
DISPLAY_COUNT="$(yabai -m query --displays | jq 'length')"
DISPLAYS_INFO="$(yabai -m query --displays | jq -r '.[] | "\(.index):\(.spaces | join(" "))"')"

if [ "$DISPLAY_COUNT" -eq 2 ]; then
  # Two displays active
  DISPLAY_NUM=0
  while read -r display_line; do
    DISPLAY_NUM=$(($DISPLAY_NUM+1))
    SPACES="$(echo "$display_line" | cut -d: -f2)"
    SPACE_NUM=0
    for space in $SPACES; do
      SPACE_NUM=$(($SPACE_NUM+1))
      if [ "$DISPLAY_NUM" -eq 1 ]; then
        # First display: 1=teams, 2=whatsapp, 3=notes, rest=misc
        case $SPACE_NUM in
          1) yabai -m space "$space" --label "teams" ;;
          2) yabai -m space "$space" --label "whatsapp" ;;
          3) yabai -m space "$space" --label "notes" ;;
          *) yabai -m space "$space" --label "misc" ;;
        esac
      else
        # Second display: 1=terminal, 2=browser, rest=misc
        case $SPACE_NUM in
          1) yabai -m space "$space" --label "terminal" ;;
          2) yabai -m space "$space" --label "browser" ;;
          *) yabai -m space "$space" --label "misc" ;;
        esac
      fi
    done
  done <<< "$DISPLAYS_INFO"
else
  # Single display: 1=terminal, 2=browser, 3=teams, 4=whatsapp, 5=notes, rest=misc
  ALL_SPACES="$(yabai -m query --spaces | jq -r '.[].index')"
  SPACE_NUM=0
  for space in $ALL_SPACES; do
    SPACE_NUM=$(($SPACE_NUM+1))
    case $SPACE_NUM in
      1) yabai -m space "$space" --label "terminal" ;;
      2) yabai -m space "$space" --label "browser" ;;
      3) yabai -m space "$space" --label "teams" ;;
      4) yabai -m space "$space" --label "whatsapp" ;;
      5) yabai -m space "$space" --label "notes" ;;
      *) yabai -m space "$space" --label "misc" ;;
    esac
  done
fi

