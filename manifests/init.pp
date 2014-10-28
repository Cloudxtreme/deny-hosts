
class deny-hosts inherits denyhosts
{

  ## temp fix until puppetlabs/denyhosts fixes the option patch-01
  file { '/etc/denyhosts/denyhosts.cfg':
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('denyhosts/denyhosts.conf.erb'),
    notify  => Service['denyhosts'],
  }
  
}

