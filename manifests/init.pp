
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


  ## ensure that we set the default config from /etc/denyhosts/denyhosts.cfg
  ## to /etc/denyhosts.conf
  file { '/etc/denyhosts.conf':
    ensure => 'link',
    target => '/etc/denyhosts/denyhosts.cfg',
  }

  
}

