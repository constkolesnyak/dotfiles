pycov() {
    cd $(gpath)
    pycover erase
    pycover run -m pytest || return
    pycover html
    open 'htmlcov/index.html'
}
