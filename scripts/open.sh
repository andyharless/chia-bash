# Associate a specified account (i.e., fingerprint)
# with the current environment (i.e., terminal window)
# and sync the wallet for that fingerprint.

# If no fingerprint is specified,
# start a new node and wallet
# and use a default fingerprint

# If an extra argument is given,
# start a new node and wallet
# and use the fingerprint specified
# in the first argument


cd $CHIA_WORKING


if [ -n "$ALTROOT" ]; then
    echo "Setting CHIA_ROOT"
    export CHIA_ROOT=$ALTROOT
fi

export WALLET=${1-$DEFAULT_KEY}

if [[ $# -ne 1 ]]; then
  echo "Starting node and wallet"
  chia start node
  chia start wallet
  sleep 10
fi

source $CHIA_CONFIG/assign_wallets.sh

