awsvl() {
  if [[ $# -eq 0 ]]; then
    local TOKEN="$(aws-vault list | grep '\-vault' | cut -d' ' -f1| fzf | xargs aws-vault login -d 1h -s)"
  else
    local TOKEN="$(aws-vault login -d 1h -s $@)"
  fi

  if [[ $TOKEN =~ "signin.aws.amazon.com" ]]; then
    local data=$(mktemp -d -t google-chrome-XXXXXX)
    open -na "Google Chrome" --args \
     --no-first-run \
     --user-data-dir="$data" \
    --load-extension='~/.aws/chrome-color-helper/' \
     $TOKEN
    rm -rf "$data"
  else
    echo "$TOKEN"
  fi
}

rmbranches(){
    git branch -D  $(git branch | grep -v "\(\*\|main\|master\|staging\|production\)")
}

sshls(){
  for key in ~/.ssh/id_*; do ssh-keygen -l -f "${key}"; done | uniq
}

tameouvindo() {
  sudo lsof -iTCP -sTCP:LISTEN
}

myip(){
#  curl -s https://ipinfo.io/json | jq .ip | sed -e 's/\"//g' | pbcopy
#  curl -s https://httpbin.org/ip | jq .origin | sed -e 's/\"//g' | pbcopy
  curl -s https://httpbin.org/ip | jq .origin | xargs | pbcopy
}

