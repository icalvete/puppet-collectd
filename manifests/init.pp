class collectd (

  $amqp_enabled  = false,
  $amqp_host     = $collectd::params::amqp_host,
  $amqp_port     = $collectd::params::amqp_port,
  $amqp_vhost    = $collectd::params::amqp_vhost,
  $amqp_user     = $collectd::params::amqp_user,
  $amqp_password = $collectd::params::amqp_password,
  $amqp_exchange = $collectd::params::amqp_exchange,

) inherits collectd::params {

  anchor {'collectd::begin':
    before => Class['collectd::install']
  }
  class {'collectd::install':
    require => Anchor['collectd::end']
  }
  class {'collectd::config':
    require => Class['collectd::install']
  }
  class {'collectd::service':
    subscribe => Class['collectd::config']
  }
  anchor {'collectd::end':
    before => Class['collectd::service']
  }
}
