#
# Cookbook Name:: gerrit
# Recipe:: users
#
# Copyright 2012, Steffen Gebert / TYPO3 Association
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

####################################
# User setup
####################################

# Authentication
template "#{node['gerrit']['home']}/review/etc/gerritpass" do
  source 'gerrit/gerritpass'
  owner node['gerrit']['user']
  group node['gerrit']['group']
  mode 0744
end
include_recipe 'rackspace_htpasswd'

htpasswd "#{node['gerrit']['home']}/review/etc/gerritpass" do
  user "jose"
  password "jose"
end
