"""
Extract list of short wallet names (i.e., asset symbols like USDS
that qualify to be used as environment variables in bash) from output of 
`$CHIA_SCRIPTS/show.sh ids`
(which uses `chia wallet show` to list the wallet information and processes
the results using `sed` to extract just the names and wallet ID numbers)

Output of this script is a partial shell script to generate the list of names
"""

import sys
import re

PERLINE = 10  # number of names to add to list in one line of output

nftn = 0  # sequence number for NFT wallets
didn = 0  # sequence number for DID wallets

scratch = ''  # A throwaway name in the namespace to assign stuff to

# `others` is a user-specific dictionary for adding to the wallet list
# when the actual wallet name doesn't follow any standard convention.
# A key represents a unique substring to be found in the wallet name.
# The value is a 3-tuple from which to construct the listed name.
# The first element is the stem of the name (e.g. in this case 'DID')
# The second element is the name of a variable whose ultimate value
#   should be concatenated to the end of stem.
# The third element is a function to call and assign to the
#   named variable before doing the concatenation.
others = {
         'Kaanos': ('DID', "didn", lambda: didn + 1),
         'Pool w': ('POOL', "scratch", lambda: '')
         }


print('WALLET_LIST=(', end=" ")
with open(sys.argv[1]) as f:
    offset = 0
    for i, line in enumerate(f):
        if len(line) > 2:
            j = int(not(i)) or int(line[:3])  # Zero for 1st line, else symbol
            while i and i + offset < j:  # Fill in dummy name for missing numbers
                print('EMPTY', end=" ")  #   in the wallet ID sequence
                offset += 1
            parens = re.search('\(.*\)', line)  # Find parenthesized asset symbol
            if parens is not None:
                name = parens.group(0)[1:-1]    # Extract what's between the parens
                if name[:6] == 'TIBET-':	# Rename TIBET Liquidity assets to
                     name = name.split('-')[1] + '_LIQ'  # to have bash-compatible names
                print(name, end=" ")		# Add name to list
            elif re.search('\sdid:chia', line): # DID wallets named DIDn, where
                didn += 1                       #   n is a sequence number
                print(f'DID{didn}', end=" ")
            elif re.search('NFT', line):        # NFT wallets named NFTn, where
                nftn += 1                       #   n is a sequence number
                print(f'NFT{nftn}', end=" ")
            elif any([re.search(s, line) for s in others]):  # Look in `others`
                for result in [re.search(s, line) for s in others]:
            	    if result is not None:      
            	        match = result.group(0)  # Use this match as a key
            	        name, varname, func = others[match]  # Unpack tuple
            	        globals()[varname] = func()  # Assign function to var
            	        print(f'{name}{globals()[varname]}', end=" ")  # Add to list
            elif i:  # Can't find any appropriate name to add to list, use a dummy
                print('NOSYM', end=" ")
        if not (i + 1) % PERLINE:   # Divide output into lines at every PERLINE input lines
            print(')\nWALLET_LIST+=(', end=" ")
print(')')
