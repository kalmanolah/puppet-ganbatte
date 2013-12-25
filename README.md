puppet-ganbatte
===============

This is a Puppet module for managing [Ganbatte](https://github.com/kalmanolah/ganbatte), the Jenkins build monitor.
Aside from managing the configuration file, this module doesn't do much to be honest.

Usage
-----

First, include the main class.

```puppet
class { 'ganbatte':
  document_root     => '/var/vhosts/ganbatte/htdocs',
  jenkins_location  => 'https://jenkins.example.com',
  jenkins_api_user  => 'monitoring_user',
  jenkins_api_token => '7h15154n4p1k3y',
}
```

Next, add a page (NOT optional).

```puppet
ganbatte::page { 'My First Page':
  image => 'https://github.global.ssl.fastly.net/images/modules/logos_page/GitHub-Logo.png',
  items =>
  [
    {
      name => 'The First Pipeline!',
      jobs =>
      [
        {
          name    => 'first-example-job',
        },
        {
          name    => 'first-example-job-unittests',
          trigger => 'first-example-job',
        },
      ],
    },
    {
      name => 'The Second Pipeline!',
      jobs =>
      [
        {
          name    => 'second-example-job',
        },
        {
          name    => 'second-example-job-unittests',
          trigger => 'second-example-job',
        },
      ],
    },
  ],
}
```

There are a few more arguments you can pass to the types/classes.
Please check out the manifests if you're interested.

License
-------

MIT, though few people care. See [LICENSE](LICENSE).

Contact
-------

Kalman Olah on [Github](https://github.com/kalmanolah), [Twitter](https://twitter.com/KalmanOlah), [Google+](https://plus.google.com/+KalmanOlah1) or on [kalmanolah.net](http://kalmanolah.net).