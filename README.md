# ISO Maker - Create ISO for unattended installation for Ubuntu.

This simple script will create an unattended Ubuntu ISO from start to finish. It will ask you a few questions once, and embed your answers into a remastered ISO file for you to use over and over again.

This script creates a 100% original Ubuntu installation; no additional software is added (aside from the VMWare Tools and Chef omnibus installer). You have all the freedom in the world to customize your Ubuntu installation whichever way you see fit. This script just takes the pain out of re-installing Ubuntu over and over again.

Consider using tools like ansible, chef or puppet to perform any additional software installations/configurations.

## Compatibility

The script supports the following Ubuntu editions out of the box:

* Ubuntu 12.04.5 Server LTS amd64 - Precise Pangolin
* Ubuntu 14.04.3 Server LTS amd64 - Trusty Tahr

This script has been tested on and with these two versions.

## Usage

* From your command line, run the following commands:

```
$ wget https://github.com/ravibhure/isomaker/raw/master/isomaker
$ chmod +x isomaker
$ sudo ./isomaker
```

* Choose which version you would like to remaster:

```
 +---------------------------------------------------+
 |            UNATTENDED UBUNTU ISO MAKER            |
 +---------------------------------------------------+
 >>> which ubuntu edition would you like to remaster:

  [1] Ubuntu 12.04.5 LTS Server amd64 - Precise Pangolin
  [2] Ubuntu 14.04.3 LTS Server amd64 - Trusty Tahr

 please enter your preference: [1|2]:
```

* Choose which disk size would you like to setup partitions:

```
 >>> which disk size would you like to setup:

  [1] 100GB Partition
  [2] 600GB Partition

 please enter your preference: [1|2]:
```

* Enter your desired timezone; the default is *US/Pacific*:

```
 please enter your preferred timezone: US/Pacific
```

* Enter your desired repository server; the default is *192.168.0.148*:

```
 please enter your repository server: 192.168.0.148
```

* Enter your desired repository server port; the default is *11002*:

```
 please enter your repository server port: 11002
```
* Enter your desired username; the default is *ubuntu*:

```
 please enter your preferred username: ubuntu
```

* Enter the password for your user account; the default is *ubuntu*

```
 please enter your preferred password (default:- ubuntu):
```

* Confirm your password:

```
 confirm your preferred password:
```

* Sit back and relax, while the script does the rest! :)

## What it does

This script does a bunch of stuff, here's the quick walk-through:

* It asks you for your preferences regarding the unattended ISO
* Downloads the appropriate Ubuntu original ISO straight from the Ubuntu servers; if a file with the exact name exists in /tmp, it will use that instead (so it won't download it more than once if you are creating several unattended ISO's with different defaults)
* Downloads the custom preseed file; this file contains all the magic answers to auto-install ubuntu. It uses the following defaults for you (only showing most important, for details, simply check the seed file in this repository):
* Language/locale: en_US
* Keyboard layout: US International
* Root login disabled (so make sure you write down your default usernames' password!)
* Partitioning: LVM, full disk, multi partition with different size.
* Preseed late_command will run the vmwaretools and chef-omnibus installer.
* Install the mkpasswd program (part of the whois package) to generate a hashed version of your password
* Install the genisoimage program to generate the new ISO file
* Mount the downloaded ISO image to a temporary folder
* Copy the contents of the original ISO to a working directory
* Set the default installer language
* Add/update the preseed file
* Add the autoinstall option to the installation menu
* Generate the new ISO file
* Cleanup
* Show a summary of what happended:

```
 installing required packages
 remastering your iso file
 creating the remastered iso
 -----
 finished remastering your ubuntu iso file
 the new file is located at: /tmp/ubuntu-14.04.3-server-amd64-600gb.iso
 your username is: ubuntu
 your password is: ubuntu
```

### Once Ubuntu is installed ...

You are ready to fire off another task, which will setup your own custom ubuntu server.

### Authors

Inspired from: Rinck Sonnenberg [ubuntu-unattended](https://github.com/netson/ubuntu-unattended)

[Ravi Bhure](https://github.com/ravibhure) (ravibhure/gmail/com)


### How it is different?

* Supports disk partitioning
* Meaningful repo name ;)

### TO DO

Following OS will be supports
* CentOS
* Fedora
* Debian
* Ubuntu-15+

### Contributing

Hi! Nice to see you here!

If you'd like to contribute code

* Fork the repository
* Create your feature branch
* Add your changes
* Push code to your feature branch
* Send PR to [isomaker](https://github.com/ravibhure/isomaker)
