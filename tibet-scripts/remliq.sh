# Script to remove liquidity from an asset on TibetSwap

# This should run in a TibetSwap virtualenv with TibetSwap installed

# Liquidity token amount (first argument) is in mojo units, so 
#    1000 x the number of liquidity tokens, using the standard convention.
# Also note that the asset-id (second argument) is for the underlying token,
#    not for the liquidity token.

# Example:

# Alias
#    $ alias remliq="$TIBET_SCRIPTS/remliq.sh"

# TibetSwap virtualenv
#    $ cd tibet
#    $ . venv/bin/activate

# Remove liquidity
#    $ export PEPE_ID=ec9d874e152e888231024c72e391fc484e8b6a1cf744430a322a0544e207bf46
#    $ remliq 200000000 $PEPE_ID
#    Removing liquidity...
#    Current pair coin id: 5db3c0d08354e1e3d7f3f99d31808b16acecccd2955d5f2eb9758a9f377f051a
#    Generating new offer...
#    Liquidity asset id: a36680b5ac48be3bb816ff99a0e64b278061c193242d6d60622c70b0c6fe80b7
#    Offer successfully generated and saved to offer.txt.
#    Pair state updated since last sync; saving it...
#    Are you sure you want to broadcast this spend? (Yes): Yes
#    Pushing tx...
#    {'status': 'SUCCESS', 'success': True}
#    We're extremely sorry to see your liquidity go :(

python3 tibet.py remove-liquidity --liquidity-token-amount $1 --asset-id $2 --push-tx
