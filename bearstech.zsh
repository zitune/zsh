# Some exports
export INFRA=/home/zitune/dev/bearstech/infra
export INFRABIN=$INFRA/bin
export PATH=$INFRABIN:$PATH

# Everyday aliases
monshow()    {ssh root@pidou monshow | grep -v "none$" | grep -v "^     " | grep -v "^$"}
dom0()       {awk '/Container:/{ print $2}' ${INFRA}/host/${1}}
bhost()      {cat $INFRA/host/$1}
bdebian()    {ssh root@$1 cat /etc/debian_version}
btickets()   {echo "Tickets:$(curl -s "https://maudin:$(/home/zitune/.scripts/keepcli -p Dashbeard)@dashbeard.bearstech.com/api/dashbeard.txt")"}
bssh()       {ssh -A root@$1}
rssh()          {ssh -A root@$1}

alias r='bssh'


#foreach :

beach()      {$INFRABIN/foreach $@}
veach()      {INFRA=$VINFRA beach $@}
alias updateall='veach -f type=host $INFRABIN/apt-mass'
alias upgradeall='veach -f type=host $INFRABIN/apt-mass --upgrade --ack docker-ce'


#aliases
alias monshow='ssh root@pidou monshow'

# Google Cloud
# The next line updates PATH for the Google Cloud SDK.
#source '/home/zitune/dev/bearstech/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
#source '/home/zitune/dev/bearstech/google-cloud-sdk/completion.zsh.inc'

hh() {
    while (($#))
  do
	echo "$1 :"
	host ${${1##https#://}%%/*} | sed -n -e /'.*'/P -e s@"^.* has address \(.*\)$"@"host \1"@ep
	echo
	shift
    done
}


# Some completion functions
_complete_bhost()   {reply=($(ls $INFRA/host))}
_complete_allhost()   {reply=($(ls $INFRA/host $VINFRA/host))}
_complete_nova-env()  {reply=($(ls $INFRA/cloud/ovh-*.env | sed "s@$INFRA/cloud/ovh-\(.*\).env@\1@"))}
compctl -K _complete_bhost  dom0
compctl -K _complete_bhost  bhost
compctl -K _complete_allhost  bdebian
compctl -K _complete_allhost  bssh
compctl -K _complete_allhost  rssh

#Git
alias pull='git pull --rebase'
alias push='git push'
alias fetch='git fetch --all --tags'



#alias vfor='INFRA=$VINFRA btfor'

# Vagrant
alias Vinit='vagrant snapshot restore init --provision --no-start && vagrant reload'
alias Vreset='vagrant destroy -f && vagrant up && vagrant snapshot save init -f && vagrant reload'

# VFactory
alias VFinit='Vinit && ./scripts/tools/ping_all_vagrant_once.sh && ./factory-cli vagrant deploy -vv site.yml'
alias VFreset='Vreset && ./scripts/tools/ping_all_vagrant_once.sh && ./factory-cli vagrant deploy -vv site.yml'


# Registry
alias bregistry='cat ~/.secret/registry.bearstech.com | docker login -u oandre@bearstech.com --password-stdin registry.bearstech.com'

