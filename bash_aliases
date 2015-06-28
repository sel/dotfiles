alias hf='history | grep -i $*'
alias backupgit='git archive --format zip -o "../$( basename $( pwd ) )_$( git rev-parse --short HEAD ).zip" master'
