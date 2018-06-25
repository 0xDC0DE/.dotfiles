#find something
function f() {
    find . -iname "$1" 2>&1 | grep -v 'Permission denied'
}

#make directory and change into it
function md() {
    mkdir -p "$@" && cd "$@" && pwd
}

#go to ancestor directory with this name
function cdu {
    dir=${PWD%$1/*}
    if [[ "$dir" == "$PWD" ]]; then
        print "\"${1}\" is not above"
    else
        cd "${dir}${1}"
   fi
}

#change into directory and list contents
function cdl() {
    cd "$@"
    ls -l
}

#calculator with =
=() {
        calc "$@"
}

#print the current git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# print all git commits in last 7 days by me on all SCW repos
ipgit() {
    date=$(date -v-7d +%Y-%m-%d)
    for dir in $(find ~/SCW/Git -type d -name ".git" -print | xargs -n1 dirname)
    do
        revlist=$(git --git-dir=$dir/.git rev-list --all --pretty=oneline --since=$date | cut -d " " -f2-)
        if [ -n "$revlist" ]; then
            echo ""
            echo "Repo: $dir"
            echo "$revlist" | sed 's/^/  /'
        fi
    done
}

#print inform your peers list
ipshow(){
    nl ~/.inform
    ipgit
}

#add to inform your peers list
ip(){
    echo "$@" >> ~/.inform
}

#clear inform your peers list
ipclear(){
    echo ""> ~/.inform
}

# open folder of last Finder window that was in focus
cdf() {
    cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

tmuxs(){
    SESSIONNAME=$1
    tmux has-session -t $SESSIONNAME &> /dev/null
    if [ $? != 0 ]
    then
        tmux new-session -s $SESSIONNAME 
        exit
    fi
    tmux attach -t $SESSIONNAME
}

