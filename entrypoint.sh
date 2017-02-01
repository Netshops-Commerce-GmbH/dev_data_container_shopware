#!/bin/bash

# Prechecks
if [ -z "$SHOPWARE_RELEASE_URL" ]
then
	echo "Variable SHOPWARE_RELEASE_URL is not set. Exiting."
	exit 1
fi

if [ -z "$EXTRACT_PATH" ]
then
	echo "Variable EXTRACT_PATH is not set. Exiting."
	exit 1
fi

# Start workflow
echo "Cleaning up $EXTRACT_PATH..."
rm -rf $EXTRACT_PATH/*
echo "Done."

cd /tmp


if [ ! -f "shopware.zip" ];
then
	echo "Downloading Shopware release from $SHOPWARE_RELEASE_URL."
	wget -q $SHOPWARE_RELEASE_URL -O shopware.zip
fi

echo "Extracting Shopware release to $EXTRACT_PATH."
unzip -qq -u shopware.zip -d $EXTRACT_PATH

echo "Done."