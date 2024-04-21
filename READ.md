# Automate the deployment of LAMP stack


## Step 1: Automate the provisioning of two Ubuntu-based servers, named "Master" and "Slave", using Vagrant. 

 

1. Note you must have virtual box and vagrant installed in this order. Click to install [Virtual box]{https://www.virtualbox.org/wiki/Downloads} and click to install Vagrant [https://developer.hashicorp.com/vagrant/install?product_intent=vagrant] 

 

2. On your command line interface create a directory for your vagrant servers.<br>
    ```mkdir ubuntu-clusters``` <br>
    ```cd ubuntu-clusters```


3. Run the script file to automate the provision of two ubuntu servers, named "Master" and "Slave" nodes using vagrant.  

    - In Windows, run:     ```.\make_ubuntu_servers.ps1```

    - In Mac/Linux, run:    ```bash make_ubuntu_servers.sh```


4. With your servers up, you can login to Master using:  

    ```vagrant ssh Master``` 


## Step 2: Automate the deployment of LAMP (Linux, Apache, MySQL, PHP) stack 

1. Install Ansible<br>
Having logged into the Master node using, run:
    ```sudo apt update```<br>
    ```sudo apt upgrade```<br>
    ```sudo apt install ansible```<br>

2. In this repo, some very import files are contained in the folder ```/master_node```.<br>
    - The bash script ```deploy_lamp.sh``` is used to automate the installation and configuration of Apache, mySQL, and PHP. In line 37 and 38, be sure to replace the placeholder, ```<mysql_password>``` with your new mysql password

    - The Ansible playbook, ```deploy_with_apin.yml``` excecutes the bash script ```deploy_lamp.sh`` on the Ansible playbook, and also verify that the PHP application is accessible through the VM's IP address. It also creates a cron job to check the server's uptime every 12 am.

### Step 3: Excecute the Ansible playbook to run the bash script on the Slave node<br>
- On the terminal run:<br>
    ```ansible-playbook -i slave_inventory deploy.yml```<br>
    Here the ```slave_inventory``` is the ansible inventory file, edit the <ip_address> placeholder with the ip address of the Slave node.
