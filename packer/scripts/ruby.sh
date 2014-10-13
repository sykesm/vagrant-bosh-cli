#!/bin/bash

cat << 'EOF' >>~/.bash_profile
export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi
EOF

curl -s https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
export PATH="${HOME}/.rbenv/bin:${PATH}"
hash -r
eval "$(rbenv init -)"

rbenv bootstrap-ubuntu-12-04
rbenv install 1.9.3-p547
rbenv global 1.9.3-p547

# Required for pre-packaging
gem install bundler --no-ri --no-rdoc
