A Puppet Module for Redis built for CentOS
==========================================

Overview
--------
This is a puppet module for installing Redis server which has been built and tested on CentOS 5.8

The installation process is based on [Elliot Burggeman's](http://www.ebrueggeman.com/blog/install-redis-centos-56) installation instructions.

Usage
-----
 - Git clone this repo into your puppet modules directory
 - In your site.pp add the line: <blockquote><p>require redis</p></blockquote>