# Extract wallet IDs and asset names from results of "chia wallet show" command
#   and use those to set environment variables and arrays that will be used
#   to access asset wallets by name

declare -A WALLET_IDS
declare -i counter

source $CHIA_SCRIPTS/show.sh ids > temp_idlist.txt
python $CHIA_SCRIPTS/extract_wallet_list.py temp_idlist.txt > temp_set_wallet_ids.txt
source temp_set_wallet_ids.txt

counter=0
for name in "${WALLET_LIST[@]}"
do
    thename="$name"
    counter+=1
    # Need to put in conditional if $thename ends with _LIQ, change to prefix with TIBET
    if [[ ${thename#*_} == LIQ ]]; then
        local_name=${thename%_*}
        thename=TIBET-$local_name
    fi
    WALLET_IDS[$thename]="$counter"
    export $name=$counter
done

export WALLET_IDS
export WALLET_LIST

