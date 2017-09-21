# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.provider :virtualbox do |vb|
        vb.gui = false
    end

    config.vm.synced_folder ".", "/vagrant", disabled: true

    config.vm.define "freebsd" do |freebsd|
        freebsd.vm.box = "freebsd/FreeBSD-11.1-RELEASE"
        freebsd.vm.network "private_network", ip: "192.168.10.11"
        freebsd.vm.synced_folder "./shared", "/shared", type: "rsync"
        freebsd.vm.hostname = "freebsd"

        freebsd.vm.base_mac = "020027D14C66"
        freebsd.ssh.shell = "sh"

        freebsd.vm.provision "configure-freebsd", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/freebsd/configure-freebsd.sh"
        end
    end

    config.vm.define "linux" do |linux|
        linux.vm.box = "debian/contrib-stretch64"
        linux.vm.network "private_network", ip: "192.168.10.12"
        linux.vm.synced_folder "./shared", "/shared"
        linux.vm.hostname = "linux"

        linux.vm.provision "configure-linux", type: "shell", run: "never", privileged: "true" do |s|
            s.path = "provision/linux/configure-linux.sh"
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
