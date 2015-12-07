# Puppet Base Image
#
# VERSION               0.0.1-alpha
FROM ubuntu:14.04
MAINTAINER Goran Miskovic <schkovich@gmail.com>
#
# http://jpetazzo.github.io/2013/10/06/policy-rc-d-do-not-start-services-automatically/
#
RUN echo exit 101 > /usr/sbin/policy-rc.d
RUN chmod +x /usr/sbin/policy-rc.d
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update  --quiet \
  && apt-get -qq -o Dpkg::Options::='--force-confnew' -y \
  --no-install-recommends install \
  build-essential \
  git \
  wget \
  software-properties-common \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN apt-add-repository --yes ppa:brightbox/ruby-ng
RUN apt-get update --quiet \
  && apt-get -qq -o Dpkg::Options::='--force-confnew' -y \
  --no-install-recommends install \
  ruby2.1 \
  ruby2.1-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN wget -q http://apt.puppetlabs.com/puppetlabs-release-trusty.deb \
  && dpkg -i puppetlabs-release-trusty.deb \
  && rm puppetlabs-release-trusty.deb \
  && apt-get update --quiet \
  && apt-get -qq -o Dpkg::Options::='--force-confnew' -y \
  --no-install-recommends install \
  puppet \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
  # http://m0dlx.com/blog/Puppet__could_not_find_a_default_provider_for_augeas.html
  # test: echo -e "require 'augeas'\nputs Augeas.open" | ruby -rrubygems
  # https://tickets.puppetlabs.com/browse/PUP-3796
WORKDIR /usr/lib/x86_64-linux-gnu/ruby/vendor_ruby
RUN rm -r '2.1.0/' \
  && ln -s 2.0.0/ '2.1.0'
WORKDIR /usr/lib/x86_64-linux-gnu
RUN ln -s libruby-2.1.so.2.1 libruby-2.0.so.2.0WORKDIR /tmp
RUN gem install librarian-puppet deep_merge --no-rdoc --no-ri
