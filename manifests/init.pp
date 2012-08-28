class redis{

	$redis_version = "2.4.16"

	file { "/tmp/redis/":
	    ensure=>"directory"
	}

	file { "/tmp/redis/redis-${redis_version}":
	    ensure=>"directory"
	}

	exec{'redis-download-install':
	  command=>"sudo wget --no-check-certificate -r -P /tmp/redis http://redis.googlecode.com/files/redis-${redis_version}.tar.gz; sudo tar -xzf /tmp/redis/redis.googlecode.com/files/redis-${redis_version}.tar.gz -C /tmp/redis; sudo make -C /tmp/redis/redis-${redis_version}; sudo make install -C /tmp/redis/redis-${redis_version}",
	  creates=>'/usr/local/bin/redis-server',
	  logoutput=>true,
	  timeout=>1800,
	  require=>Package['make', 'gcc', 'wget']
	}


	file { "/etc/redis/":
	    ensure=>"directory"
	}

	file { "/var/lib/redis/}":
	    ensure=>"directory"
	}

	exec{'redis-config-daemonize':
	  command=>"sed -e \'s/^daemonize no$/daemonize yes/\' -e \'s/^loglevel debug$/loglevel notice/\' -e \'s/^loglevel verbose$/loglevel notice/\' -e \'s/^logfile stdout$/logfile \\/var\\/log\\/redis.log/\' -e \'s/^dir \\.\\//dir \\/var\\/lib\\/redis\\//\' /tmp/redis/redis-${redis_version}/redis.conf > /etc/redis/redis.conf",
	  logoutput=>true,
	  timeout=>1800
	}
}