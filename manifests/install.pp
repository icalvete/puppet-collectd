class collectd::install {

  file {$collectd::params::collectd_config_dir:
    ensure => directory
  }

  file {'collectd_package':
    path   => "/tmp/${collectd::params::collectd_package}",
    source => "puppet:///modules/${module_name}/${collectd::params::so}_${collectd::params::collectd_package}",
  }

  exec {'install_collectd_package':
    cwd     => '/opt/',
    command => "/bin/tar xfz /tmp/${collectd::params::collectd_package}",
    require => File['collectd_package'],
    unless  => "/usr/bin/test -d ${collectd::params::collectd_bin_dir}"
  }

  file{ 'install_collectd_init':
    ensure  => present,
    path    => '/etc/init.d/collectd',
    content => template("${module_name}/collectd_init_${collectd::params::so}.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

}
