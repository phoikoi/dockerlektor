lektor () {
    if [ ! -z "$1" ]; then
        cmd="$1"
        shift
        case $cmd in
        build)
            docker run -it --rm -v $PWD:/site lektor build
            ;;
        server)
            docker run -it --rm -v $PWD:/site -p 5000:5000 lektor server $*
            ;;
        *)
            docker run -it --rm -v $PWD:/site lektor $cmd $*
            ;;
        esac
    fi
}

export lektor

