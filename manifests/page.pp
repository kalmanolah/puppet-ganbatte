# == Type: ganbatte::page
#
# A type that adds a page to the Ganbatte configuration file.
#
# === Authors
#
# Kalman Olah <hello@kalmanolah.net>
#
# === Copyright
#
# Copyright 2013 Kalman Olah, unless otherwise noted.
#
define ganbatte::page (
  $items,
  $page_name = undef,
  $image     = undef,
  $order     = 10,
) {

  $page_title = $page_name ? {
    undef   => $name,
    default => $page_name,
  }

  concat::fragment { "ganbatte_config_fragment_page_$name":
    target  => $::ganbatte::config_file,
    content => template('ganbatte/config_page.erb'),
    order   => $order,
  }

}