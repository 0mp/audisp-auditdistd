# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.provider :virtualbox do |vb|
        vb.gui = false
    end

    config.vm.define "freebsd" do |freebsd|
        freebsd.vm.box = "freebsd/FreeBSD-11.1-RELEASE"
        freebsd.vm.network "private_network", ip: "192.168.10.11"
        freebsd.vm.synced_folder ".", "/vagrant", type: "rsync"
        freebsd.vm.hostname = "freebsd"

        freebsd.vm.base_mac = "020027D14C66"
        freebsd.ssh.shell = "sh"

        freebsd.vm.provision "configure", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/freebsd/configure.sh"
        end

        freebsd.vm.provision "run", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/freebsd/run.sh"
        end
    end

    config.vm.define "linux" do |linux|
        linux.vm.box = "debian/contrib-stretch64"
        linux.vm.network "private_network", ip: "192.168.10.12"
        linux.vm.synced_folder ".", "/vagrant"
        linux.vm.hostname = "linux"
        linux.vm.post_up_message = ""

        linux.vm.provision "configure", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/linux/configure.sh"
        end

        linux.vm.provision "build-openbsm", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/linux/build-openbsm.sh"
        end

        linux.vm.provision "rebuild-openbsm", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/linux/rebuild-openbsm.sh"
        end

        linux.vm.provision "run", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/linux/run.sh"
        end
    end
end
