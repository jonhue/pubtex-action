#!/bin/bash
# ${{ steps.generate-handouts.outputs.handouts }}
handouts=""

for slides in "$@"
do
  echo "generating handout for $slides"

  echo $(cat $slides)

  handout=${slides:0:-4}_handout.tex
  cp $slides $handout
  sed -i "1s/.*/\\\\documentclass\[handout\]\{beamer\}/" $handout

  handouts="$handout"
done

echo $handouts
echo ::set-output name=handouts::$handouts
