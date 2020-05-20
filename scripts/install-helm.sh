#!/bin/bash

# Installs/Upgrades helm. Note that the referred to script is locked to a
# major version, so this script should be updated to reflect the desired major
# release.

wget -qO- https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

