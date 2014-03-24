# chef-dottor cookbook

chef-dottor is a cookbook for installing your dotfiles (from a git repository or
an archive) and symlinks them into your home directory using
[dottor](https://github.com/marcocampana/dottor).

# Requirements

None.

# Usage

This cookbook is driven from a data bag - `dotfiles`. Each entry in that data
bag specifies a user and requires either a `repo` field or an `archive` field
for specifying the user's git repository or http archive location respectively.

Once you've set up your data bag, you can just include the recipe:

    include_recipe 'dottor::default'

Or include it in a role, or node run list.

# Attributes

* `node['dottor']['version']` - the version of the
  [dottor gem](http://rubygems.org/gems/dottor) to install and use

# Recipes

* `default` - Installs dotfiles for each user and symlinks them with dottor

# Author

Author:: William Roe (chef@wjlr.org.uk)
