# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.provider :virtualbox do |vb|
        vb.gui = false
    end

    config.vm.define "freebsd-receiver" do |host|
        host.vm.box = "freebsd/FreeBSD-11.1-RELEASE"
        host.vm.network "private_network", ip: "192.168.10.11"
        host.vm.synced_folder ".", "/vagrant", type: "rsync"
        host.vm.hostname = "freebsd-receiver"

        host.vm.base_mac = "020027D14C66"
        host.ssh.shell = "sh"

        host.vm.provision "configure", type: "shell", run: "never", privileged: "true" do |s|
            s.path = host.vm.hostname + "/provision/configure.sh"
        end

        host.vm.provision "run", type: "shell", run: "never", privileged: "true" do |s|
            s.path = host.vm.hostname + "/provision/run.sh"
        end
    end

    config.vm.define "linux-sender" do |host|
        host.vm.box = "debian/contrib-stretch64"
        host.vm.network "private_network", ip: "192.168.10.12"
        host.vm.synced_folder ".", "/vagrant"
        host.vm.hostname = "linux-sender"
        host.vm.post_up_message = ""

        host.vm.provision "configure", type: "shell", run: "never", privileged: "true" do |s|
            s.path = host.vm.hostname + "/provision/configure.sh"
        end

        host.vm.provision "make-openbsm", type: "shell", run: "never", privileged: "true" do |s|
            s.path = host.vm.hostname + "/provision/make-openbsm.sh"
        end

        host.vm.provision "rebuild-openbsm", type: "shell", run: "never", privileged: "true" do |s|
            s.path = host.vm.hostname + "/provision/rebuild-openbsm.sh"
        end

        host.vm.provision "run", type: "shell", run: "never", privileged: "true" do |s|
            s.path = host.vm.hostname + "/provision/run.sh"
        end
    end

    # FreeBSD sender.
    config.vm.define "freebsd-sender" do |host|
        host.vm.box = "freebsd/FreeBSD-11.1-RELEASE"
        host.vm.network "private_network", ip: "192.168.10.13"
        host.vm.synced_folder ".", "/vagrant", type: "rsync"
        host.vm.hostname = "freebsd-sender"

        host.vm.base_mac = "020027D14C00"
        host.ssh.shell = "sh"

        host.vm.provision "configure", type: "shell", run: "never", privileged: "true" do |s|
            s.path = host.vm.hostname + "/provision/configure.sh"
        end
    end
end
