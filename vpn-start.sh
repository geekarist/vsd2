#!/bin/bash

set -eux

cd /vagrant/Netherlands-UDP.tblk

openvpn --config Netherlands-UDP.ovpn
