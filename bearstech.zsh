# Some exports
export INFRA=/home/zitune/dev/bearstech/infra
export PATH=$INFRA/bin:$PATH

# Everyday aliases
monshow()    {ssh root@pidou monshow | grep -v "none$" | grep -v "^     " | grep -v "^$"}
dom0()       {awk '/Container:/{ print $2}' ${INFRA}/host/${1}}
beach()      {$INFRA/bin/foreach $@}
bhost()      {cat $INFRA/host/$1}
bdebian()    {ssh root@$1 cat /etc/debian_version}
btickets()   {echo "Tickets:$(curl -s "https://maudin:$(/home/zitune/.scripts/keepcli -p Dashbeard)@dashbeard.bearstech.com/api/dashbeard.txt")"}
bssh()       {ssh -A root@$1}
r()          {ssh -A root@$1}

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
_complete_allhost()   {reply=($(ls $INFRA/host $ZINFRA/host))}
_complete_nova-env()  {reply=($(ls $INFRA/cloud/ovh-*.env | sed "s@$INFRA/cloud/ovh-\(.*\).env@\1@"))}
compctl -K _complete_bhost  dom0
compctl -K _complete_bhost  bhost
compctl -K _complete_allhost  bdebian
compctl -K _complete_allhost  bssh
compctl -K _complete_allhost  r

