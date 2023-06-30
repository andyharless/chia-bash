# Add a new token to a key

# Export the following before running:

# WALLET=fingerprint (e.g. $FARMING)
# ID=Asset ID (e.g. $USDS_ID)
# NAME=Asset wallet name (e.g. "Stably USD (USDS)")

chia wallet add_token -f $WALLET -id $ID -n "$NAME"
