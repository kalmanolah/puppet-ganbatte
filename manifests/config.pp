# == Class: ganbatte::config
#
# Manages the Ganbatte configuration file.
#
# === Authors
#
# Kalman Olah <hello@kalmanolah.net>
#
# === Copyright
#
# Copyright 2013 Kalman Olah, unless otherwise noted.
#
class ganbatte::config {

  concat { $::ganbatte::config_file:
    owner => $::ganbatte::apache_user,
    mode  => 0644,
  }

  concat::fragment { 'ganbatte_config_fragment_main':
    target  => $::ganbatte::config_file,
    content => template('ganbatte/config_main.erb'),
    order   => 01,
  }

}
