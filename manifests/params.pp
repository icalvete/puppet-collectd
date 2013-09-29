class collectd::params {

  $collectd_service = 'collectd'
  $collectd_package = 'collectd-5.4.0.tar.gz'
  $collectd_bin_dir = '/opt/collectd-5.4.0'

  $amqp_host        = hiera('graphite_amqp_server')
  $amqp_port        = hiera('graphite_amqp_port')
  $amqp_user        = hiera('graphite_amqp_user')
  $amqp_password    = hiera('graphite_amqp_pass')
  $amqp_vhost       = '/'
  $amqp_exchange    = 'graphite'

  $graphite_vip     = hiera('graphite_vip')
  $graphite_port    = hiera('graphite_port')

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $so                  = 'debian'
      $collectd_config_dir = '/etc/collectd'
    }
    /^(Redhat|CentOS)$/: {
      $so                  = 'redhat'
      $collectd_config_dir = '/etc'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
