class thirdpillar::build_passenger(
    $passenger_version  = '4.0.48',
  ) inherits ruby::params {
    node default {
      class {'passenger':
          passenger_version      => $passenger_version,
          passenger_provider     => 'gem',
          passenger_package      => 'passenger',
          gem_path               =>  $gemhome,
          gem_binary_path        => "${$gemhome}/bin",
          passenger_root         => "${$gemhome}/passenger-4.0.48",
        }
      }
    }
