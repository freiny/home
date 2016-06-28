#****************************************
export DDEVSRC=$HOME/dev/src
#****************************************
/(){ cd /; }
.(){ cd ./..; }
..(){ cd ./../..; }
...(){ cd ./../../..; }
....(){ cd ./../../../..; }
l(){ ls -a; }
ll(){ ls -l; }
kclear(){ printf "\033c"; }
ka(){ killall -v -u $1 -c $2; }
rmall(){ rm -rf $1; }
rmds(){ find . -name ‘*.DS_Store’ -type f -delete; }
findfile(){ find . -name $1 -type f; }
sudofindfile(){ sudo find . -name $1 -type f; }
findword(){ grep -rn $1 *; }
sudofindword(){ sudo grep -rn $1 *; }
sha256(){ shasum -a 256 $1; }
nanobash(){ nano $HOME/.bash_profile; }
nanorc(){ nano $HOME/.nanorc; }
run(){ go clean; go build -o main; chmod 744 main; ./main; }
#****************************************
droot(){ cd /; }
dapp(){ cd /Applications; }
detc(){ cd /etc; }
dusers(){ cd /Users; }
dhome(){ cd $HOME; }
ddesk(){ cd $HOME/Desktop; }
ddoc(){ cd $HOME/Documents; }
dlib(){ cd $HOME/Library; }
ddown(){ cd $HOME/Downloads; }

dbin(){ cd $HOME/bin; }
ddev(){ cd $HOME/dev; }

dhub(){ cd $DDEVSRC/github.com; }
dconf(){ cd $DDEVSRC/github.com/freiny/config; }
dchal(){ cd $DDEVSRC/github.com/freiny/code-challenge; }
dds(){ cd $DDEVSRC/github.com/freiny/go-datastructures; }
dlibshow(){ cd $DDEVSRC/github.com/freiny/go-lib-show; }
dlocal(){ cd $DDEVSRC/github.com/freiny/local; }
dotto(){ cd $DDEVSRC/github.com/freiny/go-otto; }
drest(){ cd $DDEVSRC/github.com/freiny/go-restapi; }
drun(){ cd $DDEVSRC/github.com/freiny/local/run; }
dshow(){ cd $DDEVSRC/github.com/freiny/go-show; }
dlang(){ cd $DDEVSRC/github.com/freiny/go-show/lang; }
dpuzzle(){ cd $DDEVSRC/github.com/freiny/go-show/puzzle; }
dsnippet(){ cd $DDEVSRC/github.com/freiny/go-show/snippet; }
dtrylib(){ cd $DDEVSRC/github.com/freiny/go-trylib; }
dutil(){ cd $DDEVSRC/github.com/freiny/go-util; }
dwin(){ cd $DDEVSRC/github.com/freiny/go-window; }
dwinapp(){ cd $DDEVSRC/github.com/freiny/go-window-app; }
#****************************************
kClearCmdHistory(){ cat /dev/null > $HOME/.bash_history && history -c && exit; }
kExport(){
    export PATH=$PATH:$HOME/bin
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH=$HOME/dev
    export DROOT=/
    export DAPP=/Applications
	export DETC=/etc
	export DUSERS=/Users
	export DHOME=$HOME
	export DDESK=$HOME/Desktop
	export DDOC=$HOME/Documents
	export DLIB=$HOME/Library
	export DDOWN=$HOME/Downloads
	export DBIN=$HOME/bin
    export DDEV=$HOME/dev
	export DHUB=$HOME/dev/src/github.com
}
kColors(){
    export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad
}
kServe(){ python -m SimpleHTTPServer; }
#****************************************
f(){ cd $HOME/dev/src/github.com/freiny; }
fl(){ cd $HOME/dev/src/github.com/local; }
gs(){ git status $1; }
ga(){ git add $1; }
gc(){ git commit $1; }
gd(){ git diff $1; }
gl(){ git log; }
gpom(){ git push origin master; }
kGitEditor(){ git config --global core.editor "nano"; }
#****************************************
logOttoDev(){ VAGRANT_LOG=debug OTTO_LOG=1 otto dev; }
oc(){ otto compile; }
od(){ otto dev $1; }
# bundle && rackup --host 0.0.0.0
#****************************************
kInit(){
    kclear
    kExport
    kColors
    kGitEditor
}
kInit
#****************************************
