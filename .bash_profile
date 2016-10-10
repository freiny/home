#****************************************
cd ~
#****************************************
export GOPATH=~/dev
export PATH=$PATH:~/bin
export PATH=$PATH:~/dev/bin
export PATH=$PATH:/usr/local/go/bin

. ~/.bash_profile.folder
. ~/.bash_profile.cmd
. ~/.bash_profile.new
. ~/.bash_profile.git
. ~/.bash_profile.docker
. ~/.bash_profile.erlang
#****************************************
alias nb="nano ~/.bash_profile "
alias res="exec bash --login "
alias reset="exec bash --login "
#****************************************
/()        { cd /; }
.()        { cd ./..; }
..()      { cd ./../..; }
...()      { cd ./../../..; }
l()        { ls -a; }
ll()      { ls -l; }
#****************************************
# INIT
k clear
k colors
k gitEditor
#****************************************

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f /Users/name/dev/src/github.com/freiny/koderkave-fe-conf/gcp-sdk/google-cloud-sdk/path.bash.inc ]; then
#   source '/Users/name/dev/src/github.com/freiny/koderkave-fe-conf/gcp-sdk/google-cloud-sdk/path.bash.inc'
# fi
#
# # The next line enables shell command completion for gcloud.
# if [ -f /Users/name/dev/src/github.com/freiny/koderkave-fe-conf/gcp-sdk/google-cloud-sdk/completion.bash.inc ]; then
#   source '/Users/name/dev/src/github.com/freiny/koderkave-fe-conf/gcp-sdk/google-cloud-sdk/completion.bash.inc'
# fi
