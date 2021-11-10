#====================#
# vCenter connection #
#====================#

variable "vsphere_user" {
  description = "vSphere user name"
}

variable "vsphere_password" {
  description = "vSphere password"
}

variable "vsphere_vcenter" {
  description = "vCenter server FQDN or IP"
}

variable "vsphere_unverified_ssl" {
  description = "Is the vCenter using a self signed certificate (true/false)"
}

variable "vsphere_datacenter" {
  description = "vSphere datacenter"
}

variable "vsphere_drs_cluster" {
  description = "vSphere cluster"
  default     = ""
}

variable "vsphere_resource_pool" {
  description = "vSphere resource pool"
}

variable "vsphere_enable_anti_affinity" {
  description = "Enable anti affinity between master VMs and between worker VMs (DRS need to be enable on the cluster)"
  default     = "false"
}

variable "vsphere_vcp_user" {
  description = "vSphere user name for the Kubernetes vSphere Cloud Provider plugin"
}

variable "vsphere_vcp_password" {
  description = "vSphere password for the Kubernetes vSphere Cloud Provider plugin"
}

variable "vsphere_vcp_datastore" {
  description = "vSphere default datastore for the Kubernetes vSphere Cloud Provider plugin"
}

#===========================#
# Kubernetes infrastructure #
#===========================#

variable "action" {
  description = "Which action have to be done on the cluster (create, add_worker, remove_worker, or upgrade)"
  default     = "create"
}

variable "worker" {
  type        =  list
  description = "List of worker IPs to remove"

  default = [""]
}

variable "vm_user" {
  description = "SSH user for the vSphere virtual machines"
}

variable "vm_password" {
  description = "SSH password for the vSphere virtual machines"
}

variable "vm_privilege_password" {
  description = "Sudo or su password for the vSphere virtual machines"
}

variable "vm_distro" {
  description = "Linux distribution of the vSphere virtual machines (ubuntu/centos/debian/rhel)"
}

variable "vm_datastore" {
  description = "Datastore used for the vSphere virtual machines"
}

variable "vm_network" {
  description = "Network used for the vSphere virtual machines"
}

variable "vm_template" {
  description = "Template used to create the vSphere virtual machines (linked clone)"
}

variable "vm_folder" {
  description = "vSphere Virtual machines folder"
}

variable "vm_linked_clone" {
  description = "Use linked clone to create the vSphere virtual machines from the template (true/false). If you would like to use the linked clone feature, your template need to have one and only one snapshot"
  default     = "false"
}

variable "k8s_kubespray_url" {
  description = "Kubespray git repository"
  default     = "https://github.com/kubernetes-incubator/kubespray.git"
}

variable "k8s_kubespray_version" {
  description = "Kubespray version"
  default     = "2.8.2"
}

variable "k8s_version" {
  description = "Version of Kubernetes that will be deployed"
  default     = "1.12.5"
}

variable "vm_master_ips" {
  type        = map
  description = "IPs used for the Kubernetes master nodes"
}

variable "vm_worker_ips" {
  type        = map
  description = "IPs used for the Kubernetes worker nodes"
}

variable "vm_haproxy_vip" {
  description = "IP used for the HAProxy floating VIP"
}

variable "vm_haproxy_ips" {
  type        = map
  description = "IP used for two HAProxy virtual machine"
}

variable "vm_netmask" {
  description = "Netmask used for the Kubernetes nodes and HAProxy (example: 24)"
}

variable "vm_gateway" {
  description = "Gateway for the Kubernetes nodes"
}

variable "vm_dns" {
  description = "DNS for the Kubernetes nodes"
}

variable "vm_domain" {
  description = "Domain for the Kubernetes nodes"
}

variable "k8s_network_plugin" {
  description = "Kubernetes network plugin (calico/canal/flannel/weave/cilium/contiv/kube-router)"
  default     = "flannel"
}

variable "k8s_weave_encryption_password" {
  description = "Weave network encyption password "
  default     = ""
}

variable "k8s_dns_mode" {
  description = "Which DNS to use for the internal Kubernetes cluster name resolution (example: kubedns, coredns, etc.)"
  default     = "coredns"
}

