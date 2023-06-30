cd $CHIA_WORKING

if [ -n $ALTROOT ]; then
    export CHIA_ROOT=$ALTROOT
fi

export WALLET=${1-$DEFAULT_KEY}

if [[ $# -ne 1 ]]; then
  chia start node
  chia start wallet
  sleep 10
fi

source $CHIA_SCRIPTS/start.sh
source $CHIA_CONFIG/assign_wallets.sh

