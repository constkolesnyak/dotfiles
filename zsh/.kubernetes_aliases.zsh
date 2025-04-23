# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl#aliases

alias k='kubectl'

alias ke='kubectl explain'
alias kccc='kubectl config current-context'

alias kgs='kubectl get services' # IPs
alias kgp='kubectl get pods'
alias kgn='kubectl get namespaces'
alias kga='kubectl get all'
alias kgd='kubectl get deployments'

alias kaf='kubectl apply --filename'

alias kdd='describe deployment' # Events at the end
