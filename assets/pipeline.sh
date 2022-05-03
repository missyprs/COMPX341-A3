#!/bin/sh
if [[ -z $1 ]]
then
  echo "please input a commit message"
  exit 2
fi
#set the S variable to the commit message
S="$*"

echo "running npm commands"
#run the npm install
npm install
#then run the npm build to make sure that it compiles
npm run build
E="$?"

#if the run build exits with a code other than 0
echo $E #this tells me what code the build exited with.  if it is more than 0 there was a compile error

if [[ "$E" -eq "0" ]]
then
  echo "no compile error"
  cd ../
  git add .
  git commit -m "$S"
  git push origin main
  git status
else
  echo "compile error"
  exit 1
fi

#echo $S
#then run the start
npm run start