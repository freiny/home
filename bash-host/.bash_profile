#****************************************
export GOPATH=~/dev
export PATH=$PATH:~/bin
export PATH=$PATH:~/dev/bin
export PATH=$PATH:/usr/local/go/bin
#****************************************
alias dk="docker "
alias dc="docker-compose "
#****************************************
# Folder Echo: f <Folder Abbreviation> <Sub-Folder>
f(){
	local home=~

	case $1 in
		# ---------------------------------------------------
		j)	echo ~/dev/src/github.com/freiny/docker-scripts/f-alpine/0;;
		# ---------------------------------------------------
		/|root)		echo "/$2";;
		tmp)		echo "/tmp/$2";;
		etc)		echo "/etc/$2";;
		app)		echo "/Applications/$2";;
		users)		echo "/Users/$2";;
		desk)		echo "$home/Desktop/$2";;
		doc)		echo "$home/Documents/$2";;
		lib)		echo "$home/Library/$2";;
		down)		echo "$home/Downloads/$2";;
		bin)		echo "$home/bin/$2";;
		dev)		echo "$home/dev/$2";;
		hub|github)	echo "$home/dev/src/github.com/$2";;
		freiny|f)	echo "$home/dev/src/github.com/freiny/$2";;
		local|l)	echo "$home/dev/src/github.com/freiny/_local/$2";;
		# ---------------------------------------------------
		scripts|docks|dock)	echo "$home/dev/src/github.com/freiny/docker-scripts/$2";;
		images|docki)		echo "$home/dev/src/github.com/freiny/_local/docker/images/$2";;
		# ---------------------------------------------------
		conf)		echo "$home/dev/src/github.com/freiny/config/$2";;
		bash)		echo "$home/dev/src/github.com/freiny/config/bash-host/$2";;
		nano)		echo "$home/dev/src/github.com/freiny/config/nano/$2";;
		alpine)		echo "$home/dev/src/github.com/freiny/docker-scripts/alpine/$2";;
		f-alpine)	echo "$home/dev/src/github.com/freiny/docker-scripts/f-alpine/$2";;
		f-go)		echo "$home/dev/src/github.com/freiny/docker-scripts/f-go/$2";;
		# ---------------------------------------------------
		-help|--help|-h|--h)	echo "Folder Echo: f <Folder Abbreviation> <Sub-Folder>";;
		# ---------------------------------------------------
		""|~|home)	echo ~/$2;;
		.)			echo $2;;
		*)			echo $1
	esac
}
# ================================
# Jump To Folder: j <Folder Abbreviation> <Sub-Folder>
j(){
	case $1 in
		-help|--help|-h|--h)	echo "Jump To Folder: j <Folder Abbreviation> <Sub-Folder>";;
		*)						cd "$(f $1 $2)";
	esac
}

# ================================
# Custom Command Executor: k <Command>
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
		newScript)	touch $2; echo "#!/bin/bash" >> $2; chmod 744 $2; nano $2;;
		# ---------------------------------------------------
		*|"")	echo "Custom Command Executor: k <Command>"
	esac
}
# ================================
# Docker Custom Command Executor: d <Command>
d(){
	local home=~

	case $1 in
		# ---------------------------------------------------
		load)	dLoad $2 $3 $4 $5;;
		run)	docker run -it $2 /bin/bash;;
		rm)		rmia;;
		rmi)	rmi $2 $3;;
		RMI)	RMI $2 $3;;
		vi)		docker images -a;;
		vc)		docker ps -a;;
		v)		echo
				docker images -a
				echo
				docker ps -a
				echo
				;;
		cc)		docker stop $(docker ps -a -q)
				docker rm $(docker ps -a -q)
				docker rmi $(docker images -f "dangling=true" -q)
				;;
		ci)		docker rm -f $1
				docker rmi -f $1
				docker rmi -f $(docker images -a | grep "<none>" | cut "-c41-52")
				;;
		c)		docker stop $(docker ps -a -q)
				docker rm $(docker ps -a -q)
				docker rmi $(docker images -f "dangling=true" -q)
				docker rm -f $1
				docker rmi -f $1
				docker rmi -f $(docker images -a | grep "<none>" | cut "-c41-52")
				;;
		dr)		docker run --name cname --user="dev" -it $2 bash --login;;
		db)		docker build -t $2 .;;
		# ---------------------------------------------------
		*|"")	echo "Docker Custom Command Executor: d <Command>"
	esac
}

#****************************************
g(){
	local home=~

	case $1 in
		# ---------------------------------------------------
		s)		git status $2;;
		a)		git add $2;;
		c)		git commit $2;;
		d)		git diff $2;;
		l)		git log;;
		pom)	git push origin master;;
		# ---------------------------------------------------
		*|"")	echo "Git Custom Command Executor: g <Command>"
	esac
}

#****************************************
source $(f docks)/fdockerutil.sh
#****************************************
/()				{ cd /; }
.()				{ cd ./..; }
..()			{ cd ./../..; }
...()			{ cd ./../../..; }
l()				{ ls -a; }
ll()			{ ls -l; }
#****************************************
# INIT
k clear
k colors
k gitEditor
#****************************************
