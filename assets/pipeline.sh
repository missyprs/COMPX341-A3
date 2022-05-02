#!/bin/sh
if [[ -z $1 ]]
then
  echo "please input a commit message"
  exit 2
fi

echo "running npm commands"
#run the npm install
npm install
#then run the npm build to make sure that it compiles
npm run build

cd ../
git add .
git commit -m $1
git push origin main
git status

echo $1 "done"
#then run the start
#npm run start