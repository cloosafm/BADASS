# -*- mode: ruby -*-
# vi: set ft=ruby :

LOCAL_USER = ENV['USER'] || 'vagrant'
print "Local user: #{LOCAL_USER} \n"
ENV['VAGRANT_HOME'] = "/home/#{LOCAL_USER}/sgoinfre"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "#{LOCAL_USER}"
    vb.gui = true
    vb.customize ["modifyvm", :id, "--name", "#{LOCAL_USER}"]
    vb.customize ["setproperty", "machinefolder", "/home/#{LOCAL_USER}/sgoinfre/#{LOCAL_USER}"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    vb.memory = "12288"
    vb.cpus = "4"
  end

  config.vm.provision "shell", privileged: true, inline: <<-SHELL
    apt-get update -y
    apt-get upgrade -y

    # Install essential packages
    apt-get install -y sudo git vim wget curl openssh-server ufw  build-essential software-properties-common python3-pip

    # Install Ubuntu Desktop environment
    DEBIAN_FRONTEND=noninteractive apt-get install -y ubuntu-desktop

    # Install Docker
    curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
    
    # GNS3 - xterm (needed for console on host)
    apt-get install -y xterm

    # Install additional GNS3 dependencies
    apt-get install -y dynamips vpcs

    # Install and configure Wireshark (allow non-root users)
    DEBIAN_FRONTEND=noninteractive apt-get install -y wireshark
    echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
    dpkg-reconfigure wireshark-common

    # Install ubridge, libvirt, and kvm
    DEBIAN_FRONTEND=noninteractive apt-get install -y ubridge libvirt-bin qemu-kvm

    # Add vagrant user to necessary groups
    usermod -aG sudo,docker,ubridge,libvirt,kvm,wireshark #{LOCAL_USER}

    # Set hostname
    hostnamectl set-hostname #{LOCAL_USER}

    # Configure sudoers for vagrant user
    echo "vagrant ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/vagrant

    # Configure UFW firewall
    ufw allow OpenSSH
    ufw --force enable

    # Install GNS3
    add-apt-repository ppa:gns3/ppa -y
    apt-get update -y
    apt-get install -y gns3-gui gns3-server

    # Clean up
    apt-get autoremove -y
  SHELL

end
