#!/bin/bash

set -ex

echo "SFW Bluesky - Vercel Build Script"
echo "=============================="
echo ""

# Display environment information
echo "Environment Information:"
node --version
npm --version
echo ""

# Clone the official Bluesky client repository
echo "Step 1: Cloning Bluesky social-app repository..."
git clone --depth=1 https://github.com/bluesky-social/social-app.git temp-social-app

# Create directories if they don't exist
echo "Step 2: Creating directories..."
mkdir -p temp-social-app/src/customization temp-social-app/src/components/moderation temp-social-app/src/state/preferences

# Copy our custom files
echo "Step 3: Adding custom files..."
cp -f custom-files/hard-coded-prefs.ts temp-social-app/src/customization/
cp -f custom-files/ContentHider.tsx temp-social-app/src/components/moderation/
cp -f custom-files/moderation-opts.tsx temp-social-app/src/state/preferences/

# Enter the web directory
echo "Step 4: Building web version..."
cd temp-social-app/bskyweb

# List directory contents
echo "Directory structure:"
ls -la

# Install dependencies
echo "Installing web dependencies..."
npm install

# Build the web version
echo "Building web client..."
npm run build

# Return to root
cd ../..

# Copy build artifacts to public
echo "Step 5: Copying build artifacts to public directory..."
mkdir -p public
cp -r temp-social-app/bskyweb/build/* public/

echo ""
echo "Build complete! Output directory: public"
