# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker#aliases

# ln -s "$(brew --prefix)/bin/docker-buildx" ~/.docker/cli-plugins/docker-buildx

alias d='docker'
alias dcs='colima start --arch x86_64'

alias dcu='docker-compose up --remove-orphans --build --watch'

alias dr='docker run'
alias drd='docker run --tty --detach'
alias dri='docker run --tty --interactive'
alias driu='docker run --tty --interactive ubuntu bash'

alias dsta='docker stop $(docker ps -q)'
alias dls='docker container ls --all'
alias dl='docker logs'
alias drm='docker rm'
alias dpr='docker container prune --force'

alias di='docker image'
alias dils='docker image ls'
alias dirm='docker rmi -f'
alias dipr='docker image prune --force'
alias dp='docker push'
alias dt='docker tag'
alias dirn='docker image rename'

alias db='docker buildx build . --platform linux/amd64 --tag'
alias dbp='docker buildx build . --platform linux/amd64 --push --tag'
alias dbd='docker buildx build . --platform linux/amd64 --no-cache --progress=plain --tag debug'

alias dei='docker exec --tty --interactive'

alias dspr='docker system prune --all --volumes'

# ACT
alias act='act --container-architecture linux/amd64 --var-file .env'
