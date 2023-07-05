# Identify name of fingerprint for current environment

# Example:
#   $ alias wallet="source $CHIA_SCRIPTS/wallet.sh"
#   $ wallet
#   Wallet is FARMING

if [[ $WALLET == "" ]]; then
    echo Wallet is not set.
else
    source $CHIA_SCRIPTS/set_key_names.sh
    echo Wallet is ${wallets[$WALLET]}
fi
