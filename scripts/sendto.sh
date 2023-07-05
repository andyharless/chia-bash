# Example:
#   alias sendto="source $CHIA_SCRIPTS/sendto.sh"
#   $AMOUNT=1
#   $ASSET_WALLET=$USDS
#   $TO_ADDRESS=$FARMING_RECEIVE_ADDRESS
#   sendto $TO_ADDRESS $AMOUNT $ASSET_WALLET

echo
echo Sending $2 of ${WALLET_LIST[$3-1]} to the following address:
echo $1
echo
echo chia wallet send -f $WALLET -t $1 -a $2 -i $3 -m $FEE
echo
echo Enter to continue, ^C to abort
read
chia wallet send -f $WALLET -t $1 -a $2 -i $3 -m $FEE
