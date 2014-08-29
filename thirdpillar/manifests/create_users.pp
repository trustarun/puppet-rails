class thirdpillar::create_users {
    user { 'melbourne':
      home => '/home/melbourne',
    ensure => 'present',
      comment => 'sudo user',
      gid => 'sudo',
      shell => '/bin/bash',
    }
  }
