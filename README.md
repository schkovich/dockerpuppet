# Docker Puppet Base Image
Base Docker image from Ubuntu Trusty meant to build Puppet managed images on top of it.

See [Docker and Puppet](https://puppetlabs.com/presentations/using-docker-puppet-james-turnbull-kickstarter)
## PPAs Added
brightbox/ruby-ng

## Installed Packages
 * build-essential (11.6ubuntu6) trusty
 * git 1.9.1
 * wget 1.15
 * ruby2.1
 * ruby2.1-dev
 * puppet 3.8.4

## Installed Gems
 * librarian-puppet 2.2.1
 * deep_merge 1.0.1

## Nasty Augeas Fix
[Puppet Could Not Find a Default Provider for Augeas](http://m0dlx.com/blog/Puppet__could_not_find_a_default_provider_for_augeas.html)

Related bug [report](https://tickets.puppetlabs.com/browse/PUP-3796)
