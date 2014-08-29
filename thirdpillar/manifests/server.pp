class thirdpillar::server(
    $site_url = "www.melbourne.com",
    $site_path = "/var/www/melbourne/public"
  ) inherits ruby::params {
    class { 'nginx':
        package_source  => 'passenger',
        http_cfg_append => {
          'passenger_root' => "${$gemhome}/passenger-4.0.48",
        },
        require => Class['passenger'],
      }

      nginx::resource::vhost { "${site_url}":
        www_root => $site_path,
        vhost_cfg_append => {
          'passenger_enabled' => 'on',
          'passenger_ruby'    => '/usr/local/rvm/rubies/ruby-1.9.3-p547/bin/ruby',
        }
      }

    }

