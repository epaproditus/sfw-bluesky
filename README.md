# SFW Bluesky Client

This is a modified version of the Bluesky client with enforced NSFW content filtering. The modification ensures that NSFW content is always hidden, regardless of user preferences.

## How It Works

This repository contains custom modifications to the official Bluesky client that:

1. Override user preferences to always hide NSFW content
2. Modify the ContentHider component to hide adult content
3. Remove options to show NSFW content in the preferences UI

## Deployment on Vercel

This project is configured for easy deployment on Vercel:

### Step 1: Fork or Clone this Repository

Start by forking this repository to your own GitHub account or clone it directly.

### Step 2: Connect to Vercel

1. Sign in to [Vercel](https://vercel.com/)
2. Click "Add New..." → "Project"
3. Select your forked/cloned repository
4. Configure as follows:
   - **Framework Preset**: Other
   - **Build Command**: `npm run build`
   - **Output Directory**: `public`
   - **Install Command**: `npm install`

### Step 3: Environment Setup

For best results, set the following environment variables in your Vercel project settings:

```
NODE_VERSION=16.x
```

### Step 4: Deploy

Click "Deploy" and Vercel will handle the rest!

The build process:
1. Clones the original Bluesky repository
2. Applies our custom modifications
3. Builds the web client
4. Deploys the result

## Local Development

To develop locally:

```bash
# Clone this repository
git clone https://github.com/epaproditus/sfw-bluesky.git
cd sfw-bluesky

# Make the build script executable
chmod +x vercel-build.sh

# Run the build script
./vercel-build.sh

# The built files will be in the ./public directory
```

## Modified Files

The key modifications are in:

- `custom-files/hard-coded-prefs.ts` - Forces NSFW filtering preferences
- `custom-files/ContentHider.tsx` - Ensures content hiding works as expected
- `custom-files/moderation-opts.tsx` - Removes NSFW toggle options

## Troubleshooting

If you encounter build issues on Vercel:

1. Make sure you're using Node.js 16.x
2. Check that your repository has all the necessary files
3. Verify that the build script has proper permissions

## License

This project is licensed under the MIT License, consistent with the original Bluesky client.
