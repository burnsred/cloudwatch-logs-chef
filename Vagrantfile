# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.hostname = 'cloudwatch-logs-berkshelf'
    config.omnibus.chef_version = :latest

    config.vm.box = 'opscode_ubuntu-14.04_provisionerless'
    config.vm.box_url = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box'

    config.vm.network :forwarded_port, host: 3000, guest: 3000

    config.berkshelf.enabled = true

    config.cache.scope = :box if Vagrant.has_plugin?('vagrant-cachier')

    config.vm.provider 'virtualbox' do |v|
        # NOTE(mike): Use to debug
        # v.gui = true

        v.memory = 512
        v.cpus = 2
    end

    config.vm.provision :chef_solo do |chef|
        chef.custom_config_path = 'Vagrantfile.chef'

        chef.log_level = 'info'

        chef.json = {}

        chef.run_list = [
            'cloudwatch-logs::default',
            'cloudwatch-logs::system_logs'
        ]
    end
end
