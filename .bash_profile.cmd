#!/bin/bash

# ================================
# Custom Command Executor: k <Command>
k(){
  case $1 in
    # ---------------------------------------------------
    link)      ln $2 $3/$2;;
    killAll|ka)    killall -v -u $(whoami) -c $2;;
    killAll|ka)    killall -v -u $(whoami) -c $2;;
    rmAll)      rm -rf $2;;
		rmGlob)
			for each in ./$2; do
				rm $each
			done
		;;
    clear|c)      printf "\033c";;
		restart|reset|r)  . ~/.bash_profile;;
    cm)        chmod 744 $2;;
    ps)        ps -a;;
    findFile)    find . -name $2 -type f;;
    sudoFindFile)   sudo find . -name $2 -type f;;
    findWord)    grep -rn $2 *;;
    sudoFindWord)  sudo grep -rn $2 *;;
    sha256)      shasum -a 256 $2;;
    nanobash)    nano ~/.bash_profile;;
    nanorc)      nano ~/.nanorc;;
    run|r)      go clean; go build -o main; chmod 744 main; ./main;;
    test|t)      go test;;
    rmds)      find . -name ‘*.DS_Store’ -type f -delete;;
    # ---------------------------------------------------
    serve)       python -m SimpleHTTPServer;;
    clearCmdHistory) cat /dev/null > ~/.bash_history && history -c && exit;;
    colors)
        export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
        export CLICOLOR=1
        export LSCOLORS=ExFxBxDxCxegedabagacad
    ;;
    gitEditor)  git config --global core.editor "nano";;
    # ---------------------------------------------------
    new-sh)  touch $2; echo "#!/bin/bash" >> $2; chmod 744 $2; nano $2;;
    # ---------------------------------------------------
    *|"")  echo "Custom Command Executor: k <Command>"
  esac
}
