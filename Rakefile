SSH = 'ssh -A -i /root/edureka-16sep2015.pem -l ec2-user'
desc "Run Puppet on ENV['CLIENT']"
task :apply do
	client = ENV['CLIENT']
	sh "git push"
	sh "#{SSH} #{client} pull-updates"
end 
