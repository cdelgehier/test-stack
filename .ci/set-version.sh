#!/usr/bin/env bash

SCRIPT_BASE="$(cd "$( dirname "$0")" && pwd )"
ROOT=${SCRIPT_BASE}/..

# Exit immediatly if any command exits with a non-zero status
set -e

VERSION=$1
VERSION_FILE="VERSION.md"

# Usage
print_usage() {
    echo "Set the stack version"
    echo ""
    echo "Usage:"
    echo "  set-version.sh <new-version>"
    echo ""
}

# if less than one arguments supplied, display usage
if [  $# -lt 1 ]; then
    print_usage
    exit 1
fi

# check whether user had supplied -h or --help . If yes display usage
if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    print_usage
    exit 0
fi

# set stack version in VERSION_FILE
echo "$VERSION" > "${ROOT}/${VERSION_FILE}"
