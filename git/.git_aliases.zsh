##* LOG ###

alias gl_='git log --graph --pretty=format:"%C(magenta)%h%Creset  %C(blue)%ad%Creset  %C(cyan)%s  %C(auto)%d%Creset%n" --date=format:"%d %b %H:%M"'
alias gl='gl_ --all' # better expansion
alias glh='gl_'      # better expansion
alias glp='gl -p'
alias glt='gl --stat'
alias glsl='git shortlog'
# alias glol='glog --oneline'

##* ADD ###

alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'
alias gai='git add --interactive'

##* COMMIT ###

alias gc='git commit --verbose'

alias gca='git commit --verbose -a'
alias gcm='git commit -m'
alias gcma='git commit -am'

alias gcf='git commit --fixup'
alias gcfa='git commit -a --fixup'
alias gcs='git commit --squash'
alias gcsa='git commit -a --squash'

alias gad='git commit --verbose --amend'
alias gam='git commit --amend -m'
alias gama='git commit --amend -am'
alias gan='git commit --amend --no-edit'
alias gana='git commit --amend --no-edit -a'
# 'gad' but keep the tag
gadktag() {tag=$(git describe --tags) && gtagd $tag && gad && gtag $tag}
# 'gan' but keep the tag
ganktag() {tag=$(git describe --tags) && gtagd $tag && gan && gtag $tag}

##* BRANCH ###

alias gbr='git branch'
alias gbl='git branch -vva'

alias gbc='git switch -c'
alias gbdel='git branch --delete'
alias gbdd='git branch -D'

alias gbs='git switch'
alias gb='git switch -'
alias gbi='git branch --no-color | grep -v "^\*" | fzf | xargs git checkout'
alias gbm='git switch main'
alias gbd='git switch dev'

##* STASH ###

alias gst='git stash'
alias gsts='git stash save'
alias gstu='git stash -u'
alias gstp='git stash -p'

alias gstpo='git stash pop'
alias gstap='git stash apply'
alias gstdr='git stash drop'

alias gstl='git stash list'
alias gstsh='git stash show -p'

##* REMOTE ###

alias gcl='git clone --recurse-submodules'
alias ghcl='gh repo clone'

alias grem='git remote'
alias grema='git remote add'
alias gremrm='git remote rm'
alias gremsh='git remote show'
alias gremv='git remote -v'

alias gf='git fetch --prune'
alias gpl='git pull --prune'
alias gplr='git pull --prune --rebase'
alias gplm='git pull --prune --no-rebase'

alias gpush='git push && git push --tags'
alias gpushup='git push --set-upstream origin $(git branch --show-current)'
alias gsup='git branch --set-upstream origin $(git branch --show-current)'

##* RE(SET/STORE/VERT) ###

alias gr='git reset'
alias grs='git reset --soft'
alias grhard='git reset --hard'
alias grk='git reset --keep'

alias grt='git restore'
alias grts='git restore --staged'

alias grev='git revert'

##* DIFF ###

alias gd='git diff'
alias gds='git diff --staged'
alias gdt='git diff --stat'
alias gdts='git diff --stat --staged'

alias gdst='git diff stash@{0}'
alias gdsth='git diff stash@{0} HEAD'

##* INFO ###

alias gs='git status'
alias gss='git status -s'

alias gsh='git show'
alias gsht='git show --stat'

alias grl='git reflog'

alias gcfl='git config --list'

alias glsf='git ls-files'

##* MERGE & REBASE ###

alias gm='git merge'
alias gmm='git merge main'
alias gmf='git merge --ff-only'
alias gms='git merge --squash'
alias gmt='git mergetool'
alias gma='git merge --abort'

alias grb='git rebase'
alias grbm='git rebase main'
alias grbi='git rebase --interactive'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

##* MISC ###

alias g="git"

alias gco='git checkout'
alias gcop='git checkout HEAD~'
# Only works in main
alias gcoc='git log --ancestry-path --format=%H ${commit}..main | tail -1 | xargs git checkout'

alias gbis='git bisect'
alias gbiss='git bisect start'
alias gbisg='git bisect good'
alias gbisb='git bisect bad'
alias gbisr='git bisect reset'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias grm='git rm'
alias gmv='git mv'

alias gclean='git clean -f'

alias ghelp='git help'

alias gtag='git tag'
alias gtagd='git tag -d'

alias gpath='git rev-parse --show-toplevel'
alias gname='basename $(git rev-parse --show-toplevel)'
