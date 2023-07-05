declare -A ids
FROM_AMOUNT=$1
FROM_SYMBOL=$2
FROM_ID=${WALLET_IDS[$FROM_SYMBOL]}
TO_AMOUNT=$3
TO_SYMBOL=$4
TO_ID=${WALLET_IDS[$TO_SYMBOL]}
echo chia wallet make_offer -f $WALLET \
-o $FROM_ID:$FROM_AMOUNT \
--request $TO_ID:$TO_AMOUNT \
-p $OFFER_DIR/$FROM_AMOUNT${FROM_SYMBOL}_x_$TO_AMOUNT${TO_SYMBOL}.offer \
-m $FEE
chia wallet make_offer -f $WALLET \
-o $FROM_ID:$FROM_AMOUNT \
--request $TO_ID:$TO_AMOUNT \
-p $OFFER_DIR/$FROM_AMOUNT${FROM_SYMBOL}_x_$TO_AMOUNT${TO_SYMBOL}.offer \
-m $FEE