# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-stretch64"
  config.vm.synced_folder "./shared", "/shared"

    config.vm.provision "prepare-openbsm", type: "shell", run: "never", privileged: "true" do |s|
        s.path = "provision/prepare-openbsm.sh"
    end

    config.vm.provision "build-openbsm", type: "shell", run: "never", privileged: "true" do |s|
        s.path = "provision/build-openbsm.sh"
    end

    config.vm.provision "rebuild-openbsm", type: "shell", run: "never", privileged: "true" do |s|
        s.path = "provision/rebuild-openbsm.sh"
    end

    config.vm.provision "install-auditd", type: "shell", run: "never", privileged: "true" do |s|
        s.path = "provision/install-auditd.sh"
    end
end
