Vagrant.configure('2') do |config|

  config.vm.define "cli" do |cli|
      cli.vm.box = 'sykesm/vagrant-bosh-cli'
      cli.vm.provision :shell, privileged: false, inline: $CF
  end

  config.vm.define "bosh-lite" do |bosh|
      bosh.vm.box = 'cloudfoundry/bosh-lite'
      bosh.vm.provision :shell, privileged: false, inline: $ROUTE, run: :always
  end

end

$CF = <<-CF_EOF
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
