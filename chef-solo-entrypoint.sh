#!/bin/bash
set -e

# Vendor cookbooks
cd /chef

/opt/chef/embedded/bin/berks vendor /etc/chef/cookbooks

if [ -e /chef/solo.json && -e /chef/solo.rb]
	exec chef-solo -c solo.rb -j solo.json
fi