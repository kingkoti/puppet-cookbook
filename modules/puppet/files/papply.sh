#!/bin/sh
sudo puppet apply /home/ec2-user/puppet-cookbook/manifests/site.pp --modulepath=/home/ec2-user/puppet-cookbook/modules/ $*
