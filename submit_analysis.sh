#!/bin/bash


EGA_TOKEN="'$1'"
PROJECT=$2

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd $DIR
cd $PROJECT/analysis_alignment.PCAWG_WGS_BWA

ANALYSIS='analysis'
echo make subfolder analysis when not exist
mkdir -p $ANALYSIS

echo prepare the analysis xml
ega_sub --auth $EGA_TOKEN prepare analysis GNOS_xml

echo submit the analysis 
ega_sub --auth $EGA_TOKEN submit analysis analysis

echo check the analysis information into GIT
git checkout master
git pull
git add .
git commit -m "submit the analysis for $PROJECT"
git push

cd $DIR