#!/bin/sh

echo "running npm commands"
#run the npm install
npm install
#then run the npm build to make sure that it compiles
npm run build
#then run the start
#npm run start

echo $1
cd ../
git add .
git commit -m $1
git push origin master
got status

