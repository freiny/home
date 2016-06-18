#****************************************
.(){ cd ./..; }
..(){ cd ./../..; }
...(){ cd ./../../..; }
....(){ cd ./../../../..; }
l(){ ls -a; }
ll(){ ls -l; }
k(){ printf "\033c"; }
kamock(){ sudo killall -v -l -d $1; }
ka(){ sudo killall -v -l $1; }
rmall(){ rm -rf $1; }
sha256(){ shasum -a 256 $1; }
#****************************************
root(){ cd /; }
app(){ cd /Applications; }
etc(){ cd /etc; }
users(){ cd /Users; }
home(){ cd $HOME; }
desk(){ cd $HOME/Desktop; }
doc(){ cd $HOME/Documents; }
lib(){ cd $HOME/Library; }
down(){ cd $HOME/Downloads; }

bin(){ cd $HOME/bin; }
dev(){ cd $HOME/dev; }
gh(){ cd $HOME/dev/github.com; }
#****************************************
kClearCmdHistory(){ cat /dev/null > $HOME/.bash_history && history -c && exit; }
kExport(){
    export PATH=$PATH:$HOME/bin
}
kColors(){
    export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad
}
#****************************************
f(){ cd $HOME/dev/freiny; }
fl(){ cd $HOME/dev/freiny-local; }
#****************************************
hc(){ cd $HOME/dev/github.com/hashicorp; }
logOttoDev(){ VAGRANT_LOG=debug OTTO_LOG=1 otto dev; }
od(){ otto dev $1; }
br(){ bundle && rackup --host 0.0.0.0; }
#****************************************
kInit(){
    k
    kExport
    kColors
}
kInit

#****************************************

