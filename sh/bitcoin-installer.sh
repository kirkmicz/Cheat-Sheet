#!/bin/bash
# Init
FILE="/tmp/out.$$"
GREP="/bin/grep"
#....
# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

function startbitcoind {
  bitcoind -daemon
  if [ $? -eq 0 ]; then
    echo "Bitcoind Started Successfully"
  else
    echo "Fail to start bitcoin"
  fi
}

function stopbitcoind {
  bitcoin-cli stop
  if [ $? -eq 0 ]; then
    echo "Bitcoind Stopped Successfully"
  else
    echo "Fail to stop bitcoin"
  fi
}

cat <<"EOF"
oooooooooo.   o8o      .                        o8o                    .o8
`888'   `Y8b  `"'    .o8                        `"'                   "888
 888     888 oooo  .o888oo  .ooooo.   .ooooo.  oooo  ooo. .oo.    .oooo888
 888oooo888' `888    888   d88' `"Y8 d88' `88b `888  `888P"Y88b  d88' `888
 888    `88b  888    888   888       888   888  888   888   888  888   888
 888    .88P  888    888 . 888   .o8 888   888  888   888   888  888   888
o888bood8P'  o888o   "888" `Y8bod8P' `Y8bod8P' o888o o888o o888o `Y8bod88P"

ooooo                          .             oooo  oooo
`888'                        .o8             `888  `888
 888  ooo. .oo.    .oooo.o .o888oo  .oooo.    888   888   .ooooo.  oooo d8b
 888  `888P"Y88b  d88(  "8   888   `P  )88b   888   888  d88' `88b `888""8P
 888   888   888  `"Y88b.    888    .oP"888   888   888  888ooo888  888
 888   888   888  o.  )88b   888 . d8(  888   888   888  888    .o  888
o888o o888o o888o 8""888P'   "888" `Y888""8o o888o o888o `Y8bod8P' d888b
)"
EOF

sleep 3

cat <<EOT
===========================================
======== Adding Bitcoin Repository ========
===========================================
EOT
apt-add-repository ppa:bitcoin/bitcoin -y
wait $!

cat <<EOT
===========================================
============= Updating system =============
===========================================
EOT
apt-get update -y
wait $!

cat <<EOT
===========================================
============ Upgrading system =============
===========================================
EOT
apt-get upgrade -y
wait $!

cat <<EOT
===========================================
============= Install Bitcoind ============
===========================================
EOT
apt-get install bitcoind -y
wait $!

cat <<EOT
===========================================
============ Checking Bitcoind ============
===========================================
EOT

startbitcoind
sleep 8

echo "Stopping Bitcoin to create bitcoin.conf"
stopbitcoind
wait $!

cat <<EOT
===========================================
========== Creating bitcoin.conf ==========
===========================================
Please enter what is needed.
EOT

echo "rpcport (only number): ";
read rpcport;

echo "rpcuser (a-z A-Z): ";
read rpcuser;

echo "rpcpassword (a-z A-Z): ";
read rpcpassword;

echo "testnet (1 or 0): ";
read testnet;

touch ~/.bitcoin/bitcoin.conf

cat <<EOT >> ~/.bitcoin/bitcoin.conf
server=1
whitelist=127.0.0.1
txindex=1
addressindex=1
timestampindex=1
spentindex=1
testnet=$testnet
rpcport=$rpcport
rpcallowip=127.0.0.1
rpcuser=$rpcuser
rpcpassword=$rpcpassword
EOT

cat <<EOT
===========================================
============ Checking Bitcoind ============
===========================================
EOT

startbitcoind

cat <<"EOF"
oooooooooo.                                        .o.
`888'   `Y8b                                       888
 888      888  .ooooo.  ooo. .oo.    .ooooo.       888
 888      888 d88' `88b `888P"Y88b  d88' `88b      Y8P
 888      888 888   888  888   888  888ooo888      `8'
 888     d88' 888   888  888   888  888    .o      .o.
o888bood8P'   `Y8bod8P' o888o o888o `Y8bod8P'      Y8P


EOF
