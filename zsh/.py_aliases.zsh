alias py='python3'
alias python='python3'

alias pybin="echo $(gpath)/.venv/bin"
alias pyv="$(pybin)/python"

pymain() {pyv "$(gpath)/src/$(gname)/main.py"}

alias pyt="$(pybin)/pytest"
alias pyts='pyt -m smoke'

alias pycover="$(pybin)/coverage"
pycov() {pycover erase && pycover run -m pytest && pycover html && open "$(gpath)/htmlcov/index.html"}

##* POETRY ###

alias po='poetry'

ponew() {poetry new --src --no-interaction $1 && cd $1 && poetry version 0.0.dev0 >/dev/null}
alias popublish='poetry publish --build'

alias poadd='poetry add'
poaddev() {poetry add "$@" --group dev}
alias porm='poetry remove'

alias poins='poetry install'
alias poupd='poetry update'
alias posync='poetry install --sync'
alias polock='poetry lock'

alias poshe='poetry shell'
alias porun='poetry run'

alias poinf='poetry env info'
alias posho='poetry show --latest'
alias poshotl='poetry show --latest --top-level'
alias poshot='poetry show --tree'
alias poche='poetry check'
alias pochelo='poetry lock --check'

alias pohelp='poetry help'
