class redis {

  package { "redis":
  }

  file { "/var/lib/redis/":
    ensure => "directory",
    owner  => "root",
    group  => "root",
  }

  file { "/etc/redis.conf":
    mode    => "0644",
    source  => "puppet:///modules/redis/redis.conf",
    require => Package["redis"],
    owner   => "root",
    group   => "root",
  }

  file { "/etc/init.d/redis-server":
    mode   => "0755",
    source => "puppet:///modules/redis/redis-server",
    owner  => "root",
    group  => "root",
  }

  service { "redis-server":
    ensure    => running,
    enable    => true,
    require   => [File["/etc/init.d/redis-server"], File["/etc/redis.conf"], File["/var/lib/redis/"]],
    subscribe => File["/etc/redis.conf"],
  }
}
