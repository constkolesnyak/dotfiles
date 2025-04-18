# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker#aliases

alias dcs='colima start'
alias d='docker'

alias dcu='docker-compose up --remove-orphans --build --watch'

alias dr='docker run'
alias drd='docker run --tty --detach'
alias dri='docker run --tty --interactive'

alias dsta='docker stop $(docker ps -q)'
alias dl='docker container ls --all'
alias drm='docker rm'
alias dpr='docker container prune --force'

alias di='docker image'
alias dil='docker image ls'
alias dirm='docker rmi -f'
alias dipr='docker image prune --force'

alias db='docker build --platform linux/arm64/v8 --tag'

alias dspr='docker system prune --all --volumes'
