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
alias kgscl='kubectl get secrets'
alias kgsc='kubectl get secret --output yaml github-secrets | yq e ".stringData = (.data | with_entries(.value |= @base64d)) | del(.data)"'

alias kaf='kubectl apply --filename'
alias kadr='kubectl apply --dry-run=client --filename'
alias kdf='kubectl diff --filename'

alias kd='kubectl describe'
alias kdd='kubectl describe deployment' # Events at the end
alias kdp='kubectl describe pod'

alias krr='kubectl rollout restart'
alias krrd='kubectl rollout restart deployment'
alias krs='kubectl rollout status'
alias krsd='kubectl rollout status deployment'

alias kl='kubectl logs'

kei() {kubectl exec -it "$@" -- bash}
