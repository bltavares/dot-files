export POCKET_CACHE=~/.pickpocket_cache

if which hs > /dev/null 2>&1; then
  export FUZZY_FINDER="hs -F"
elif which selecta > /dev/null 2>&1; then
  export FUZZY_FINDER=selecta
fi

pocket-star() {
  pickpocket-batch-favorite ~/star $POCKET_CACHE
}

pocket-read() {
  pickpocket-batch-read ~/read $POCKET_CACHE
}

pocket-add() {
  pickpocket-batch-add ~/add $POCKET_CACHE
  echo "Sync..." >&2
  pocket-download
}

pocket-inspect() {
  pickpocket-inspect $POCKET_CACHE
}

pocket-download() {
  pickpocket-download $POCKET_CACHE
}

pocket-search() {
  pocket-inspect | bash -c $FUZZY_FINDER
}

pocket-video-download-unread() {
  pocket-video-download "Unread"
}

pocket-video-download-read() {
  pocket-video-download "Read"
}

pocket-video-download() {
    target="$HOME/pocket-videos/$1"
    mkdir -p $target

(
    cd $target
    pocket-inspect | grep 'youtube.com/watch' | grep "$1\$"| awk -F ' \\| http' '{ print "http"$2 }' | xargs -L 4 -P 4 youtube-dl --no-playlist --write-sub --sub-lang en
)
}

pocket-docs-download-unread() {
  pocket-docs-download "Unread"
}

pocket-docs-download-read() {
  pocket-docs-download "Read"
}

pocket-docs-download() {
    target="$HOME/pocket-docs/$1"
    mkdir -p $target

(
    cd $target
    pocket-inspect | grep '.pdf' | grep "$1\$"| awk -F ' \\| http' '{ print "http"$2 }' | xargs -L 4 -P 4 wget -nc
)
}

pocket-video-entries() {
    target="$HOME/pocket-videos/$1"
    [ ! -d "$target" ] && echo $target does not exist && return 1

    list="$(pocket-inspect)"

    for f in $target/*; do
        (echo $f | grep -q '.vtt$') && continue
        id="$(echo $f | rev | cut -d- -f 1 | rev | cut -d. -f 1)"
        echo $list | grep 'youtube.com/watch' | grep "$id"
    done
}

pocket-video-urls() {
    target="$1"

    pocket-video-entries $target | awk -F ' \\| http' '{ print "http"$2 }'
}

pocket-video-sync() {
    pocket-video-urls tosync >> ~/read
    mv $HOME/pocket-videos/tosync/* $HOME/pocket-videos/Read
}

pocket-reset() {
  : > ~/read > ~/star > ~/add
}
