# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl#aliases

alias k='kubectl'

alias ke='kubectl explain'
alias kci='kubectx'
alias kcl='kubectl config get-contexts'
alias kcc='kubectx -c'
alias kc='kubectx -'

alias krm='kubectl delete'
alias krmp='kubectl delete pod'
alias krmf='kubectl delete --filename'
alias krmsr='kubectl delete service'
alias krmd='kubectl delete deployment'
alias krmss='kubectl delete statefulset'

wn() {
    w "kubectl get pods -o wide | awk '{print \$1,\$2,\$3,\$4,\$5,\$7}' | column -t | grep -e '^NAME' -e $1"
}
kgt() {
    node_pool_suffix=$1
    kubectl get nodes -l doks.digitalocean.com/node-pool=node-pool-${node_pool_suffix} \
        -o jsonpath='{range .items[*]}{"\n"}{.metadata.name}{"  "}{.spec.taints}{end}'
}

alias kgsr='kubectl get services' # IPs
alias kgp='kubectl get pods'
alias kgpvc='kubectl get pvc'
alias kgn='kubectl get nodes'
alias kga='kubectl get all'
alias kgd='kubectl get deployments'
alias kgss='kubectl get statefulsets,statefulsets.apps.kruise.io'
alias kgscl='kubectl get secrets'
alias kgsc='kubectl get secret --output yaml github-secrets | yq e ".stringData = (.data | with_entries(.value |= @base64d)) | del(.data)"'

alias kaf='kubectl apply --filename'
alias kadr='kubectl apply --dry-run=client --filename'
alias kdf='kubectl diff --filename'

alias kd='kubectl describe'
alias kdd='kubectl describe deployment' # Events at the end
alias kdp='kubectl describe pod'

alias krr='kubectl rollout restart'
alias krrf='kubectl rollout restart --filename'
alias krrd='kubectl rollout restart deployment'
alias krs='kubectl rollout status'
alias krsd='kubectl rollout status deployment'

alias kl='kubectl logs'

kei() {kubectl exec -it "$@" -- bash}

kge() {
    kubectl get events \
        --field-selector involvedObject.name=$1 \
        --sort-by='.lastTimestamp' \
        -o jsonpath='{range .items[*]}{.message}{"\n=============================\n"}{end}'
}
