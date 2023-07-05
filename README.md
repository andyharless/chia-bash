# chia-bash
Shell scripts to use with Chia CLI (and some RPC)

The main purpose is for using multiple accounts (keys, fingerprints) on the same computer.  The general idea is to have a separate terminal window open for each account you are using and have separate environment settings in each such window to hold information about the relevant account.   That way you don't have to keep remembering information specific to each account when you issue CLI commands.  In particular:
- [scripts/open.sh](scripts/open.sh) associates an environemnt with a specific fingerprint
- [scripts/start.sh](scripts/start.sh) re-syncs the wallet for the fingerprint already associated with the current window
  
and the rest of the scripts mostly use these associations to perform CLI activities involving CATs.

It's largely a matter of my being too lazy to type out whole CLI commands.
