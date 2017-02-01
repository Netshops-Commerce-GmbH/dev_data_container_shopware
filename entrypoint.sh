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

echo "Setting correct chmods in $EXTRACT_PATH."
cd $EXTRACT_PATH
chmod 777 config.php
chmod 777 -R cache/
chmod 777 -R files/
chmod 777 -R media/
chmod 777 -R engine/Shopware/Plugins/Community/
chmod 777 -R logs/
chmod 777 -R engine/Shopware/Plugins/Default/
chmod 777 -R web/cache/
chmod 777 -R recovery/
chmod 777 -R themes/Frontend/
chmod 777 -R recovery/install/data/
chmod 777 -R var/

echo "Done."