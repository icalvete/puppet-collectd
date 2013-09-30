class collectd::config {

  file {'collectd_config_file':
    ensure  => present,
    path    => "${collectd::params::collectd_config_dir}/collectd.conf",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/collectd.conf.erb"),
  }
}
