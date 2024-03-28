rtw() {
  t timeline -l | awk "FNR==$1{ print \$1}" | xargs t retweet
}
genpasswd() {
  grep "^[^'A-Z]\{3,7\}$" /usr/share/dict/words | shuf -n4 | tr '\n' ' ' | sed 's/\b\(.\)/\u\1/g' | sed 's/ //g'
}

camelize() {
  read phrases
  echo -e "$phrases" | perl -pe 's/\b(.)/\u\1/g' | sed 's/ //g'
}

switch-branch() {
  git branch | cut -c 3- | hs | xargs git checkout
}

checkout-branch() {
  if [ -z "$1" ] || git remote | grep -q $1; then
    branch=${1:-origin}
    git branch -r | grep "$branch/" | cut -d'/' -f 2- | hs | xargs -I{} git checkout -b '{}' $branch/'{}'
  else
    git checkout -b "$1" origin/"$1"
  fi
}

p() { cd $(find ~/dev/* ~/repos -type d -maxdepth 1 | hs); }

function say {
  lang=${2:-en}
  mplayer -really-quiet "http://translate.google.com/translate_tts?tl=$lang&q=$1"
}

function tim {
  tags
  vim
}

docker-run() {
  docker run --rm -i -t -v $(pwd):/data/src -w /data/src "$@"
}

docker-cleanup() {
  containers="$(docker ps -q -a)"

  if [ -z $containers ]; then
    echo "No containers to cleanup" && return 1
  fi

  xargs docker rm <<<"$containers"
}

docker-info() {
  containers="$(docker ps -q)"

  if [ -z $containers ]; then
    echo "No containers running" && return 1
  fi

  xargs docker inspect \
    --format='{{.Config.Image}}, {{.NetworkSettings.IPAddress}}, {{range $p, $conf := .NetworkSettings.Ports}} {{$p}} -> {{(index $conf 0).HostPort}} {{end}}' \
    <<<"$containers"
}

dockerize() {
  alias lein='docker-run -p 9797 bltavares/clojure lein'
  alias ghci='docker-run zsol/haskell-platform-2013.2.0.0 ghci'
  go() {
    docker-run bltavares/go "go $@"
  }
  gofmt() {
    docker-run bltavares/go "gofmt $@"
  }
  godoc() {
    docker-run bltavares/go "godoc $@"
  }
}

my-pass() {
  PASSWORD_STORE_DIR=${PASSWORD_STORE_DIR:-~/repos/passwords} pass $@
}

use-env() {
  if [[ -z $1 ]]; then
    if [[ -f flake.nix ]]; then
      if nix develop --command zsh; then
        return 0
      else
        export name='none'
      fi
    fi
    if [[ -f Cargo.toml ]]; then
      exec nix develop ~/repos/dot-files#rust --profile ~/.cache/nix/dotfiles-rust --command zsh
    fi
    if [[ -f deps.edn || -f project.clj ]]; then
      exec nix develop ~/repos/dot-files#clojure --profile ~/.cache/nix/dotfiles-clj --command zsh
    fi
  else
    nix develop ~/repos/dot-files#"$1" --profile ~/.cache/nix/dotfiles-"$1" --command zsh
  fi
}
