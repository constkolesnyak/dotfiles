# doctl auth init
# doctl registry login --never-expire
# doctl kubernetes cluster kubeconfig save {cluser_name}
# doctl registry docker-config --output json --read-write

alias dorl='doctl registry repository list-v2'
alias dorlt='doctl registry repository list-tags'
alias dorltf='doctl registry repository list-tags --format Tag --no-header'
alias dorgc='doctl registry garbage-collection start --include-untagged-manifests'

dotaint() {
    node_pool_suffix=$1
    doctl kubernetes cluster node-pool update vox-prod-k8s-nyc2 \
        node-pool-${node_pool_suffix} \
        --taint node-pool-${node_pool_suffix}-taint:NoSchedule
}
