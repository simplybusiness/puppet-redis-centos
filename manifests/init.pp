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
}