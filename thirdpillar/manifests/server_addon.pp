class thirdpillar::server_addon{  

    class { "redis": 
          
        }

      class { 'memcached':
            max_memory => '10%',
        }
      }
