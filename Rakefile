SSH = 'ssh -A -l ec2-user'
#REPO = 'git@github.com:kingkoti/puppet-cookbook.git'
REPO = 'git@github.com:kingkoti/puppet-cookbook.git'

desc "Run Puppet on ENV['CLIENT']"
task :apply do
  client = ENV['CLIENT']
  sh "git push"
  sh "#{SSH} #{client} pull-updates"
end

desc "Bootstrap Puppet on ENV['CLIENT'] with hostname ENV['HOSTNAME']"
task :bootstrap do
  client = ENV['CLIENT']
  hostname = ENV['HOSTNAME'] || client
  commands = <<BOOTSTRAP
    sudo hostname #{hostname} && \
    echo #{hostname} | sudo tee /etc/hostname && \
    rm -rf puppet-cookbook && \
    git clone #{REPO} puppet-cookbook && \
    sudo puppet apply --modulepath=/home/ec2-user/puppet-cookbook/modules /home/ec2-user/puppet-cookbook/manifests/site.pp
BOOTSTRAP
  sh "#{SSH} #{client} '#{commands}'"
end
