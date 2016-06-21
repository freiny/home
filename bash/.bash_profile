#****************************************
/(){ cd /; }
.(){ cd ./..; }
..(){ cd ./../..; }
...(){ cd ./../../..; }
....(){ cd ./../../../..; }
l(){ ls -a; }
ll(){ ls -l; }
kclear(){ printf "\033c"; }
kamock(){ sudo killall -v -l -d $1; }
ka(){ sudo killall -v -l $1; }
rmall(){ rm -rf $1; }
rmds(){ find . -name ‘*.DS_Store’ -type f -delete; }
kfind(){ find . -name $1 -type f; }
sudokfind(){ sudo find . -name $1 -type f; }
sha256(){ shasum -a 256 $1; }
nanobash(){ nano $HOME/.bash_profile; }
nanorc(){ nano $HOME/.nanorc; }
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
dhub(){ cd $HOME/dev/src/github.com; }
dlocal(){ cd $HOME/dev/src/github.com/local; }
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
	export DLOCAL=$HOME/dev/src/github.com/local
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
