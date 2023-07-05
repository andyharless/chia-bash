source $CHIA_SCRIPTS/assign_listed_wallets.sh

case $WALLET in

  $EXTRA | $ISSUANCE )
    echo
    echo "No offers directory set for this key"
    ;;

  $TRADING)
    OFFERS=toffers
    ;;

  $FARMING)
    OFFERS=foffers
    ;;
    
  *)
    echo
    echo -n "Error:  Unkown Wallet or Wallet/Key/Fingerprint not set"
    ;;

esac

if [[ -n $OFFERS ]]; then
    export OFFER_DIR=$CHIA_WORKING/$OFFERS
fi

