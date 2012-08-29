A Puppet Module for Redis built for CentOS
==========================================

Overview
--------
This is a puppet module for installing Redis server which has been built and tested on CentOS 5.8

The installation process is based on <a href="http://bit.ly/PNXiJQ" target="_blank">Elliot Burggeman's</a> installation instructions.

Usage
-----
 - Git clone this repo into your puppet modules directory
 - In your site.pp add the line: <blockquote><p>require redis</p></blockquote>