#!/bin/bash

wget https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.3/spiff_linux_amd64.zip -O /tmp/spiff.zip
sudo unzip -d /usr/local/bin /tmp/spiff.zip && rm /tmp/spiff.zip

wget http://go-cli.s3-website-us-east-1.amazonaws.com/releases/v6.6.1/cf-linux-amd64.tgz -O /tmp/cf.tgz
sudo tar -C /usr/local/bin -zxf /tmp/cf.tgz && rm /tmp/cf.tgz && sudo chown root:root /usr/local/bin/cf
