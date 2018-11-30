#testing git
node default { 
file  {'/etc/motd':
path => '/etc/motd',
ensure => 'present',
content => 'puppet testing servers',
}
file {'create file':
path => '/home/manu.txt',
ensure => 'present',
source => '/root/manu.txt'
}
package {'httpd':
ensure => 'installed',
}
service {'httpd':
ensure => 'running',
enable => 'true',
}
class {'puppi':
}
class {'mysql':
}

file {'disk size':
path => '/home/ma.sh',
ensure => 'present',
content => '/bin/df -h 
sar -q ',
mode => '644',
owner => 'root',
group => 'root',
}
cron {'disk check':
ensure => 'present',
command => '/bin/sh /home/ma.sh',
target => 'root',
user => 'root',
minute => '45',
hour => '1', 
}

exec {'yum update':
command => 'yum update -y',
onlyif =>['test -f /etc/yum.conf'],
user => 'root',
group => 'root',
cwd => '/root',
path => ['/bin'],
}

group {'odin':
ensure => 'present',
gid => '1050',
allowdupe => 'no',
}
}
