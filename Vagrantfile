# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # Configure VM name, max cpu, ram
  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant_elk"
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

  # provision vm
  config.vm.provision :shell, :privileged => false, :path => "provision/bin/provision.sh"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network :forwarded_port, guest: 9200, host: 9200
  config.vm.network :forwarded_port, guest: 5601, host: 5601

end
