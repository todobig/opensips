#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "Installing gnupg2..."
apt-get install -y gnupg2

echo "Adding OpenSIPS repository keys..."
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 049AD65B

echo "Adding OpenSIPS repositories to sources.list.d..."
echo "deb https://apt.opensips.org buster 3.2-releases" >/etc/apt/sources.list.d/opensips.list
echo "deb https://apt.opensips.org buster cli-nightly" >/etc/apt/sources.list.d/opensips-cli.list

echo "Updating system packages..."
apt-get update

echo "Installing OpenSIPS and OpenSIPS CLI..."
apt-get install -y opensips opensips-cli

echo "Installing all other OpenSIPS modules..."
apt-get install -y opensips-*

echo "Enabling and starting OpenSIPS service..."
systemctl enable opensips
systemctl start opensips

echo "Checking OpenSIPS service status..."
systemctl status opensips

echo "OpenSIPS installation completed successfully."

