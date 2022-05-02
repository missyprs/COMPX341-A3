#!/bin/sh
if [[ -z $1 ]]
then
  echo "please input a commit message"
  exit 2
fi

S="$*"

echo "running npm commands"
#run the npm install
npm install
#then run the npm build to make sure that it compiles
npm run build

cd ../
git add .
git commit -m S
git push origin main
git status

echo $S
#then run the start
#npm run start