#
# Cookbook Name:: openjdk
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package "epel-release" do
action :install
end

execute "yum update" do
command "yum -y update && touch /tmp/update"
not_if { ::File.exist?('/tmp/update') }
end

include_recipe 'openjdk::install'