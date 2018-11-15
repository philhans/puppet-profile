class profile::nginx (
  Array $vhosts,
) {
  include ::nginx
  
  $vhosts.each |$vhosts| {
    ::nginx::vhost { $facts['fqdn']:
      port           => $vhost['port'],
      server_aliases => $vhost['server_aliases'], 
    }
  }
}
