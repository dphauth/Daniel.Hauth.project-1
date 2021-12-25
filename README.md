# Daniel.Hauth
Class Repository
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Elk Stack](https://github.com/dphauth/Daniel.Hauth/blob/main/Diagrams/Elk.Stack.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YML file may be used to install only certain pieces of it, such as Filebeat.

  - [filebeat-playbook.yml](https://github.com/dphauth/Daniel.Hauth/blob/main/Ansible/filebeat-config.yml.pdf)
  - [Install-Elk.yml](https://github.com/dphauth/Daniel.Hauth/blob/main/Ansible/install-elk.yml.pdf)
  - [Metricbeat.yml](https://github.com/dphauth/Daniel.Hauth/blob/main/Ansible/metricbeat.yml.pdf)
  - [Pentest.yml](https://github.com/dphauth/Daniel.Hauth/blob/main/Ansible/pentest.yml.pdf)  

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancers evenly distribute traffic across the web servers, helping to prevent a DoS attack. 
- Jump boxes fan in all incomming traffic to a single access point protecting your data center. Jump boxes also function as a single administrative point for the data centers behind them.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log data and system metrics.
- Filebeat collects data logs from specified files or locations on the servers.
- Metricbeats collects metric data from servers and the services operating within the servers.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function           | IP Address | Operating System |
|----------|--------------------|------------|------------------|
| Jump Box | Gateway            | 10.0.0.4   | Linux            |
| Web 1    | Web Server, Docker | 10.0.0.7   | Linux            |
| Web 2    | Web Server, Docker | 10.0.0.8   | Linux            |
| Web 3    | Web Server, Docker | 10.0.0.10  | Linux            |
| Elk      | Elk Stack          | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Personal IP Address

Machines within the network can only be accessed using an asmmetric key from the Jump Box.
- The Elk Server is accessible using SSH with an asmmetric key from the Jump Box and from my personal ID address using an asmmetric key via port 5601. 

A summary of the access policies in place can be found in the table below.

| Name          | Public Accessible | Allowed IP Addresses                      |
|---------------|-------------------|-------------------------------------------|
| Jump Box      | Yes               | Personal IP                               |
| Load Balancer | Yes               | Open                                      |
| Web 1         | No                | Jump Box 10.0.0.4                         |
| Web 2         | No                | Jump Box 10.0.0.4                         |
| Web 3         | No                | Jump Box 10.0.0.4                         |
| Elk Stack     | Yes               | Personal IP via P 5601, SSH from 10.0.0.4 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Ansible allows for simple and easy configuration, deployment of applications, security and is easily and quickly scaleable.

The playbook implements the following tasks:
- Installs Docker, Pip3 and Python Docker Modules
- Increases VM Virtual Memory
- Download and Launches Containers for Elk Server
- Enables Docker Services

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

<img width="1404" alt="Screen Shot 2021-12-24 at 12 15 22 PM" src="https://user-images.githubusercontent.com/84400775/147368441-d780db28-626e-4ecf-a400-7ae0239a4648.png">

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web 1 10.0.0.7
- Web 2 10.0.0.8
- Web 3 10.0.0.10

We have installed the following Beats on these machines:
- Filebeats
- Metricbeats

These Beats allow us to collect the following information from each machine:
- Filebeat collects data logs for observability and security data. Filebeat simplifies the collection, searching and readability of the log data. Auditd is an axample of a service provided by Filebeat. Auditd logs successful and unsecessful login attempts within your system and presents the info in easily readable and understand form. (elastic.co/beats/filebeats) 
- Metricbeats provides system level monitoring and statistics about your servers and applications. It provides metrics on things like disk and network usage, as well as memoery and file systems. (elastic.co/beats/metricbeats)

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the configuration files to Web servers.
- Update the host file to include the IP address of the Elk server and Web servers.
- Run the playbook, and navigate to [Elk-VM-Public-IP:5601/app/kabana] to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:
There are three configuration files; 
- [filebeat-playbook.yml](https://github.com/dphauth/Daniel.Hauth/blob/main/Ansible/filebeat-playbook.yml.pdf) 
- [metricbeat-playbook.yml](https://github.com/dphauth/Daniel.Hauth/blob/main/Ansible/metricbeat.yml.pdf)
- [install-elk.yml](https://github.com/dphauth/Daniel.Hauth/blob/main/Ansible/install-elk.yml.pdf)

Where do you copy it?
- /etc/ansible/

Which file do you update to make Ansible run the playbook on a specific machine?
- /etc/ansible/hosts.cfg 

How do I specify which machine to install the ELK server on versus which to install Filebeat on?
- 

Which URL do you navigate to in order to check that the ELK server is running?
- Elk-VM-Public-IP:5601/app/kabana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

