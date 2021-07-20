#!/bin/bash
# A utility I made to make configuring ssh tunnels easier

# ssh-ports proxy (proxy all traffic)
# ssh-ports local (make a remote port viewable on your local machine)
# ssh-ports remote (open a port locally to the outside world through ssh)

#if [$1 = "proxy"]
#  ssh -D 
#fi

echo "If command fails, look up documentation and after make an issue."

ARG=$1
echo $ARG

if [ $ARG = "local" ] 
then
  exec ssh -v -N -L $2:127.0.0.1:$2 proxy
fi

if [ $ARG = "proxy" ]; then
  
  exec ssh -v -N -D 127.0.0.1:$2 proxy
fi