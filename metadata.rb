name             'rackspace_gerrit'
maintainer       'Steffen Gebert'
maintainer_email 'steffen.gebert@typo3.org'
license          'Apache 2.0'
description      'Installs/Configures gerrit'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

%w(rackspace_apt rackspace_build_essential rackspace_database rackspace_mysql rackspace_java git maven rackspace_apache ssl_certificates).each do |cookbook|
  depends cookbook
end

recipe 'rackspace_gerrit::default', 'Installs and configures Gerrit. Includes other recipes, if needed'
recipe 'rackspace_gerrit::mysql', 'Installs MySQL server and configures Gerrit to use MySQL'
recipe 'rackspace_gerrit::proxy', 'Installs Apache2 as reverse proxy in front of Gerrit'
recipe 'rackspace_gerrit::source', 'Checks out Gerrit source code from Git and builds it using maven.'

supports 'debian'
