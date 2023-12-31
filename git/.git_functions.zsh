release() {
    git reset >/dev/null || return
    poetry version $1 || return # someday release() will be language-agnostic
    git commit --amend --no-edit -a >/dev/null
    git tag $1

    echo "\nif you forgot anything (e.g. release notes), fix and stage it, then run:\n\
    ganktag"
}

# View the full change history of a single file
# (copied from somewhere)
function glf() {
    if [[ -z $1 ]]; then
        echo "Usage:    git_log_file <file> [<from line>] [<to line>]"
        return 1
    elif [[ -z $2 ]]; then
        glog -p -- $1
        return 0
    elif [[ $2 == *,* ]]; then
        3=${2#*,}
        2=${2%,*}
    elif [[ -z $3 ]]; then
        3=$2
    fi
    glog -L $2,$3:$1
}
