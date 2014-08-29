class thirdpillar::build_mysql(
    $mysql_password = 'thirdpilar15lp',
    $maximum_connections = '1024',
  ){
    class { '::mysql::server':
        root_password    => "${mysql_password}",
        override_options => { 'mysqld' => { 'max_connections' => "${maximum_connections}" } },
      }
    }
