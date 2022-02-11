#!/bin/bash

handouts=""

for slides in $1
do
  echo "generating handout for $slides"

  handout=${slides%.tex}_handout.tex
  sudo cp $slides $handout
  sudo sed -i "1s/.*/\\\\documentclass\[handout\]\{beamer\}/" $handout

  if [[ $handouts = "" ]]
  then
    handouts=$handout
  else
    printf -v handouts '%s\n%s' "$handouts" "$handout"
  fi
done

echo "$handouts"
echo ::set-output name=handouts::$handouts
