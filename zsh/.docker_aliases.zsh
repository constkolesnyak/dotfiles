# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker#aliases

alias d='docker'
alias dcs='colima start'

alias dcu='docker-compose up --remove-orphans --build --watch'

alias dr='docker run'
alias drd='docker run --tty --detach'
alias dri='docker run --tty --interactive'
alias driu='docker run --tty --interactive ubuntu bash'

alias dsta='docker stop $(docker ps -q)'
alias dl='docker container ls --all'
alias drm='docker rm'
alias dpr='docker container prune --force'

alias di='docker image'
alias dil='docker image ls'
alias dirm='docker rmi -f'
alias dipr='docker image prune --force'
alias dp='docker push'
alias dt='docker tag'
alias dirn='docker image rename'

alias db='docker build . --platform linux/amd64 --tag'
alias dbp='docker build . --platform linux/amd64 --push --tag'
alias dbd='docker build . --platform linux/amd64 --no-cache --progress=plain --tag debug'

alias dei='docker exec --tty --interactive'

alias dspr='docker system prune --all --volumes'

# ACT
alias act='act --container-architecture linux/amd64 --var-file .env'
