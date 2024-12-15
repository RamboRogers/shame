#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Installing SHAME...${NC}"

# Get system information
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

# Map architecture names
case ${ARCH} in
    x86_64)
        ARCH="amd64"
        ;;
    arm64|aarch64)
        ARCH="arm64"
        ;;
    *)
        echo -e "${RED}Unsupported architecture: ${ARCH}${NC}"
        exit 1
        ;;
esac

# Set binary name based on OS
BINARY_NAME="shame-v-${OS}-${ARCH}"
if [ "${OS}" = "darwin" ]; then
    BINARY_NAME="shame-v-darwin-${ARCH}"
elif [ "${OS}" = "linux" ]; then
    BINARY_NAME="shame-v-linux-${ARCH}"
fi

# GitHub raw URL
DOWNLOAD_URL="https://raw.githubusercontent.com/RamboRogers/shame/master/${BINARY_NAME}"

echo -e "${BLUE}Downloading SHAME for ${OS} ${ARCH}...${NC}"
echo -e "${BLUE}Download URL: ${DOWNLOAD_URL}${NC}"

# Create temporary directory
TMP_DIR=$(mktemp -d)
cd ${TMP_DIR}

# Download binary with error checking
HTTP_RESPONSE=$(curl -L -w "%{http_code}" -o shame "${DOWNLOAD_URL}" 2>/dev/null)
if [ "${HTTP_RESPONSE}" != "200" ]; then
    echo -e "${RED}Failed to download SHAME - HTTP Status: ${HTTP_RESPONSE}${NC}"
    echo -e "${RED}URL: ${DOWNLOAD_URL}${NC}"
    echo -e "${RED}Please check if the binary exists in the repository${NC}"
    rm -rf ${TMP_DIR}
    exit 1
fi

# Verify file was downloaded and has content
if [ ! -s shame ]; then
    echo -e "${RED}Downloaded file is empty${NC}"
    rm -rf ${TMP_DIR}
    exit 1
fi

# Make binary executable
chmod +x shame

# Move binary to /usr/local/bin
echo -e "${BLUE}Installing SHAME to /usr/local/bin...${NC}"
if ! sudo mv shame /usr/local/bin/shame; then
    echo -e "${RED}Failed to install SHAME. Please run with sudo.${NC}"
    rm -rf ${TMP_DIR}
    exit 1
fi

# Clean up
rm -rf ${TMP_DIR}

echo -e "${GREEN}SHAME installed successfully!${NC}"
echo -e "${BLUE}Run 'shame' to start sharing files.${NC}"
