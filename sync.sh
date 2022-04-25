#/bin/bash

sudo apt update && sudo apt -y install openssh-client
eval $(ssh-agent -s)
echo "$DEPLOY_KEY" | tr -d '\r' | ssh-add - > /dev/null
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan gitlab.com >> ~/.ssh/known_hosts
ssh-keyscan github.com >> ~/.ssh/known_hosts
chmod 644 ~/.ssh/known_hosts
git push "$@" master