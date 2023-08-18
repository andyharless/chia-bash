# Script to show wallet information

# Example:
#    $ alias show="source $CHIA_SCRIPTS/show.sh"
#    $ export WALLET=$MYWALLET
#    $ show USDS
#    Wallet is MYWALLET
#    Stably USD (USDS):
#       -Total Balance:         18.509  (18509 mojo)
#       -Pending Total Balance: 18.509  (18509 mojo)
#       -Spendable:             0.0  (0 mojo)
#       -Type:                  CAT
#       -Asset ID:              6d95dae356e32a71db5ddcb42224754a02524c615c5fc35f568c2af04774e589
#       -Wallet ID:             3


# Identify current fingerprint
source $CHIA_SCRIPTS/wallet.sh

FROM_SYMBOL=$1

# Array that associates asset symbols with wallet names
# (Some of the wallet names are specific to my own naming conventions.)
declare -A ids
ids=()
ids+=([XCH]="Chia W" [CKPO]=CKPO [SBX]=Spacebucks [LKY8]=LKY8 [USPP]=USPP [CAT]="CatCoin" [CSH]=CSH)
ids+=([ROSE]=ROSE [CH21]=Holiday [STDG]=StellaCoin [MRMT]=Marmot [USDS]="Stably USD" [MJV]=Mojodice [XIP]=XIP)
ids+=([STAR]=STAR [HAT]=HAT [ASTR]=ASTR [TT22M]=TT22M [NOT1]=NOT1 [KOAM]=KOAM)
ids+=([NGDPLT]="US NGDP" [INGDP]="Inverse NGDP" [NKDE]="(NKDE)")
ids+=([CRAP]=CRAP [TIBET-USDS]=TIBET-USDS [TIBET-STDG]=TIBET-STDG)
ids+=([TIBET-NGDPLT]=TIBET-NGDPLT [TIBET-INGDP]=TIBET-INGDP)
ids+=([TIBET-NKDE]=TIBET-NKDE [PEPE]="(PEPE)" [TIBET-PEPE]=TIBET-PEPE)
ids+=([DBX]="(DBX)" [MIO]="(MIO)" [BIGD]="(BIGD)" [TIBET-MIO]=TIBET-MIO)
ids+=([PUMP]="(PUMP)" [TIBET-PUMP]=TIBET-PUMP [INCL4]="(INCL4)" [TIBET-INCL4]=TIBET-INCL4)
ids+=([CTK]="(CTK)" [TIBET-BIGD]=TIBET-BIGD [TIBET-CTK]=TIBET-CTK)

if [[ $FROM_SYMBOL == "" ]]; then
    # Show infromation for all assets
    chia wallet show -f $WALLET
elif [[ $FROM_SYMBOL == ids ]]; then
    # Show only Wallet IDs for all assets
    echo > temp.txt
    echo >> temp.txt
    echo "Chia (XCH):" >> temp.txt
    chia wallet show -f $WALLET | grep "Wallet ID" -A 2 | \
    sed -e 's/   -Wallet ID:            //g' -e "s/--//g" -e "/^$/d" -e '$d' >> temp.txt
    cat temp.txt | sed -e '{N;s/\n//;}' | sed -r -e "s/(.*)([^\n]{2})$/\2\ \1/" -e '/^$/d'
else
    # Show information for only the asset we want to know about
    ASSET=${ids[$FROM_SYMBOL]}
    chia wallet show -f $WALLET | grep "$ASSET" -A 6
fi
