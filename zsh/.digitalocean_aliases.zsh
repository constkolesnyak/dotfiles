# doctl auth init
# doctl registry login --never-expire

# doctl kubernetes cluster kubeconfig save {cluser_name}
# doctl registry get

alias dorname='doctl registry get --no-header --format Name'
alias dorgc='doctl registry garbage-collection start --include-untagged-manifests'
