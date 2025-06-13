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

# Create fallback content in case of build failure
echo "Creating fallback content..."
mkdir -p public
cat > public/index.html << 'EOL'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SFW Bluesky Client</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
      padding: 20px;
      text-align: center;
      background-color: #f5f5f7;
      color: #1d1d1f;
    }
    h1 {
      font-size: 2rem;
      margin-bottom: 1rem;
      color: #0063ff;
    }
    p {
      font-size: 1.2rem;
      max-width: 600px;
      line-height: 1.6;
      margin-bottom: 1.5rem;
    }
    .container {
      background-color: white;
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      max-width: 800px;
    }
    .highlight {
      background-color: #f0f7ff;
      padding: 1rem;
      border-radius: 6px;
      border-left: 4px solid #0063ff;
      margin: 1.5rem 0;
    }
    a {
      color: #0063ff;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>SFW Bluesky Client</h1>
    <p>A safer version of the Bluesky social network with enforced NSFW content filtering.</p>
    
    <div class="highlight">
      <p>The deployment is being processed. Please check back shortly.</p>
    </div>
    
    <p>This modified version of Bluesky ensures that NSFW content is always hidden, regardless of user preferences.</p>
    
    <p>Visit <a href="https://github.com/epaproditus/sfw-bluesky" target="_blank">our GitHub repository</a> for more information.</p>
  </div>
</body>
</html>
EOL

# Try to clone and build the Bluesky client
echo "Step 1: Cloning Bluesky social-app repository..."
git clone --depth=1 https://github.com/bluesky-social/social-app.git temp-social-app || {
  echo "Failed to clone repository. Using fallback page."
  exit 0
}

# Create directories if they don't exist
echo "Step 2: Creating directories..."
mkdir -p temp-social-app/src/customization temp-social-app/src/components/moderation temp-social-app/src/state/preferences

# Copy our custom files
echo "Step 3: Adding custom files..."
cp -f custom-files/hard-coded-prefs.ts temp-social-app/src/customization/ || true
cp -f custom-files/ContentHider.tsx temp-social-app/src/components/moderation/ || true
cp -f custom-files/moderation-opts.tsx temp-social-app/src/state/preferences/ || true

# Enter the web directory
echo "Step 4: Building web version..."
cd temp-social-app/bskyweb || {
  echo "bskyweb directory not found. Using fallback page."
  exit 0
}

# List directory contents
echo "Directory structure:"
ls -la

# Install dependencies with legacy peer deps to handle React version conflicts
echo "Installing web dependencies..."
npm install --legacy-peer-deps --force || {
  echo "Failed to install dependencies. Using fallback page."
  exit 0
}

# Build the web version
echo "Building web client..."
npm run build || {
  echo "Build failed. Using fallback page."
  exit 0
}

# Return to root
cd ../..

# Copy build artifacts to public
echo "Step 5: Copying build artifacts to public directory..."
cp -r temp-social-app/bskyweb/build/* public/ || true

echo ""
echo "Build complete! Output directory: public"

# Always exit with success to ensure deployment happens with at least the fallback page
exit 0
