#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.


include_recipe "openjdk"

include_recipe 'tomcat::install'
include_recipe 'tomcat::config'
include_recipe 'tomcat::service'