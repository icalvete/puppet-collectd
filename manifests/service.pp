class collectd::service {

  service{$collectd::params::collectd_service:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true
  }
}
