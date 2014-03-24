#
# Cookbook Name:: dottor
# Recipe:: default
#
# Copyright (C) 2014 William Roe
#
# Licensed under the MIT License
#

chef_gem 'dottor' do
  version '0.3.1'
end

dotfiles = data_bag('dotfiles')
dotfiles.each do |login|
  user = data_bag_item('dotfiles', login)
  home_dir = ::File.join('/home', login)

  git ::File.join(home_dir, ".dotfiles") do
    repository user['repo']
    action :sync
    user login
  end
end
