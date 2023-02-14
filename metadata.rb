name                'devops_poc'
maintainer          'DNK DevSecOps'
maintainer_email    'davestj@gmail.com'
license             'All Rights Reserved'
description         'Installs/Configures saint_devpoc'
issues_url          'https://github.com/davestj/devops_poc/issues'
version             '0.1.2'
chef_version        '>= 16.0' if respond_to?(:chef_version)

##lets build ourselves a kitchen to test our recipes and meal planning
gem "test-kitchen"
gem "kitchen-docker"


#set cookbook deps from supermarket
depends 'rvm', '< 1.1.3'