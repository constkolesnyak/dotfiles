# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl#aliases

alias k='kubectl'

alias ke='kubectl explain'
alias kccc='kubectl config current-context'

alias kgsr='kubectl get services' # IPs
alias kgp='kubectl get pods'
alias kgn='kubectl get namespaces'
alias kga='kubectl get all'
alias kgd='kubectl get deployments'
alias kgss='kubectl get statefulsets'
alias kgsc='kubectl get secrets'
alias kgscg='kubectl get secret --output yaml github-secrets | yq e ".stringData = (.data | with_entries(.value |= @base64d)) | del(.data)"'

alias kaf='kubectl apply --filename'
alias kadr='kubectl apply --dry-run=client --filename'
alias kdf='kubectl diff --filename'

alias kdd='kubectl describe deployment' # Events at the end

alias krr='kubectl rollout restart'
alias krs='kubectl rollout status'
