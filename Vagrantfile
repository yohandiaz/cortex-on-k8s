DISTRO_VERSION = "ubuntu/jammy64"
WORKER_NODES = 2

Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 1
  end

  config.vm.define "minikube-master" do |master|
    master.vm.box = DISTRO_VERSION
    master.vm.hostname = "minikube-master"
    master.vm.network "private_network", ip: "192.168.56.10"
    master.vm.provision "shell", path: "provision_scripts/master.sh"
  end

  (1..WORKER_NODES).each do |n|
    config.vm.define "minikube-worker-#{n}" do |worker|
      worker.vm.box = DISTRO_VERSION
      worker.vm.hostname = "minikube-worker-#{n}"
      worker.vm.network "private_network", ip: "192.168.56.#{n + 10}"
      worker.vm.provision "shell", path: "provision_scripts/worker.sh"
    end
  end
end
