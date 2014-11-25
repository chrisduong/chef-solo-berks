# This file creates a container that supports chef-solo and berkshelf
# 
# Author: Chris Duong
# Date: 11/03/2014


FROM ubuntu:14.04
MAINTAINER ChrisD <chris.duong83@gmail.com>

# Install chef and its prerequisites
RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends \
      curl lsb-release \
      git \
      build-essential \
      libxml2-dev \
      libxslt-dev;  \
      apt-get clean; \
      rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*; \
      curl -L https://getchef.com/chef/install.sh | bash -s -- -P container
RUN echo 'gem: --no-ri --no-rdoc' > ~/.gemrc; \
 	/opt/chef/embedded/bin/gem install berkshelf; \
 	mkdir /etc/chef; \
	echo "cookbook_path \"/chef/cookbooks\" "  > /chef/solo.rb; \
 	rm -rf /tmp/* /var/tmp/*

# Prepare CHEF
WORKDIR /chef
COPY . /chef
ENTRYPOINT ["chef-solo-entrypoint.sh]
