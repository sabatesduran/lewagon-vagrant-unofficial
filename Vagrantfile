# -*- mode: ruby -*-
# vi: set ft=ruby :

# Plugins installed automaticaly
required_plugins = %w( vagrant-hostsupdater vagrant-multi-putty vagrant-triggers vagrant-vbguest )

begin
	plugins_to_install = required_plugins.select { |plugin| not Vagrant.has_plugin? plugin }
	if not plugins_to_install.empty?
		puts "Installing plugins: #{plugins_to_install.join(' ')}"
		if system "vagrant plugin install #{plugins_to_install.join(' ')}"
			exec "vagrant #{ARGV.join(' ')}"
		else
			abort "Installation of one or more plugins has failed. Aborting."
		end
	end
rescue
	exec "vagrant #{ARGV.join(' ')}"
end

Vagrant.configure(2) do |config|
	# OS distribution
	config.vm.box = "ubuntu/xenial64"

	# Networks and redirection ports
	config.vm.network "private_network", ip: "192.168.33.10"
	config.vm.network "forwarded_port", guest: 1080, host: 1080

	# VM Hostname
	config.vm.hostname = "lewagon.local"

	# Shared folders
	# config.vm.synced_folder "./shared/www", "/home/vagrant",
 #        create: true,
 #        type: "virtualbox",
 #        id: "vagrant-root",
 #        owner: "vagrant",
 #        group: "www-data",
 #        mount_options: ["dmode=775,fmode=664"]

	config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

	# Provider configuration
	config.vm.provider "virtualbox" do |vb|
		# RAM memory reserved
		vb.memory = "1024"
	end

	# List of sites to add to host file
	config.hostsupdater.aliases = []

	# Putty user
	config.putty.username = "vagrant"

	# Provision script
	config.vm.provision "shell", path: "provision/provision.sh"
end
