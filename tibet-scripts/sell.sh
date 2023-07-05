# Script to sell a CAT for XCH on TibetSwap

# This should run in a TibetSwap virtualenv with TibetSwap installed
# Token amount is in mojo units, so 1000 x the number of tokens.


# Example:

# Alias
#    $ alias sell="$TIBET_SCRIPTS/sell.sh"

# TibetSwap virtualenv
#    $ cd tibet
#    $ . venv/bin/activate

# Sell token
#    $ export PEPE_ID=ec9d874e152e888231024c72e391fc484e8b6a1cf744430a322a0544e207bf46
#    $ sell 238248658 $PEPE_ID
#    Swapping token for XCH...
#    Current pair coin id: 30fe41de82bd89c0cdacc3a26f6605dc5d7c94557da0a2acc49a75ed91b4aefe
#    Generating new offer...
#    Liquidity asset id: a36680b5ac48be3bb816ff99a0e64b278061c193242d6d60622c70b0c6fe80b7
#    You'll receive 0.684914940021 XCH from this trade.
#    Offer successfully generated and saved to offer.txt.
#    Pair state updated since last sync; saving it...
#    Are you sure you want to broadcast this spend? (Yes): Yes
#    Pushing tx...
#    {'status': 'SUCCESS', 'success': True}
#    Enjoy your shiny new mojos!


python3 tibet.py token-to-xch --token-amount $1 --asset-id $2 --push-tx
