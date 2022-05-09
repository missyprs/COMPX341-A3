#!/usr/bin/env bash
#checks if there is a commit message
if [[ -z $1 ]]
then
  echo "Please input a commit message"
  exit 1
fi

echo "this bash file assumes that the commit message is enclosed in double quotes \" \" if not please reset the commit message in double quotes"

npm install #run the npm install
npm run build #then run the npm build to make sure that it compiles
E="$?" #E holds the exit code of npm run build

#if run build exits with exit code 0
if [[ "$E" -eq "0" ]]
then #commit to git
  cd ../
  git add .
  git commit -m "$1"
  git push origin main
  git status
else
  #the exit code was not 0 so there was an error
  echo "There was a compile error and no commit occured"
  exit 1
fi

#move back into the assets folder to be able to run the site
cd assets
#then run the start
npm run start