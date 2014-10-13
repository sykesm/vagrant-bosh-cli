Vagrant.configure('2') do |config|

  config.vm.define "cli" do |cli|
      cli.vm.box = 'hashicorp/precise64'
      cli.vm.provision :shell, privileged: true,  inline: $APT
      cli.vm.provision :shell, privileged: false, inline: $RUBY
      cli.vm.provision :shell, privileged: false, inline: $CF
  end

  config.vm.define "bosh-lite" do |bosh|
      bosh.vm.box = 'cloudfoundry/bosh-lite'
      bosh.vm.provision :shell, privileged: false, inline: $ROUTE, run: :always
  end

end

$APT = <<-APT_EOF
apt-get -y update
apt-get -y clean

apt-get install -y build-essential git curl unzip
APT_EOF

$RUBY= <<-RUBY_EOF
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
RUBY_EOF

$CF = <<-CF_EOF
gem install bosh_cli --no-ri --no-rdoc

wget https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.3/spiff_linux_amd64.zip -O /tmp/spiff.zip
sudo unzip -d /usr/local/bin /tmp/spiff.zip && rm /tmp/spiff.zip

wget http://go-cli.s3-website-us-east-1.amazonaws.com/releases/v6.6.1/cf-linux-amd64.tgz -O /tmp/cf.tgz
sudo tar -C /usr/local/bin -zxf /tmp/cf.tgz && rm /tmp/cf.tgz && sudo chown root:root /usr/local/bin/cf

mkdir ~/workspace
cd ~/workspace

git clone https://github.com/cloudfoundry/cf-release.git
git clone https://github.com/cloudfoundry/bosh-lite.git
cd ~/workspace/cf-release
./update || true
CF_EOF

$ROUTE = <<-ROUTE_EOF
echo You may have to run this in a command prompt with elevated administrator privileges:
echo   route add 10.244.0.0/19 192.168.50.4
ROUTE_EOF
