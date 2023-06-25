# Script to show wallet information

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
ids+=([CTK]="(CTK)" [TIBET-BIGD]=TIBET-BIGD)

if [[ $FROM_SYMBOL == "" ]]; then
    # Show all assets
    chia wallet show -f $WALLET
else
    # Show only the asset we want to know about
    ASSET=${ids[$FROM_SYMBOL]}
    chia wallet show -f $WALLET | grep "$ASSET" -A 6
fi
