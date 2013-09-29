class collectd::config {

  file {$collectd::params::collectd_config_dir:
    ensure => directory
  }

  file {'collectd_config_file':
    ensure  => present,
    path    => "$collectd::params::collectd_config_dir/collectd.conf",
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/collectd.conf.erb"),
    require => File[$collectd::params::collectd_config_dir]
  }
}
