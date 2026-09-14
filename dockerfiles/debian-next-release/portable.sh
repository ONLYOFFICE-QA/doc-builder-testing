#!/bin/bash

set -e  # Exit immediately if a command exits with non-zero status

URL='https://s3.eu-west-1.amazonaws.com/repo-doc-onlyoffice-com/builder/linux/generic/onlyoffice-documentbuilder-10.0.0-84-x86_64.tar.xz'
SHA256='d61b758c1e893ce5700ab23b623d05170315ef2cb4cf1313e6a02fad39c4a691'

DOWNLOADED_FILE=$(basename "$URL")

# Download and verify SHA256
echo "Downloading $URL..."
curl -L "$URL" --output "./$DOWNLOADED_FILE"

if sha256sum "./$DOWNLOADED_FILE" | grep -q "$SHA256"; then
    echo "Verification succeeded (exit code: $?)"

    # Extract the archive
    echo "Extracting $DOWNLOADED_FILE..."
    tar -xvf "$DOWNLOADED_FILE" || { echo "Extraction failed"; exit 1; }

    # Copy binary to system
    echo "Installing binary..."
    cp ./usr/bin/onlyoffice-documentbuilder /usr/bin/onlyoffice-documentbuilder || { echo "Binary installation failed"; exit 1; }
    echo "Verifying binary installation..."
    cat /usr/bin/onlyoffice-documentbuilder > /dev/null || { echo "Binary verification failed"; exit 1; }

    # Create the parent directory structure before copying files
    mkdir -p /opt/onlyoffice/

    # Copy data files
    echo "Installing data files..."
    cp -rf ./opt/onlyoffice/documentbuilder /opt/onlyoffice/documentbuilder || { echo "Data files installation failed"; exit 1; }
    echo "Verifying data files installation..."
    ls /opt/onlyoffice/documentbuilder > /dev/null || { echo "Data files verification failed"; exit 1; }

    # Verify installation
    echo "Verifying installation..."
    onlyoffice-documentbuilder -v || { echo "Installation verification failed"; exit 1; }

    # Clean up
    echo "Cleaning up..."
    rm -rf "$DOWNLOADED_FILE" ./opt ./usr
    CLEANUP_STATUS=$?
    echo "Cleanup status: $CLEANUP_STATUS"

    echo "Installation completed successfully!"
else
    echo "Verification failed (exit code: $?)"
    exit 1
fi
