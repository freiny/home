#****************************************
export GOPATH=$HOME/dev
export FROOT=/
export FAPP=/Applications
export FETC=/etc
export FUSERS=/Users
export FHOME=$HOME
export FDESK=$HOME/Desktop
export FDOC=$HOME/Documents
export FLIB=$HOME/Library
export FDOWN=$HOME/Downloads
export FBIN=$HOME/bin
export FDEV=$HOME/dev
export FDEVSRC=$HOME/dev/src
export FHUB=$HOME/dev/src/github.com
export FFREINY=$HOME/dev/src/github.com/freiny
export FLOCAL=$HOME/dev/src/github.com/freiny/local

export FDOCKER=$FLOCAL/docker
export FNODE=$FDOCKER/node

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$FDEV/bin

#****************************************
export EC2IP=$(ec2ip)
#****************************************
/()				{ cd /; }
.()				{ cd ./..; }
..()			{ cd ./../..; }
...()			{ cd ./../../..; }
....()			{ cd ./../../../..; }
l()				{ ls -a; }
ll()			{ ls -l; }
ka()			{ killall -v -u $1 -c $2; }
rmall()			{ rm -rf $1; }
kclear()		{ printf "\033c"; }
findfile()		{ find . -name $1 -type f; }
sudofindfile()	{ sudo find . -name $1 -type f; }
findword()		{ grep -rn $1 *; }
sudofindword()	{ sudo grep -rn $1 *; }
sha256()		{ shasum -a 256 $1; }
nanobash()		{ nano $HOME/.bash_profile; }
nanorc()		{ nano $HOME/.nanorc; }

run()			{ go clean; go build -o main; chmod 744 main; ./main; }
r()				{ run; }
test()			{ go test; }
t()				{ test; }
rmds()			{ find . -name ‘*.DS_Store’ -type f -delete; }
#****************************************
froot()		{ cd /; }
fapp()		{ cd /Applications; }
fetc()		{ cd /etc; }
fusers()	{ cd /Users; }
fhome()		{ cd $HOME; }
fdesk()		{ cd $HOME/Desktop; }
fdoc()		{ cd $HOME/Documents; }
flib()		{ cd $HOME/Library; }
fdown()		{ cd $HOME/Downloads; }

fbin()		{ cd $FBIN; }
fdev()		{ cd $FDEV; }

fhub()		{ cd $FHUB; }
flocal()	{ cd $FLOCAL; }
fconf()		{ cd $FFREINY/config; }
fcode()		{ cd $FFREINY/code-challenge; }
fchal()		{ cd $FFREINY/code-challenge; }
fds()		{ cd $FFREINY/go-datastructures; }
flibnotes()	{ cd $FFREINY/go-lib-notes; }
fotto()		{ cd $FFREINY/go-otto; }
frest()		{ cd $FFREINY/go-restapi; }
frun()		{ cd $FFREINY/local/run; }
fgonotes()	{ cd $FFREINY/go-notes; }
fgolang()	{ cd $FFREINY/go-notes/lang; }
fgopuzzle()	{ cd $FFREINY/go-notes/puzzle; }
fgosnippet(){ cd $FFREINY/go-notes/snippet; }
fesnotes()	{ cd $FFREINY/es5-notes; }
feslang()	{ cd $FFREINY/es5-notes/lang; }
fespuzzle()	{ cd $FFREINY/es5-notes/puzzle; }
fessnippet(){ cd $FFREINY/es5-notes/snippet; }
ftrylib()	{ cd $FFREINY/go-trylib; }
futil()		{ cd $FFREINY/go-util; }
fwin()		{ cd $FFREINY/go-window; }
fwinapp()	{ cd $FFREINY/go-window-app; }

