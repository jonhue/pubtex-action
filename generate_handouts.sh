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
    handouts=$handouts$'\n'$handout
  fi
done

# escape newlines
handouts="${handouts//'%'/'%25'}"
handouts="${handouts//$'\n'/'%0A'}"
handouts="${handouts//$'\r'/'%0D'}"

echo "$handouts"
echo ::set-output name=handouts::$handouts
