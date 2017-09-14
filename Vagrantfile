# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.synced_folder "./shared", "/shared"

    config.vm.define "freebsd" do |freebsd|
        freebsd.vm.box = "freebsd/FreeBSD-11.1-RELEASE"
        freebsd.vm.base_mac = "020027D14C66"
        freebsd.ssh.shell = "sh"
    end

    config.vm.define "linux" do |linux|
        linux.vm.box = "debian/contrib-stretch64"

        linux.vm.provision "prepare-openbsm", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/prepare-openbsm.sh"
        end

        linux.vm.provision "build-openbsm", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/build-openbsm.sh"
        end

        linux.vm.provision "rebuild-openbsm", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/rebuild-openbsm.sh"
        end

        linux.vm.provision "install-auditd", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/install-auditd.sh"
        end
    end
end
