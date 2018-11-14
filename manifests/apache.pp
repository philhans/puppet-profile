class profile::apache (
  Boolean $default_vhost = false,
  Integer $port          = 80,
  String $docroot        = '/var/www/test',
) {
  class { '::apache':
    default_vhost => $default_vhost,
  }
  ::apache::vhost { 'philhansen1.mylabserver.com':
    port    => $port,
    docroot => $docroot, 
  }
  file { 'index.html':
    ensure  => file,
    name    => "${docroot}/index.html",
    content => '<html><body>Blah</body></html>',
  }
}
