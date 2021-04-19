#! /bin/bash

gacp () {
        git add -A
        if [ $# -gt 0 ]
        then
                git commit -m "$*"
        else
                git commit
        fi
        git push
}

for repo in ./*/; do
    cd $repo
    git fetch
    git checkout master
    git pull
    git submodule update --init --recursive
    git submodule update --recursive --remote
    if [[ ! -f LICENSE.txt ]]; then
        cp ../LICENSE.txt .
        gacp "Adding LICENSE.txt"
    fi
    cd ..
done
