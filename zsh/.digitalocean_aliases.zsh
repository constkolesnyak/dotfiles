# doctl auth init
# doctl registry login --never-expire
# doctl kubernetes cluster kubeconfig save {cluser_name}

alias dorl='doctl registry repository list-v2'
alias dorlt='doctl registry repository list-tags'
alias dorltf='doctl registry repository list-tags --format Tag --no-header'
alias dorgc='doctl registry garbage-collection start --include-untagged-manifests'

alias dotaint='doctl kubernetes cluster node-pool update vox-prod-k8s-nyc2 node-pool-default --taint ' # ... 'node-pool-ai-taint:NoSchedule'
