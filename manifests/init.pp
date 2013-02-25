class redis {

  package { "redis2610":
  }

  file { "/etc/redis/":
    ensure => "directory",
    owner  => "root",
    group  => "root",
  }

  file { "/var/lib/redis/":
    ensure => "directory",
    owner  => "root",
    group  => "root",
  }

  file { "/etc/redis/redis.conf":
    mode    => "0644",
    source  => "puppet:///modules/redis/redis.conf",
    require => [File["/etc/redis/"], Package["redis2610"]],
    owner   => "root",
    group   => "root",
  }

  file { "/etc/init.d/redis-server":
    mode   => "0755",
    source => "puppet:///modules/redis/redis-server"
    owner  => "root",
    group  => "root",
  }

  exec { "redis-config-startup":
    command   => "/sbin/chkconfig --add redis-server; /sbin/chkconfig --level 345 redis-server on; /sbin/service redis-server start",
    logoutput => true,
    timeout   => 1800,
    require   => [File["/etc/init.d/redis-server"], File["/etc/redis/redis.conf"], File["/var/lib/redis/"]],
  }
}