variable "vm_master_cpu" {
  description = "Number of vCPU for the Kubernetes master virtual machines"
}

variable "vm_master_ram" {
  description = "Amount of RAM for the Kubernetes master virtual machines (example: 2048)"
}

variable "vm_worker_cpu" {
  description = "Number of vCPU for the Kubernetes worker virtual machines"
}

variable "vm_worker_ram" {
  description = "Amount of RAM for the Kubernetes worker virtual machines (example: 2048)"
}

variable "vm_haproxy_cpu" {
  description = "Number of vCPU for the HAProxy virtual machine"
}

variable "vm_haproxy_ram" {
  description = "Amount of RAM for the HAProxy virtual machine (example: 1024)"
}

variable "vm_name_prefix" {
  description = "Prefix for the name of the virtual machines and the hostname of the Kubernetes nodes"
}

#======================================================================================
# Kubespray addons
#======================================================================================

variable "kubespray_custom_addons_enabled" {
  type        = bool
  description = "If enabled, custom addons.yml will be used"
}

variable "kubespray_custom_addons_path" {
  type        = string
  description = "If custom addons are enabled, addons YAML file from this path will be used"
}

variable "k8s_dashboard_enabled" {
  type        = bool
  description = "Sets up Kubernetes dashboard if enabled"
}

variable "k8s_dashboard_rbac_enabled" {
  type        = bool
  description = "If enabled, Kubernetes dashboard service account will be created"
}

variable "k8s_dashboard_rbac_user" {
  type        = string
  description = "Kubernetes dashboard service account user"
}

variable "helm_enabled" {
  type        = bool
  description = "Sets up Helm if enabled"
}

variable "local_path_provisioner_enabled" {
  type        = bool
  description = "Sets up Rancher's local path provisioner if enabled"
}

variable "local_path_provisioner_version" {
  type        = string
  description = "Local path provisioner version"
}

variable "local_path_provisioner_namespace" {
  type        = string
  description = "Namespace in which local path provisioner will be installed"
}

variable "local_path_provisioner_storage_class" {
  type        = string
  description = "Local path provisioner storage class"
}

variable "local_path_provisioner_reclaim_policy" {
  type        = string
  description = "Local path provisioner reclaim policy"
}

variable "local_path_provisioner_claim_root" {
  type        = string
  description = "Local path provisioner claim root"
}

variable "metallb_enabled" {
  type        = bool
  description = "Sets up MetalLB if enabled"
}

variable "metallb_version" {
  type        = string
  description = "MetalLB version"
}

variable "metallb_port" {
  type        = number
  description = "Kubernetes MetalLB port"
}

variable "metallb_cpu_limit" {
  type        = string
  description = "MetalLB pod CPU limit"
}

variable "metallb_mem_limit" {
  type        = string
  description = "MetalLB pod memory (RAM) limit"
}

variable "metallb_protocol" {
  type        = string
  description = "MetalLB protocol"
}

variable "metallb_ip_range" {
  type        = string
  description = "IP range that MetalLB will use for services of type LoadBalancer"
}

variable "metallb_peers" {
  type = list(object({
    peer_ip  = string
    peer_asn = number
    my_asn   = number
  }))
  description = "List of MetalLB peers"
}

variable "k8s_container_manager" {
  type        = string
  description = "Container runtime"
  default     = "docker"
}


#======================================================================================
# Kubespray etcd
#======================================================================================

variable "kubespray_etcd_deployment_type" {
  type        = string
  description = "docker if in docker or host if containerd"
  default     = "docker"
}
#================#
# Redhat account #

#================#

variable "rh_subscription_server" {
  description = "Address of the Redhat subscription server"
  default     = "subscription.rhsm.redhat.com"
}

variable "rh_unverified_ssl" {
  description = "Disable the Redhat subscription server certificate verification"
  default     = "false"
}

variable "rh_username" {
  description = "Username of your Redhat account"
  default     = "none"
}

variable "rh_password" {
  description = "Password of your Redhat account"
  default     = "none"
}
