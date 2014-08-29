class melbourne{

    class{ 'thirdpillar::build_ruby':
                before => Class['thirdpillar::set_git'],
        }
    class{ 'thirdpillar::set_git':
                before => Class['thirdpillar::set_rvm'],
        }
    class{ 'thirdpillar::gem_dev_packages':
		before => Class['thirdpillar::set_rvm'],
        }
    class{ 'thirdpillar::set_rvm':
                before => Class['thirdpillar::build_mysql'],
        }
    class{ 'thirdpillar::build_mysql':
                before => Class['thirdpillar::build_passenger'],
        }
    class{ 'thirdpillar::build_passenger':
                before => Class['thirdpillar::server'],
        }
    class{ 'thirdpillar::server':
                before => Class['thirdpillar::server_addon'],
        }
    class{ 'thirdpillar::server_addon':
                before => Class['thirdpillar::commands'],
        }

    class{ 'thirdpillar::commands':

        }
  }
