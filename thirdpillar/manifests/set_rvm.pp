class thirdpillar::set_rvm(
    $ruby_version = 'ruby-1.9.3-p547',
    $gemset_name  = 'ruby-1.9.3-p547@melbourne',
    $wrapper_name = "melbourne",
  ) {

    if $::osfamily == 'RedHat' {
        class { 'epel':
              before => Class['rvm'],
          }
          class { 'rvm': }

          }
        else{
            class { 'rvm': }
            }

            rvm_system_ruby {
              "${ruby_version}":
              ensure      => 'present',
              default_use => true,
            }

            rvm_gemset {
              "${gemset_name}":
              ensure  => present,
              require => Rvm_system_ruby["${ruby_version}"],
            }

            rvm_alias {
              "${wrapper_name}":
                target_ruby => "${ruby_version}",
            ensure      => present,
              require     => Rvm_system_ruby["${ruby_version}"],
            }

            rvm_wrapper {
              "${wrapper_name}":
                target_ruby => "${ruby_version}",
              prefix      => 'bootup',
            ensure      => present,
              require     => Rvm_system_ruby["${ruby_version}"],
            }

          }



