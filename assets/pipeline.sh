#!/usr/bin/env bash

echo "(0) Preparing Pipeline"
#checks if there is a commit message
if [[ -z $1 ]]
then
  echo "Error: No Commit Message"
  exit 1
fi

echo "(1) Build (Compiling Application)"
npm install #run the npm install
npm run build #then run the npm build to make sure that it compiles
E="$?" #E holds the exit code of npm run build

#if run build exits with exit code 0
if [[ "$E" -eq "0" ]]
then #commit to git
  echo "Build Succeeded"
else
  #the exit code was not 0 so there was an error
  echo "Error: Build Failed"
  exit 1
fi

echo "(2) Release to Git"
cd ../
  git add .
  git commit -m "$1"
  git push origin main
  git status

echo "(3) Deploying Application"
#move back into the assets folder to be able to run the site
cd assets
#then run the start
npm run start