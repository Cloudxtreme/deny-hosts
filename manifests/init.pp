
class deny-hosts inherits denyhosts
{

   # this can be moved to the devops class
  file { 'removedenyhosts':
    ensure => present,
    path    => '/usr/local/bin/removeDenyHosts',
    mode    => 0700,
    owner   => 'root',
    group   => 'root',
    content => template('deny-hosts/removeDenyHosts.erb'),
  }

  ## temp fix until puppetlabs/denyhosts fixes the option patch-01
  file { '/etc/denyhosts/denyhosts.cfg':
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('denyhosts/denyhosts.conf.erb'),
    notify  => Service['denyhosts'],
  }


  
}