fdocker()	{ cd $FDOCKER; }
fnode()		{ cd $FNODE; }
#****************************************
kClearCmdHistory(){ cat /dev/null > $HOME/.bash_history && history -c && exit; }
kColors(){
    export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad
}
kServe(){ python -m SimpleHTTPServer; }
#****************************************
f() 	{ cd $FFREINY; }
fl()	{ cd $FLOCAL; }
gs()	{ git status $1; }
ga()	{ git add $1; }
gc()	{ git commit $1; }
gd()	{ git diff $1; }
gl()	{ git log; }
gpom()	{ git push origin master; }
kGitEditor(){ git config --global core.editor "nano"; }
#****************************************
logOttoDev(){ VAGRANT_LOG=debug OTTO_LOG=1 otto dev; }
oc()		{ otto compile; }
od()		{ otto dev $1; }
# bundle && rackup --host 0.0.0.0
#****************************************
# docker run -p 8080:8080 -v $FLOCAL/docker/node/code:/code -d node-custom
#dnone(){ docker rmi -f $(docker images -f "dangling=true" -q); }
dnone(){
	docker rm -f $1
	docker rmi -f $1
	docker rmi -f $(docker images -a | grep "<none>" | cut "-c41-52")
}
dcc(){
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -f "dangling=true" -q)
}
dci(){
	docker rm -f $1
	docker rmi -f $1
	docker rmi -f $(docker images -a | grep "<none>" | cut "-c41-52")
}
dc(){
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -f "dangling=true" -q)
	docker rm -f $1
	docker rmi -f $1
	docker rmi -f $(docker images -a | grep "<none>" | cut "-c41-52")
}

dcleani(){ docker rmi $(docker images -a -q); }

db(){ docker build -t $1 .; }
dr(){ docker run -p 8080:8080 -d $1; }
de(){ docker exec -it $1 /bin/bash; }

dint(){ docker run -it -d $1; }

#alias dc="docker-compose "
alias d="docker "

alias dattach="docker attach "
alias dbuild="docker build "
alias dcommit="docker commit "
alias dcp="docker cp "
alias dcreate="docker create "
alias ddeploy="docker deploy "
alias ddiff="docker diff "
alias devents="docker events "
alias dexec="docker exec "
alias dexport="docker export "
alias dhistory="docker history "
alias dimages="docker images "
alias dimport="docker import "
alias dinfo="docker info "
alias dinspect="docker inspect "
alias dkill="docker kill "
alias dload="docker load "
alias dlogin="docker login "
alias dlogout="docker logout "
alias dlogs="docker logs "
alias dnetwork="docker network "
alias dnode="docker node "
alias dpause="docker pause "
alias dplugin="docker plugin "
alias dport="docker port "
alias dps="docker ps "
alias dpull="docker pull "
alias dpush="docker push "
alias drename="docker rename "
alias drestart="docker restart "
alias drm="docker rm "
alias drmi="docker rmi "
alias drun="docker run "
alias dsave="docker save "
alias dsearch="docker search "
alias dservice="docker service "
alias dstack="docker stack "
alias dstart="docker start "
alias dstats="docker stats "
alias dstop="docker stop "
alias dswarm="docker swarm "
alias dtag="docker tag "
alias dtop="docker top "
alias dunpause="docker unpause "
alias dupdate="docker update "
alias dversion="docker version "
alias dvolume="docker volume "
alias dwait="docker wait "

alias datt="docker attach "
#alias db="docker build "
alias dcom="docker commit "
#alias dc="docker create "
alias ddep="docker deploy "
alias ddif="docker diff "
alias devt="docker events "
alias dexe="docker exec "
alias dexp="docker export "
alias dh="docker history "
alias dimg="docker images "
alias di="docker images -a "
alias dimp="docker import "
alias dins="docker inspect "
alias dlogi="docker login "
alias dlogo="docker logout "
alias dlogs="docker logs "
alias dnet="docker network "
alias dpas="docker pause "
alias dplg="docker plugin "
alias dp="docker ps -a "
alias dren="docker rename "
alias dres="docker restart "
alias drem="docker rm "
alias drmi="docker rmi "
alias drun="docker run "
#alias dr="docker run "
alias dser="docker service "
alias ds="docker start "
alias dstat="docker stats "
alias dtag="docker tag "
alias dtop="docker top "
alias dunps="docker unpause "
alias dupdt="docker update "
alias dver="docker version "
alias dvol="docker volume "

#****************************************
kInit(){
    kclear
    kColors
    kGitEditor
}
kInit
#****************************************
