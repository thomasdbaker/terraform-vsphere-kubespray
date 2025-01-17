---
# Please see roles/container-engine/containerd/defaults/main.yml for more configuration options

# containerd_storage_dir: "/var/lib/containerd"
# containerd_state_dir: "/run/containerd"
# containerd_oom_score: 0

# containerd_default_runtime: "runc"
# containerd_snapshotter: "native"

# containerd_runtimes:
#   - name: runc
#     type: "io.containerd.runc.v2"
#     engine: ""
#     root: ""
# Example for Kata Containers as additional runtime:
#   - name: kata
#     type: "io.containerd.kata.v2"
#     engine: ""
#     root: ""

# containerd_grpc_max_recv_message_size: 16777216
# containerd_grpc_max_send_message_size: 16777216

# containerd_debug_level: "info"

# containerd_metrics_address: ""

# containerd_metrics_grpc_histogram: false

containerd_registries:
  "docker.io": "https://registry-1.docker.io"

# containerd_max_container_log_line_size: -1

# containerd_registry_auth:
#   - registry: 10.0.0.2:5000
#     username: user
#     password: pass
