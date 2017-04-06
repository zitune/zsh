# Some exports
export INFRA=/home/hybris/dev/bearstech/bearstech/infra
export PATH=$INFRA/bin:$INFRA/../xen:$PATH

# Everyday aliases
bthost()	 {cat $INFRA/host/$1}
dom0()     {awk '/Container:/{ print $2}' ${INFRA}/host/${1}}
alerts()   {ssh root@pidou monshow | grep -v "none$" | grep -v "^     " | grep -v "^$"}
tickets()  {curl "https://maudin:$(/home/hybris/.scripts/keepcli -p Dashbeard)@dashbeard.bearstech.com/api/dashbeard.txt"}
vpn-bear() {for i in $(nmcli con | grep vpn | grep -v -- -- | cut -d' ' -f1); do nmcli con down $i; done; nmcli con up bearstech}

# Google Cloud
# The next line updates PATH for the Google Cloud SDK.
source '/home/hybris/dev/bearstech/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
source '/home/hybris/dev/bearstech/google-cloud-sdk/completion.zsh.inc'
