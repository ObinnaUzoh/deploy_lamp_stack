vagrant init ubuntu/focal64

----

Vagrant.configure("2") do |config|
  # Master node configuration
  config.vm.define "Master" do |master|
    master.vm.box = "ubuntu/focal64"
    master.vm.hostname = "Master"
    master.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
  end

  # Slave node configuration
  config.vm.define "Slave" do |slave|
    slave.vm.box = "ubuntu/focal64"
    slave.vm.hostname = "Slave"
    slave.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
  end
end


--- 

vagrant up


---