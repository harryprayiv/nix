#!/run/current-system/sw/bin/bash

################################################################################
#                         Implement Nix Configuration                          #
#                                                                              #
#            launchg a cardano node and populate all parameters                #
#                                                                              #
#  Change History                                                              #
#   3/28/2022                       Harry Pray IV          Original code       #
#                                                                              #
################################################################################
#                                                                              #
#  Open Fucking Source, bitch!                      2022 Harry Pray IV         #
#                                                                              #
################################################################################


echo "Switching Nixos Config:"
echo " "
sudo cp configuration.nix /etc/nixos/configuration.nix 
sudo cp hardware-configuration.nix /etc/nixos/hardware-configuration.nix
sudo cp ledger.nix /etc/nixos/ledger.nix

sudo nixos-rebuild switch

echo "Finished Switch"
echo " "
sleep 5s
echo "Switching Home Manager Config:"
echo " "

nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
sudo cp home.nix /home/$USER/.config/nixpkgs/home.nix
sudo home-manager switch

sleep 5s
echo "Sometimes,"
echo " "
sleep 1s
echo "I wonder if nix is worth it."
sleep 30s
echo "rebooting!"
reboot
