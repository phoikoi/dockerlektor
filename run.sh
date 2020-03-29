#!/bin/bash
    if [ ! -z "$1" ]; then
        case $1 in
        build)
            pushd /site/src
            lektor build -O /site/build
            ;;
        serve)
            pushd /site/src
            lektor server -h 0.0.0.0
            ;;
        *)
            if [ -d /site/src ]; then
                pushd /site/src
            fi
            lektor $*
            ;;
        esac
    fi

