#
# Cookbook Name:: ubumirror
# Attributes:: default
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

default['ubumirror']['email'] = 'root@localhost'
default['ubumirror']['hostname'] = node['fqdn']
default['ubumirror']['speed'] = '0'
default['ubumirror']['logdir'] = '/var/log/ubumirror'

default['ubumirror']['ubuarc_enable'] = false
default['ubumirror']['ubucdi_enable'] = false
default['ubumirror']['uburel_enable'] = false
default['ubumirror']['ubupor_enable'] = false

default['ubumirror']['ubuarc_dir'] = '/srv/mirror/ubuntu'
default['ubumirror']['ubucdi_dir'] = '/srv/mirror/ubuntu-cdimage'
default['ubumirror']['uburel_dir'] = '/srv/mirror/ubuntu-releases'
default['ubumirror']['ubupor_dir'] = '/srv/mirror/ubuntu-ports'

default['ubumirror']['ubuarc_mirror'] = 'archive.ubuntu.com::ubuntu/'
default['ubumirror']['ubucdi_mirror'] = 'cdimage.ubuntu.com::cdimage/'
default['ubumirror']['uburel_mirror'] = 'rsync.releases.ubuntu.com::releases/'
default['ubumirror']['ubupor_mirror'] = 'ports.ubuntu.com::ubuntu-ports/'

default['ubumirror']['ubucdi_flavours'] = %w(daily daily-live ubuntu-netbook/daily-live ubuntu-server/daily)

default['ubumirror']['ubuarc_exclude'] = %w(
  binary-powerpc/
  binary-sparc/
  daily-installer-powerpc/
  daily-installer-sparc/
  installer-powerpc/
  installer-sparc/
  *_powerpc.deb
  *_powerpc.udeb
  *_sparc.deb
  *_sparc.udeb
  Contents-powerpc.gz
  Contents-sparc.gz
)
default['ubumirror']['ubucdi_exclude'] = %w(
  *-powerpc.*
  *-sparc.*
  source/
)
default['ubumirror']['uburel_exclude'] = %w(
  *-powerpc.*
  *-sparc.*
)
default['ubumirror']['ubupor_exclude'] = %w(
  binary-powerpc/
  binary-sparc/
  daily-installer-powerpc/
  daily-installer-sparc/
  installer-powerpc/
  installer-sparc/
  *_powerpc.deb
  *_powerpc.udeb
  *_sparc.deb
  *_sparc.udeb
  Contents-powerpc.gz
  Contents-sparc.gz
)
