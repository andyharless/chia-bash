# Log into a fingerprint and sync it

# The fingerprint to use is defined by the $WALLET environment variable
# (I usually have multiple 'terminals' open with different $WALLET settings.)

source $CHIA_SCRIPTS/set_key_names.sh  # defines 'wallets' array

chia rpc wallet log_in '{"fingerprint": '$WALLET'}' | grep success

synced=false
echo Syncing wallet ${wallets[$WALLET]}
while [[ $synced != *true* ]]; do
    sleep 5
    synced=$(chia rpc wallet get_sync_status | grep synced)
    echo .
done
echo $synced
