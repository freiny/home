#****************************************
export GOPATH=~/dev
export PATH=$PATH:~/bin
export PATH=$PATH:~/dev/bin
export PATH=$PATH:/usr/local/go/bin
#****************************************
f(){
	local home=~

	case $1 in
		# ---------------------------------------------------
		j)	echo ~/dev/src/github.com/freiny/docker-scripts/f-alpine/0;;
		# ---------------------------------------------------
		/|root)		echo "/";;
		tmp)		echo "/tmp";;
		etc)		echo "/etc";;
		app)		echo "/Applications";;
		users)		echo "/Users";;
		desk)		echo "$home/Desktop";;
		doc)		echo "$home/Documents";;
		lib)		echo "$home/Library";;
		down)		echo "$home/Downloads";;
		bin)		echo "$home/bin";;
		dev)		echo "$home/dev";;
		hub)		echo "$home/dev/src/github.com";;
		freiny|f)	echo "$home/dev/src/github.com/freiny";;
		local|l)	echo "$home/dev/src/github.com/freiny/_local";;
		# ---------------------------------------------------
		dock|docks)	echo "$home/dev/src/github.com/freiny/docker-scripts";;
		docki)		echo "$home/dev/src/github.com/freiny/_local/docker/images";;
		# ---------------------------------------------------
		conf)		echo "$home/dev/src/github.com/freiny/config";;
		bash)		echo "$home/dev/src/github.com/freiny/config/bash-host";;
		nano)		echo "$home/dev/src/github.com/freiny/config/nano";;
		# ---------------------------------------------------
		*|""|~|home) echo ~
	esac
}

j(){ cd "$(f $1)"; }

k(){
	local home=~

	case $1 in
		# ---------------------------------------------------
		link)			ln $2 $3/$2;;
		killAll)		killall -v -u $2 -c $3;;
		rmAll)			rm -rf $2;;
		clear)			printf "\033c";;
		findFile)		find . -name $2 -type f;;
		sudoFindFile) 	sudo find . -name $2 -type f;;
		findWord)		grep -rn $2 *;;
		sudoFindWord)	sudo grep -rn $2 *;;
		sha256)			shasum -a 256 $2;;
		nanobash)		nano $home/.bash_profile;;
		nanorc)			nano $home/.nanorc;;
		run|r)			go clean; go build -o main; chmod 744 main; ./main;;
		test|t)			go test;;
		rmds)			find . -name ‘*.DS_Store’ -type f -delete;;
		# ---------------------------------------------------
		serve)			 python -m SimpleHTTPServer;;
		clearCmdHistory) cat /dev/null > $home/.bash_history && history -c && exit;;
		colors)
		    export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
		    export CLICOLOR=1
		    export LSCOLORS=ExFxBxDxCxegedabagacad
		;;
		gitEditor)	git config --global core.editor "nano";;
		# ---------------------------------------------------
		*|"")	echo "Command Executor: k <Command>"
	esac
}
#****************************************
source $(f docks)/fdockerutil.sh
#****************************************
/()				{ cd /; }
.()				{ cd ./..; }
..()			{ cd ./../..; }
...()			{ cd ./../../..; }
....()			{ cd ./../../../..; }
l()				{ ls -a; }
ll()			{ ls -l; }
#****************************************
gs()	{ git status $1; }
ga()	{ git add $1; }
gc()	{ git commit $1; }
gd()	{ git diff $1; }
gl()	{ git log; }
gpom()	{ git push origin master; }
#****************************************
alias d="docker "
dr(){ docker run --name cname --user="dev" -it $1 bash --login; }

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
dvi(){ docker images -a; }
dvc(){ docker ps -a; }
dv(){
	echo
	docker images -a
	echo
	docker ps -a
	echo
}

db(){ docker build -t $1 .; }
#alias dc="docker-compose "
#****************************************
# INIT
k clear
k colors
k gitEditor
#****************************************
