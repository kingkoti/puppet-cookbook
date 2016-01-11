class puppet {
	file { '/usr/local/bin/papply':
		source => 'puppet:///modules/puppet/papply.sh',
		mode => '0755',
	}
	
	file { '/usr/local/bin/pull-updates':
		source => 'puppet:///modules/puppet/pull-updates.sh',
		mode => '0755',
	}
	
	file { '/home/ec2-user/.ssh/id_rsa':
		source => 'puppet:///modules/puppet/pup-cook-ec2.priv',
		owner => 'ec2-user',
		mode	=>	'0600',
	}
	
	cron { 'run-puppet':
		ensure	=>	'present',
		user	=> 	'ec2-user',
		command	=>	'/usr/local/bin/pull-updates',
		minute	=> 	'*/10',
		hour	=> 	'*',
	}
}
