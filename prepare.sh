#!/bin/sh
echo "Cloning tempest";
git clone https://github.com/Open-Weeb-Repository/tempest.git tempest
echo "Cloning rimuru";
git clone https://github.com/Open-Weeb-Repository/rimuru.git rimuru
echo "Cloning diablo";
git clone https://github.com/Open-Weeb-Repository/diablo.git diablo

echo "Preparing tempest"
cd tempest
npm install
npm run build
cd ..

echo "Preparing rimuru"
cd rimuru
npm install
npm run build
cd ..

echo "Preparing diablo"
cd diablo
npm install
npm run build
cd ..

echo "Installing pm2"
npm install pm2