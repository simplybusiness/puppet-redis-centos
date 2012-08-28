class redis{
	file { "/tmp/redis/redis-2.4.16":
	    ensure=>"directory"
	}

	exec{'redis-download-install':
	  command=>"wget --no-check-certificate -r -P /tmp/redis http://redis.googlecode.com/files/redis-2.4.16.tar.gz; tar -xzf /tmp/redis/redis.googlecode.com/files/redis-2.4.16.tar.gz -C /tmp/redis/redis-2.4.16; make -C /tmp/redis/redis-2.4.16; make install -C /tmp/redis/redis-2.4.16",
	  creates=>'/usr/local/bin/redis-server',
	  logoutput=>true,
	  timeout=>1800,
	  require=>Package['make', 'gcc', 'wget']
	}
}