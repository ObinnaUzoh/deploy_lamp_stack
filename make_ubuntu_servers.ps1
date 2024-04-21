# Initialize Vagrant environment
vagrant init ubuntu/focal64

# Customize Vagrantfile for Master server
@"
Vagrant.configure("2") do |config|
  config.vm.define "Master" do |master|
    master.vm.box = "ubuntu/focal64"
    master.vm.hostname = "Master"
  end

  config.vm.define "Slave" do |slave|
    slave.vm.box = "ubuntu/focal64"
    slave.vm.hostname = "Slave"
  end
end
"@ | Out-File -FilePath Vagrantfile -Encoding utf8

# Start the VMs
vagrant up
