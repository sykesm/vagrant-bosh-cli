#!/bin/bash

cat << 'EOF' >>~/.bash_profile
export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi
EOF

sudo -n apt-get update
sudo -n apt-get install -y libssl-dev libreadline-dev libxml2 libxml2-dev libxslt1-dev
sudo -n apt-get clean

curl -s https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
export PATH="${HOME}/.rbenv/bin:${PATH}"
hash -r
eval "$(rbenv init -)"

rbenv install 1.9.3-p547
rbenv global 1.9.3-p547

echo "gem: --no-ri --no-rdoc" > ~/.gemrc

gem install bosh_cli --no-ri --no-rdoc
gem install bundler --no-ri --no-rdoc
