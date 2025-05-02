# doctl auth init
# doctl registry login --never-expire
# doctl kubernetes cluster kubeconfig save {cluser_name}

alias dorl='doctl registry repository list-v2'
alias dorlt='doctl registry repository list-tags'
alias dorgc='doctl registry garbage-collection start --include-untagged-manifests'
