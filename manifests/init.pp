
class deny-hosts inherits denyhosts
{


  file { 'removedenyhosts':
    ensure => present,
    path    => '/usr/local/bin/removeDenyHosts',
    mode    => 0700,
    owner   => 'root',
    group   => 'root',
    content => template('deny-hosts/removeDenyHosts.erb'),
  }


  
}

