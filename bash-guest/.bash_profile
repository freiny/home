#****************************************
export GOPATH=$HOME/dev
export FROOT=/
export FETC=/etc
export FHOME=$HOME
export FBIN=$HOME/bin
export FCODE=/code

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/go/bin
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
fetc()		{ cd /etc; }
fhome()		{ cd $HOME; }
fbin()		{ cd $FBIN; }
#****************************************
kClearCmdHistory(){ cat /dev/null > $HOME/.bash_history && history -c && exit; }
kColors(){
    export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad
}
kServe(){ python -m SimpleHTTPServer; }
#****************************************
gs()	{ git status $1; }
ga()	{ git add $1; }
gc()	{ git commit $1; }
gd()	{ git diff $1; }
gl()	{ git log; }
gpom()	{ git push origin master; }
kGitEditor(){ git config --global core.editor "nano"; }
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
#****************************************
kInit(){
    kclear
    kColors
    kGitEditor
}
kInit
#****************************************
