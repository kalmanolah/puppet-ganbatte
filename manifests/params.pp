# == Class: ganbatte::params
#
# Contains the default parameters for the ganbatte class.
#
# === Authors
#
# Kalman Olah <hello@kalmanolah.net>
#
# === Copyright
#
# Copyright 2013 Kalman Olah, unless otherwise noted.
#
class ganbatte::params {

  $apache_user = $::osfamily ? {
    'Debian'  => 'www-data',
    'FreeBSD' => 'www',
    default   => 'apache',
  }

  $site_name        = 'Ganbatte!'
  $site_description = 'A simple monitoring panel for Jenkins CI jobs.'
  $site_author      = 'Kalman Olah'
  $site_keywords    = 'jenkins, continuous integration, ganbatte'

  $jenkins_cache_timer = 10

  $dashboard_refresh_interval  = 15
  $dashboard_progress_interval = 15

}
