class thirdpillar::set_git( 
    $revision = 'master',
    $repository_path = 'https://github.com/trustarun/Leave-Management-System.git',
    $project_path = "/var/www/melbourne",
  ){ 
    vcsrepo {"${project_path}":
      ensure   => present,
      provider => git,
      source   => $repository_path,
      revision => $revision,
    }
  }
