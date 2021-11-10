#===============================================================================
# VMware vSphere configuration
#===============================================================================
#Authenticaiton
vm_password = ""
vm_privilege_password = ""
vsphere_password = ""
vsphere_vcp_password = ""

# vCenter IP or FQDN #
vsphere_vcenter = "cpucsvcsa01.cpucs.local"

# vSphere username used to deploy the infrastructure #
vsphere_user = "administrator@vsphere.local"

# Skip the verification of the vCenter SSL certificate (true/false) #
vsphere_unverified_ssl = "true"

# vSphere datacenter name where the infrastructure will be deployed #
vsphere_datacenter = "CPUCS"

# vSphere cluster name where the infrastructure will be deployed #
vsphere_drs_cluster = "CPUCSCLUSTER"

# vSphere resource pool name that will be created to deploy the virtual machines #
vsphere_resource_pool = "kubernetes-kubespray"

# Enable anti-affinity between the Kubernetes master virtual machines. This feature require a vSphere enterprise plus license #
vsphere_enable_anti_affinity = "false"

# vSphere username used by the vSphere cloud provider #
vsphere_vcp_user = "administrator@vsphere.local"

# vSphere datastore name where the Kubernetes persistant volumes will be created #
vsphere_vcp_datastore = "Datastore"

#===============================================================================
# Global virtual machines parameters
#===============================================================================

# Username used to SSH to the virtual machines #
vm_user = "tomdbaker"

# The linux distribution used by the virtual machines (ubuntu/debian/centos/rhel) #
vm_distro = "ubuntu"

# The prefix to add to the names of the virtual machines #
vm_name_prefix = "k8s-kubespray"

# The name of the vSphere virtual machine and template folder that will be created to store the virtual machines #
vm_folder = "kubernetes-kubespray"

# The datastore name used to store the files of the virtual machines #
vm_datastore = "Datastore"

# The vSphere network name used by the virtual machines #
vm_network = "VM Network"

# The netmask used to configure the network cards of the virtual machines (example: 24)#
vm_netmask = "16"

# The network gateway used by the virtual machines #
vm_gateway = "192.168.1.1"

# The DNS server used by the virtual machines #
vm_dns = "192.168.1.6"

# The domain name used by the virtual machines #
vm_domain = "cpucs.local"

# The vSphere template the virtual machine are based on #
vm_template = "ubuntu2004"

# Use linked clone (true/false)
vm_linked_clone = "true"

#===============================================================================
# Master node virtual machines parameters
#===============================================================================

# The number of vCPU allocated to the master virtual machines #
vm_master_cpu = "2"

# The amount of RAM allocated to the master virtual machines #
vm_master_ram = "2048"

# The IP addresses of the master virtual machines. You need to define 3 IPs for the masters #
vm_master_ips = {
  "0" = "192.168.2.11"
  "1" = "192.168.2.12"
  "2" = "192.168.2.13"
}

#===============================================================================
# Worker node virtual machines parameters
#===============================================================================

# The number of vCPU allocated to the worker virtual machines #
vm_worker_cpu = "2"

# The amount of RAM allocated to the worker virtual machines #
vm_worker_ram = "2048"

# The IP addresses of the master virtual machines. You need to define 1 IP or more for the workers #
vm_worker_ips = {
  "0" = "192.168.2.21"
  "1" = "192.168.2.22"
  "2" = "192.168.2.23"
}

#===============================================================================
# HAProxy load balancer virtual machine parameters
#===============================================================================

# The number of vCPU allocated to the load balancer virtual machine #
vm_haproxy_cpu = "1"

# The amount of RAM allocated to the load balancer virtual machine #
vm_haproxy_ram = "1024"

# The IP address of the load balancer floating VIP #
vm_haproxy_vip = "192.168.2.100"

# The IP address of the load balancer virtual machine #
vm_haproxy_ips = {
  "0" = "192.168.2.101"
  "1" = "192.168.2.102"
}

#===============================================================================
# Redhat subscription parameters
#===============================================================================

# If you use RHEL 7 as a base distro, you need to specify your subscription account #
#rh_subscription_server = "subscription.rhsm.redhat.com"
#rh_unverified_ssl = "false"
#rh_username = ""
#rh_password = ""

#===============================================================================
# Kubernetes parameters
#===============================================================================

# The Git repository to clone Kubespray from #
k8s_kubespray_url = "https://github.com/kubernetes-sigs/kubespray.git"

# The version of Kubespray that will be used to deploy Kubernetes #
k8s_kubespray_version = "v2.17.1"

# The Kubernetes version that will be deployed #
k8s_version = "v1.21.6"

# The overlay network plugin used by the Kubernetes cluster #
k8s_network_plugin = "calico"

# If you use Weavenet as an overlay network, you need to specify an encryption password #
k8s_weave_encryption_password = ""

k8s_dns_mode = "coredns"

## Container runtime
k8s_container_manager = "containerd"

#======================================================================================
# Kubespray addons
#======================================================================================

#=========================
# Custom addons
#=========================

# IMPORTANT: If custom addons are enabled, variables from other sections below
# will be ignored and addons from file path provided will be applied instead.

# Use custom addons.yml #
kubespray_custom_addons_enabled = false

# Path to custom addons.yml #
kubespray_custom_addons_path = "default/addons.yml"

#=========================
# General
#=========================

# Install Kubernetes dashboard #
k8s_dashboard_enabled = true

# Creates Kubernets dashboard RBAC token (dashboard needs to be enabled) #
k8s_dashboard_rbac_enabled = true
k8s_dashboard_rbac_user    = "admin"

# Install helm #
helm_enabled = true

#=========================
# Local path provisioner
#=========================

# Note: This is dynamic storage provisioner #

# Install Rancher's local path provisioner #
local_path_provisioner_enabled = true

# Version #
local_path_provisioner_version = "v0.0.19"

# Namespace in which provisioner will be installed #
local_path_provisioner_namespace = "local-path-provisioner"

# Storage class #
local_path_provisioner_storage_class = "local-storage"

# Reclaim policy (Delete/Retain) #
local_path_provisioner_reclaim_policy = "Delete"

# Claim root #
local_path_provisioner_claim_root = "/opt/local-path-provisioner/"

#=========================
# MetalLB
#=========================

# Install MetalLB #
metallb_enabled = true

# MetalLB version #
metallb_version = "v0.9.5"

# Kubernetes limits (1000m = 1 vCore) #
metallb_cpu_limit = "500m"
metallb_mem_limit = "500Mi"
metallb_port      = 7472

# MetalLB protocol (layer2/bgp) #
metallb_protocol = "layer2"

# IP range for services of type LoadBalancer #
metallb_ip_range = "192.168.113.241-192.168.113.254"

# MetalLB peers #
# Note: This variable will be applied only in 'bgp' mode #
metallb_peers = [
  {
    peer_ip  = "192.168.113.1"
    peer_asn = 65000
    my_asn   = 65000
  }
]

#=========================
# etcd
#=========================

# docker if in docker or host if containerd
kubespray_etcd_deployment_type = "host"