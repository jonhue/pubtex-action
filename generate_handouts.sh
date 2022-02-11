#!/bin/bash

pwd
echo $GITHUB_ENV

handouts=""

for slides in "$@"
do
  echo "generating handout for $slides"

  handout=${slides:0:-4}_handout.tex
  cp $slides $handout
  sed -i "1s/.*/\\\\documentclass\[handout\]\{beamer\}/" $handout

  handouts="$handouts $handout"
done

echo ::set-output name=handouts::$handouts
