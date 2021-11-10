# see roles/network_plugin/calico/defaults/main.yml

## With calico it is possible to distributed routes with border routers of the datacenter.
## Warning : enabling router peering will disable calico's default behavior ('node mesh').
## The subnets of each nodes will be distributed by the datacenter router
# peer_with_router: false

# Enables Internet connectivity from containers
# nat_outgoing: true

# Enables Calico CNI "host-local" IPAM plugin
# calico_ipam_host_local: true

# add default ippool name
# calico_pool_name: "default-pool"

# add default ippool blockSize (defaults kube_network_node_prefix)
# calico_pool_blocksize: 24

# add default ippool CIDR (must be inside kube_pods_subnet, defaults to kube_pods_subnet otherwise)
# calico_pool_cidr: 1.2.3.4/5

# Add default IPV6 IPPool CIDR. Must be inside kube_pods_subnet_ipv6. Defaults to kube_pods_subnet_ipv6 if not set.
# calico_pool_cidr_ipv6: fd85:ee78:d8a6:8607::1:0000/112

# Global as_num (/calico/bgp/v1/global/as_num)
# global_as_num: "64512"

# If doing peering with node-assigned asn where the globas does not match your nodes, you want this
# to be true.  All other cases, false.
# calico_no_global_as_num: false

# You can set MTU value here. If left undefined or empty, it will
# not be specified in calico CNI config, so Calico will use built-in
# defaults. The value should be a number, not a string.
# calico_mtu: 1500

# Configure the MTU to use for workload interfaces and tunnels.
# - If Wireguard is enabled, subtract 60 from your network MTU (i.e 1500-60=1440)
# - Otherwise, if VXLAN or BPF mode is enabled, subtract 50 from your network MTU (i.e. 1500-50=1450)
# - Otherwise, if IPIP is enabled, subtract 20 from your network MTU (i.e. 1500-20=1480)
# - Otherwise, if not using any encapsulation, set to your network MTU (i.e. 1500)
# calico_veth_mtu: 1440

# Advertise Cluster IPs
# calico_advertise_cluster_ips: true

# Advertise Service External IPs
# calico_advertise_service_external_ips:
# - x.x.x.x/24
# - y.y.y.y/32

# Adveritse Service LoadBalancer IPs
# calico_advertise_service_loadbalancer_ips:
# - x.x.x.x/24
# - y.y.y.y/16

# Choose data store type for calico: "etcd" or "kdd" (kubernetes datastore)
# calico_datastore: "kdd"

# Choose Calico iptables backend: "Legacy", "Auto" or "NFT"
# calico_iptables_backend: "Legacy"

# Use typha (only with kdd)
# typha_enabled: false

# Generate TLS certs for secure typha<->calico-node communication
# typha_secure: false

# Scaling typha: 1 replica per 100 nodes is adequate
# Number of typha replicas
# typha_replicas: 1

# Set max typha connections
# typha_max_connections_lower_limit: 300

# Set calico network backend: "bird", "vxlan" or "none"
# bird enable BGP routing, required for ipip mode.
# calico_network_backend: bird

# IP in IP and VXLAN is mutualy exclusive modes.
# set IP in IP encapsulation mode: "Always", "CrossSubnet", "Never"
# calico_ipip_mode: 'Always'

# set VXLAN encapsulation mode: "Always", "CrossSubnet", "Never"
# calico_vxlan_mode: 'Never'

# set VXLAN port and VNI
# calico_vxlan_vni: 4096
# calico_vxlan_port: 4789

# If you want to use non default IP_AUTODETECTION_METHOD for calico node set this option to one of:
# * can-reach=DESTINATION
# * interface=INTERFACE-REGEX
# see https://docs.projectcalico.org/reference/node/configuration
# calico_ip_auto_method: "interface=eth.*"
# Choose the iptables insert mode for Calico: "Insert" or "Append".
# calico_felix_chaininsertmode: Insert

# If you want use the default route interface when you use multiple interface with dynamique route (iproute2)
# see https://docs.projectcalico.org/reference/node/configuration : FELIX_DEVICEROUTESOURCEADDRESS
# calico_use_default_route_src_ipaddr: false

# Enable calico traffic encryption with wireguard
# calico_wireguard_enabled: false

# Under certain situations liveness and readiness probes may need tunning
# calico_node_livenessprobe_timeout: 10
# calico_node_readinessprobe_timeout: 10