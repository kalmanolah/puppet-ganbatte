# == Class: ganbatte
#
# The main ganbatte class.
#
# === Authors
#
# Kalman Olah <hello@kalmanolah.net>
#
# === Copyright
#
# Copyright 2013 Kalman Olah, unless otherwise noted.
#
class ganbatte (
  $document_root               = undef,
  $jenkins_location            = undef,
  $jenkins_api_user            = undef,
  $jenkins_api_token           = undef,
  $jenkins_cache_timer         = $ganbatte::params::jenkins_cache_timer,
  $dashboard_refresh_interval  = $ganbatte::params::dashboard_refresh_interval,
  $dashboard_progress_interval = $ganbatte::params::dashboard_progress_interval,
  $apache_user                 = $ganbatte::params::apache_user,
  $site_name                   = $ganbatte::params::site_name,
  $site_description            = $ganbatte::params::site_description,
  $site_author                 = $ganbatte::params::site_author,
  $site_keywords               = $ganbatte::params::site_keywords,
) {
  include ganbatte::params

  $config_file = "${ganbatte::document_root}/config/config.yml"

  # Make sure certain dirs exist and are writeable
  file { [
    $ganbatte::document_root,
    "${ganbatte::document_root}/config",
    "${ganbatte::document_root}/cache",
    "${ganbatte::document_root}/cache/twig",
    "${ganbatte::document_root}/cache/jenkins"]:
    ensure => 'directory',
    owner  => $ganbatte::apache_user,
    group  => $ganbatte::apache_user,
    mode   => '0755',
  }

  include ganbatte::config
}
