require 'spec_helper'

describe 'dottor::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  context 'no users in the dotfiles data bag' do
    before do
      ChefSpec::Server.create_data_bag('dotfiles', {})
    end

    it 'installs the chef gem' do
      expect(chef_run).to install_chef_gem('dottor').with(version: '0.3.1')
    end
  end

  context 'a dotfiles user who has a git repo' do
    before do
      ChefSpec::Server.create_data_bag('dotfiles', {
        'test_user' => {
          'repo' => 'ssh://some.git.path'
        }
      })
    end

    it 'clones the users repo' do
      expect(chef_run).to sync_git('/home/test_user/.dotfiles').with(repository: 'ssh://some.git.path')
    end
  end
end
