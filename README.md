vagrant-bosh-cli
================

This repository contains the infrastructure necessary to build a Vagrant box capable of running the
Cloud Foundry [bosh](https://github.com/cloudfoundry/bosh) cli to create and deploy
[cf-release](https://github.com/cloudfoundry/cf-release).  The goal was to make it slightly easier
for people running Windows to get going with bosh.


## Vagrantfile

The `Vagrantfile` defines two machines: cli and bosh-lite.

### cli

The `cli` machine contains git, ruby, the bosh cli, and other miscellaneous tools required to create
a Cloud Foundry release and deploy it.  A clone of cf-release and bosh-lite are have also been made to
the default locations used by the Cloud Foundry README's.

### bosh-lite

The `bosh-lite` machine simpy uses most recent [bosh-lite](https://github.com/cloudfoundry/bosh-lite)
box that's been published by the Cloud Foundry team.

## Packer

The scripts and templates used to create the cli box are found in the packer tree.

