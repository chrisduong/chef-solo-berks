#!/bin/bash
set -e

# Vendor cookbooks
cd /chef

/opt/chef/embedded/bin/berks vendor /etc/chef/cookbooks

if [ -e /chef/solo.json ] && [ -e /chef/solo.rb ]; then
	exec chef-solo -c /chef/solo.rb -j /chef/solo.json
fi