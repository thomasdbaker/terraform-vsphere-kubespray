# terraform-vsphere-kubespray

* Credit goes to sguyennet whom was the orginal author
* This is my first project with terraform and ansible so there is likely bugs

## Whats New/Fixed

* All fixes tested with esxi 6.7, Ubuntu 20.04, Kubespray 2.17.1 and Terraform v1.0.10
* Fixed resources on destroy to include triggers works with latest version of Kubespray
* Corrected File structure with work wil latest version of kubespray
* Added addons templates
* Added option to create etcd at host level
* Added option to change container runtime 


## Requirements

* Git
* Ansible >= v2.6 or v2.7
* Jinja >= 2.9.6
* Python netaddr
* Terraform v1.0.10
* Internet connection on the client machine to download Kubespray.
* Internet connection on the Kubernetes nodes to download the Kubernetes binaries.
* vSphere environment with a vCenter. An enterprise plus license is needed if you would like to configure anti-affinity between the Kubernetes master nodes.
* A Linux vSphere template. If linked clone is used, the template needs to have one and only one snapshot(due to a current bug in the provider, the template also need to be just a power off VM and not an actual vSphere template).

## Tested Linux distribution

* Ubuntu LTS 20.04 (requirements: open-vm-tools package)
* Ubuntu LTS 18.04 (requirements: VMware tools)
* CentOS 7 (requirements: open-vm-tools package, perl package)
* Debian 9 (requirements: VMware tools, vSphere VM OS configuration set to "Ubuntu Linux (64-bit)", net-tools package)
* RHEL 7 (requirements: open-vm-tools package, perl package)

## Tested Kubernetes network plugins

|         |        RHEL 7      |       CentOS 7     |  Ubuntu LTS 18.04  |  Ubuntu LTS 20.04  |       Debian 9     |
|---------|:------------------:|:------------------:|:------------------:|:------------------:|:------------------:|
| Flannel | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |        :x:         | :heavy_check_mark: |
| Weave   | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |        :x:         | :heavy_check_mark: |
| Calico  | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Cilium  |        :x:         |        :x:         | :heavy_check_mark: |        :x:         | :heavy_check_mark: |
| Canal   | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |        :x:         | :heavy_check_mark: |

## Usage

All the steps to use this Terraform script are described in details here:
https://blog.inkubate.io/install-and-manage-automatically-a-kubernetes-cluster-on-vmware-vsphere-with-terraform-and-kubespray/

### Create a Kubernetes cluster

$ cd terraform-vsphere-kubespray

$ vim terraform.tfvars

$ terraform init

$ terraform plan

$ terraform apply

### Add a worker node

Add one or several worker nodes to the k8s_worker_ips list:

$ vim terraform.tfvars

Execute the terraform script to add the worker nodes:

$ terraform apply -var 'action=add\_worker'

### Delete a worker node

Remove one or several worker nodes to the k8s_worker_ips list:

$ vim terraform.tfvars

Execute the terraform script to remove the worker nodes:

$ terraform apply -var 'action=remove\_worker'

### Upgrade Kubernetes

Modify the k8s_version and the k8s_kubespray_version variables:

$ vim terraform.tfvars

| Kubernetes version | Kubespray version |
|:------------------:|:-----------------:|
|      v1.21.6       |      v2.17.1      |


Execute the terraform script to upgrade Kubernetes:

$ terraform apply -var 'action=upgrade'
