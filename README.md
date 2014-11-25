# Chef Solo with Berks

This repository contains Dockerfile  for Docker's automated build published to the public Docker Hub Registry.

## Base Image
` ubuntu:12-04
`
## Usage
- Cookbook path: /etc/chef/cookbooks
- Put your recipe in solo.json

`
 docker run -v solo.json:/chef chrisduong/chef-solo-berks
`