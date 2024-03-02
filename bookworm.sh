#!/bin/bash

# Add the OpenSIPS GPG key
curl https://apt.opensips.org/opensips-org.gpg -o /usr/share/keyrings/opensips-org.gpg

# Add OpenSIPS repository to the sources list
echo "deb [signed-by=/usr/share/keyrings/opensips-org.gpg] https://apt.opensips.org bookworm 3.5-nightly" >/etc/apt/sources.list.d/opensips.list
echo "deb [signed-by=/usr/share/keyrings/opensips-org.gpg] https://apt.opensips.org bookworm cli-nightly" >/etc/apt/sources.list.d/opensips-cli.list

# Update package lists
apt-get update

# Install OpenSIPS and OpenSIPS CLI
apt-get install opensips opensips-cli -y

echo "OpenSIPS installation complete."
