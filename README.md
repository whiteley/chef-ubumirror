[![Build Status](http://img.shields.io/travis/whiteley/chef-ubumirror.svg)][travis]

[travis]: http://travis-ci.org/whiteley/chef-ubumirror

# ubumirror-cookbook

Installs and configures [Ubumirror](https://launchpad.net/ubumirror).

## Supported Platforms

Ubuntu 12.04
Ubuntu 14.04

## Attributes

<table>
  <tr>
    <td><tt>['ubumirror']['email']</tt></td>
    <td>String</td>
    <td>Which email address/user that will receive failure notices.</td>
    <td><tt>root@localhost</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['hostname']</tt></td>
    <td>String</td>
    <td>Server's FQDN.</td>
    <td><tt>node['fqdn']</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['speed']</tt></td>
    <td>String</td>
    <td>Bandwidth limit for all mirror scripts - set to 0 for no limit.</td>
    <td><tt>0</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['log_dir']</tt></td>
    <td>String</td>
    <td>The destination directory of all the logs.</td>
    <td><tt>/var/log/ubumirror</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubuarc_enable']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubucdi_enable']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['uburel_enable']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubupor_enable']</tt></td>
    <td>Boolean</td>
    <td></td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubuarc_dir']</tt></td>
    <td>String</td>
    <td>The destination for the base of the archive directory.</td>
    <td><tt>/srv/mirror/ubuntu</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubucdi_dir']</tt></td>
    <td>String</td>
    <td>The destination for the base of the cdimage directory.</td>
    <td><tt>/srv/mirror/ubuntu-cdimage</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['uburel_dir']</tt></td>
    <td>String</td>
    <td>The destination for the base of the releases directory.</td>
    <td><tt>/srv/mirror/ubuntu-releases</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubupor_dir']</tt></td>
    <td>String</td>
    <td>The destination for the base of the ports directory.</td>
    <td><tt>/srv/mirror/ubuntu-ports</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubuarc_mirror']</tt></td>
    <td>String</td>
    <td>The rsync path in the form of host::directory/ of the upstream archive mirror.</td>
    <td><tt>archive.ubuntu.com::ubuntu/</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubucdi_mirror']</tt></td>
    <td>String</td>
    <td>The rsync path in the form of host::directory/ of the upstream cdimage mirror.</td>
    <td><tt>cdimage.ubuntu.com::cdimage/</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['uburel_mirror']</tt></td>
    <td>String</td>
    <td>The rsync path in the form of host::directory/ of the upstream releases mirror.</td>
    <td><tt>rsync.releases.ubuntu.com::releases/</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubupor_mirror']</tt></td>
    <td>String</td>
    <td>The rsync path in the form of host::directory/ of the upstream ports mirror.</td>
    <td><tt>ports.ubuntu.com::ubuntu-ports/</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubucdi_flavours']</tt></td>
    <td>Array</td>
    <td>The set of image flavours to pull from UBICDI_MIRROR.</td>
    <td><tt>%w(
      daily
      daily-live
      ubuntu-netbook/daily-live
      ubuntu-server/daily
    )</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubuarc_exclude']</tt></td>
    <td>Array</td>
    <td>The set of archive objects to exclude from syncing.</td>
    <td><tt>%w(
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
    )</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubucdi_exclude']</tt></td>
    <td>Array</td>
    <td>The set of cdimage objects to exclude from syncing.</td>
    <td><tt>%w(
      *-powerpc.*
      *-sparc.*
      source/
    )</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['uburel_exclude']</tt></td>
    <td>Array</td>
    <td>The set of release objects to exclude from syncing.</td>
    <td><tt>%w(
      *-powerpc.*
      *-sparc.*
    )</tt></td>
  </tr>
  <tr>
    <td><tt>['ubumirror']['ubupor_exclude']</tt></td>
    <td>Array</td>
    <td>The set of ports objects to exclude from syncing.</td>
    <td><tt>%w(
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
    )</tt></td>
  </tr>
</table>

## Usage

### ubumirror::default

Include `ubumirror` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[ubumirror::default]"
  ]
}
```

## License and Authors

Author:: Matt Whiteley (<mattwhiteley@gmail.com>)
