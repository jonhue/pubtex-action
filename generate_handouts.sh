#!/bin/bash

handouts=""

for slides in "$@"
do
  echo "generating handout for $slides"

  handout=${slides:0:-4}_handout.tex
  cp $slides $handout
  sed -i "1s/.*/\\\\documentclass\[handout\]\{beamer\}/" $handout

  if [[ $handouts = "" ]]
  then
    handouts=handout
  else
    handouts=$handouts$'\n'$handout
  fi
done

# # trim whitespace
# handouts=$handouts | xargs

echo "$handouts"
echo ::set-output name=handouts::$handouts
