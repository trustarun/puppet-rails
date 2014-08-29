class thirdpillar::gem_dev_packages{
    if $::osfamily == 'RedHat' {
        package { ["mysql-devel","libxml2-devel", "libxslt-devel", "postgresql-libs", "postgresql-devel"]:
          ensure   => present,
        }
      }
    else{
        package { ["libmysqlclient-dev", "libxml2-dev", "libxslt-devel", "libpq-dev"]:
          ensure   => present,
        }
      }
    }
