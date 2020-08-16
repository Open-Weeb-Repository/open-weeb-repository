#!/bin/sh
clone_repo()
{
    if [ ! -d "$2" ]; then
        # directory not exist
        git clone $1 $2
    else
        # directory exist
        cd $2
        git pull
        cd ..
    fi
}

prepare_app()
{
    cd $1
    npm install
    npm run build
    cd ..
}

# Clone all required repo
clone_repo https://github.com/Open-Weeb-Repository/tempest.git tempest
clone_repo https://github.com/Open-Weeb-Repository/rimuru.git rimuru
clone_repo https://github.com/Open-Weeb-Repository/diablo.git diablo

prepare_app tempest
prepare_app rimuru
prepare_app diablo

echo "Installing pm2"
npm install pm2

echo "Starting Open-Weeb-Repository"
./node_modules/.bin/pm2 start