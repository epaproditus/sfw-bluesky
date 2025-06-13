#!/bin/bash

echo "SFW Bluesky Build Script"
echo "======================"
echo ""

# Clone the official Bluesky client repository
echo "Step 1: Cloning Bluesky social-app repository..."
git clone --depth=1 https://github.com/bluesky-social/social-app.git temp-social-app

# Create directories if they don't exist
echo "Step 2: Creating directories..."
mkdir -p temp-social-app/src/customization

# Copy our custom files
echo "Step 3: Adding custom files..."
cp -f custom-files/hard-coded-prefs.ts temp-social-app/src/customization/
cp -f custom-files/ContentHider.tsx temp-social-app/src/components/moderation/
cp -f custom-files/moderation-opts.tsx temp-social-app/src/state/preferences/

# Enter the directory
cd temp-social-app

# Install dependencies
echo "Step 4: Installing dependencies (this may take a while)..."
yarn install

# Build the web version
echo "Step 5: Building web version..."
yarn build-web

# Copy build artifacts back
echo "Step 6: Copying build artifacts..."
mkdir -p ../build
cp -r bskyweb/build/* ../build/

echo ""
echo "Build complete! The built files are in the 'build' directory."
echo "You can deploy these files to any static web host."
