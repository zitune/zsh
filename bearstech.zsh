# Some exports
export INFRA=/home/zitune/dev/bearstech/bearstech/infra
export PATH=$INFRA/bin:$INFRA/../xen:$PATH

# Everyday aliases
bt-alerts()     {ssh root@pidou monshow | grep -v "none$" | grep -v "^     " | grep -v "^$"}
bt-dom0()       {awk '/Container:/{ print $2}' ${INFRA}/host/${1}}
bt-each()       {$INFRA/bin/foreach $@}
bt-host()       {cat $INFRA/host/$1}
bt-release()    {ssh root@$1 cat /etc/debian_version}
bt-tickets()    {echo "Tickets:$(curl -s "https://maudin:$(/home/zitune/.scripts/keepcli -p Dashbeard)@dashbeard.bearstech.com/api/dashbeard.txt")"}

# Google Cloud
# The next line updates PATH for the Google Cloud SDK.
source '/home/zitune/dev/bearstech/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
source '/home/zitune/dev/bearstech/google-cloud-sdk/completion.zsh.inc'

# OVH cloud
nova-env()            {source $INFRA/cloud/ovh-$1.env}

# Some completion functions
_complete_bt-host()   {reply=($(ls $INFRA/host))}
_complete_nova-env()  {reply=($(ls $INFRA/cloud/ovh-*.env | sed "s@$INFRA/cloud/ovh-\(.*\).env@\1@"))}
compctl -K _complete_bt-host  bt-dom0
compctl -K _complete_bt-host  bt-host
compctl -K _complete_bt-host  bt-release
compctl -K _complete_nova-env nova-env
