#
# Cookbook Name:: ubumirror
# Recipe:: default
#
# Copyright (C) 2015 Matt Whiteley
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

user 'ubumirror' do
  comment 'Ubuntu Mirror User'
  shell '/bin/false'
  system true
end

package 'ubumirror' do
  action :upgrade
end

%w( log ubuarc ubucdi uburel ubupor ).each do |p|
  directory node['ubumirror']["#{p}_dir"] do
    owner 'ubumirror'
    group 'ubumirror'
    mode '0755'
    recursive true
  end
end

template '/etc/ubumirror.conf' do
  source 'ubumirror.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    email: node['ubumirror']['email'],
    hostname: node['ubumirror']['hostname'],
    speed: node['ubumirror']['speed'],
    # ubuarc_enable: node['ubumirror']['ubuarc_enable'],
    # ubucdi_enable: node['ubumirror']['ubucdi_enable'],
    # uburel_enable: node['ubumirror']['uburel_enable'],
    # ubupor_enable: node['ubumirror']['ubupor_enable'],
    ubuarc_dir: node['ubumirror']['ubuarc_dir'],
    ubucdi_dir: node['ubumirror']['ubucdi_dir'],
    uburel_dir: node['ubumirror']['uburel_dir'],
    ubupor_dir: node['ubumirror']['ubupor_dir'],
    logdir: node['ubumirror']['log_dir'],
    ubuarc_mirror: node['ubumirror']['ubuarc_mirror'],
    ubucdi_mirror: node['ubumirror']['ubucdi_mirror'],
    uburel_mirror: node['ubumirror']['uburel_mirror'],
    ubupor_mirror: node['ubumirror']['ubupor_mirror'],
    ubucdi_flavours: node['ubumirror']['ubucdi_flavours'],
    ubuarc_exclude: node['ubumirror']['ubuarc_exclude'],
    ubucdi_exclude: node['ubumirror']['ubucdi_exclude'],
    uburel_exclude: node['ubumirror']['uburel_exclude'],
    ubupor_exclude: node['ubumirror']['ubupor_exclude']
  )
end

cron 'ubuarchive' do
  minute '03'
  hour '*/6'
  command '/usr/bin/ubuarchive >/dev/null'
  user 'ubumirror'
  only_if { node['ubumirror']['ubuarc_enable'] }
end

cron 'uburelease' do
  minute '03'
  hour '*/4'
  command '/usr/bin/uburelease >/dev/null'
  user 'ubumirror'
  only_if { node['ubumirror']['uburel_enable'] }
end

cron 'ubucdimage' do
  minute '03'
  hour '11'
  command '/usr/bin/ubucdimage >/dev/null'
  user 'ubumirror'
  only_if { node['ubumirror']['ubucdi_enable'] }
end

cron 'ubuports' do
  minute '03'
  hour '23'
  command '/usr/bin/ubuports >/dev/null'
  user 'ubumirror'
  only_if { node['ubumirror']['ubupor_enable'] }
end
