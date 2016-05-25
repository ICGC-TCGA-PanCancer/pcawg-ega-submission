#!/bin/bash


EGA_TOKEN="'$1'"
PROJECT=$2

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


cd $DIR
cd $PROJECT/analysis_alignment.PCAWG_WGS_BWA


echo prepare the dataset xml
ega_sub --auth $EGA_TOKEN prepare dataset analysis

echo submit the dataset
ega_sub --auth $EGA_TOKEN submit dataset dataset.$PROJECT\_PCAWG_WGS_BWA.xml 

echo check the dataset information into GIT
git checkout master
git pull
git add .
git commit -m "submit the dataset for $PROJECT"
git push

cd $DIR

