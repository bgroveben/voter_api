#################################################################
# This docker image build file creates an image that contains
# ruby on rails. It is intended for you
# to use as a base for your project. Or as a template for your dockerfile.
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o  CFVegas __/
#         \    \        __/
#          \____\______/
#
# Component:    Voter- API
#################################################################

# Select ubuntu as the base image
FROM rails

MAINTAINER @ryquinn

# reduce output from debconf
ENV DEBIAN_FRONTEND noninteractive
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# database.yml overrides (TODO: I may remove these later)
ENV rails_env development
ENV GOOGLEAPIKEY blahblah

# Move Gemfile to tmp directory so bundle install caches
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

# bundle install
RUN /bin/bash -l -c 'bundle install'

# Add rails project to project directory
ADD ./ /rails

# set WORKDIR
WORKDIR /rails

# Expose some ports.
EXPOSE 3000

ENTRYPOINT export APIKEY=${GOOGLEAPIKEY} && ./startup
