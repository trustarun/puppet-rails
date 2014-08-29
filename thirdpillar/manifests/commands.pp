class thirdpillar::commands(
    $run_command = true,
    $rvm_cmd_path = [ "/usr/local/rvm/bin", "/usr/local/rvm/gems/ruby-1.9.3-p547@global/bin",
      "/usr/local/rvm/gems/ruby-1.9.3-p547/bin", "/usr/local/rvm/rubies/ruby-1.9.3-p547/bin"],
  ) inherits thirdpillar::params {

    if $run_command{

        Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/rvm/bin", 
            "/usr/local/rvm/gems/ruby-1.9.3-p547@global/bin",
            "/usr/local/rvm/gems/ruby-1.9.3-p547/bin", "/usr/local/rvm/rubies/ruby-1.9.3-p547/bin"] }

        exec { "run_bundle_install":
          command => "rvm use melbourne && bundle install --deployment --without production test devlopment",                        
          cwd => $project_path,
          timeout     => 100000,
          before => Exec["remove_database_symlink"],
        }

        exec { "remove_database_symlink":
          command => "rm database.yml",
          cwd => "${project_path}/config",
          onlyif => ["test -f /var/www/melbourne/config/database.yml"],
          before => Exec["create_database_symlink"],

        }

        exec { "create_database_symlink":
          command => "ln -s /var/www/shared/database.yml /var/www/melbourne/config/database.yml",
          before => Exec["create_database"],
        }

        exec { "create_database":
          command => "bundle exec rake db:create RAILS_ENV=staging",
          cwd => $project_path,
          before => Exec["migrate_database"],
                       
        }

        exec { "migrate_database":
          command => "bundle exec rake db:migrate RAILS_ENV=staging",
          cwd => $project_path,

        }
      }
    }

