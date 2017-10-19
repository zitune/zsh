# Some exports
export INFRA=/home/hybris/dev/bearstech/bearstech/infra
export PATH=$INFRA/bin:$INFRA/../xen:$PATH

# Everyday aliases
bt-alerts()     {ssh root@pidou monshow | grep -v "none$" | grep -v "^     " | grep -v "^$"}
bt-dom0()       {awk '/Container:/{ print $2}' ${INFRA}/host/${1}}
bt-each()       {$INFRA/bin/foreach $@}
bt-host()       {cat $INFRA/host/$1}
bt-tickets()    {echo "Tickets:$(curl -s "https://maudin:$(/home/hybris/.scripts/keepcli -p Dashbeard)@dashbeard.bearstech.com/api/dashbeard.txt")"}
bt-vpn()        {for i in $(nmcli con | grep vpn | grep -v -- -- | cut -d' ' -f1); do nmcli con down $i; done; nmcli con up bearstech}

# Google Cloud
# The next line updates PATH for the Google Cloud SDK.
source '/home/hybris/dev/bearstech/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
source '/home/hybris/dev/bearstech/google-cloud-sdk/completion.zsh.inc'

# OVH cloud
nova-env()      {source $INFRA/cloud/ovh-$1.env}
nova-list()     {ls $INFRA/cloud/ovh-*.env | sed "s@$INFRA/cloud/ovh-\(.*\).env@\1@"}
