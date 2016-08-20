#!/bin/bash

nohup /vagrant/vpn-start.sh &> /vagrant/log/vpn-start.log &
nohup /vagrant/vpn-watch.sh &> /vagrant/log/vpn-watch.log &
