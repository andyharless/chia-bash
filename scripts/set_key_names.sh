# Create an associative array that gives the text names for different accounts

# Assumes that the fingerprints are contained in symbols
# with the same names as the accounts

# For example if the account (key) with fingerprint 987654321 is called FARMING
#            and the account (key) with fingerprint 123456789 is called TRADING
# your configuration (e.g., defined in ~/.bashrc) should contain lines like
#   export FARMING=987654321
#   export TRADING=123456789

# After this script runs, $wallets[$FARMING] will contain the name FARMING

declare -A wallets
wallets=()

# $KEY_NAMES is an array defined in the configuration 
# For example ~/.bashrc might contain the following
# export KEY_NAMES=( FARMING TRADING )

for name in "${KEY_NAMES[@]}"
do
    thename="$name"
    wallets+=([${!thename}]="$name")
done

