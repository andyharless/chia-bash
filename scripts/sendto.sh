# Example:
#   $AMOUNT=1
#   $ASSET_WALLET=$USDS
#   $TO_ADDRESS=$FARMING_RECEIVE_ADDRESS
#   sendto $TO_ADDRESS $AMOUNT $ASSET_WALLET

chia wallet send -f $WALLET -t $1 -a $2 -i $3 -m $FEE
