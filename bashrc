alias wgetr='wget -r --no-parent --reject "index.html*" -nd'

gradle() {
    _gradle "$(pwd)" "$@"
}

_gradle() {
    local dir="$1"
    shift
    if [[ -x "$dir/gradlew" ]]; then
        echo "running from $dir with $@" 
        (cd "$dir" && ./gradlew "$@")
    elif [[ "$dir" = "/" ]]; then
        echo "No gradlew found"; return 1;
    else 
        _gradle "$(readlink -f "$dir/..")" "$@"
    fi
}

export PATH="$HOME/bin":"$HOME/.cabal/bin":$PATH
export SVTHOME="$HOME/rfs"
