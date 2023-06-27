# Script to add liquidity for an asset on TibetSwap

# This should run in a TibetSwap virtualenv with TibetSwap installed
# Token amount is in mojo units, so 1000 x the number of tokens.
# In addition to having enough tokens to cover the add,
#   you must have enough XCH to match the token amount at the current price,
#   and you must have a wallet set up for the liquidty token

# Example:

# TibetSwap virtualenv
#    $ cd tibet
#    $ . venv/bin/activate

# Set up wallet for liquidity token if not already
#    $ export DBX_LIQ_ID=f7a975340fe224ed6e32467e4cf7ce544c9ddfc1079fc6d0e34e960dc64dbb90
#    $ export NAME="DBX Liquidity (TIBET-DBX-XCH)"
#    $ addtoken
#    Successfully added DBX Liquidity (TIBET-DBX-XCH) with wallet id 99 on key 123456789

# Add liquidity
#    $ addliq 49938 $DBX_ID
#    Depositing liquidity...
#    Current pair coin id: cdcefad94c4116e856d7f2c44dce67d70b7e31751aaac8ca3b8c83e90ac0f55e
#    Generating new offer...
#    Liquidity asset id: f7a975340fe224ed6e32467e4cf7ce544c9ddfc1079fc6d0e34e960dc64dbb90
#    Offer successfully generated and saved to offer.txt.
#    Are you sure you want to broadcast this spend? (Yes): Yes
#    Pushing tx...
#    {'status': 'SUCCESS', 'success': True}
#    Enjoy your lp fees!

python3 tibet.py deposit-liquidity --token-amount $1 --push-tx --asset-id $2
