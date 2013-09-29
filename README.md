#puppet-collectd

Puppet manifest to install and configure collectd

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-collectd.png)](http://travis-ci.org/icalvete/puppet-collectd)

##Actions:

* Works in Debian|Ubuntu|RedHat|CentOS
* Install and configure [collectd](https://collectd.org/)
* Output plugins:
  + [Write_Graphite](https://collectd.org/wiki/index.php/Plugin:Write_Graphite)
  + or [AMQP](https://collectd.org/wiki/index.php/Plugin:AMQP)

##Requires:

* [hiera](http://docs.puppetlabs.com/hiera/1/index.html)

##Examples

Write_Graphite is default output, for amqp...

    class {'collectd':
      amqp_enabled => true
    }


##Authors:

Israel Calvete Talavera <icalvete@gmail.com>
