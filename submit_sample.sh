#!/bin/bash


EGA_TOKEN=$1
PROJECT=$2

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


cd $DIR

echo prepare the sample sheet
cd $PROJECT/sample
STSV=`ls|grep tsv`
ega_sub --auth "$EGA_TOKEN" prepare sample $STSV

echo submit the sample sheet
SXML=`ls|grep xml`
ega_sub --auth "$EGA_TOKEN" submit sample $SXML

echo check the sample information into GIT
git checkout master
git pull
git add .
git commit -m "submit the sample sheet for $PROJECT"

git push

cd $DIR
