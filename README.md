# SFW Bluesky Client

This is a modified version of the Bluesky client with enforced NSFW content filtering. The modification ensures that NSFW content is always hidden, regardless of user preferences.

## How It Works

This repository contains custom modifications to the official Bluesky client that:

1. Override user preferences to always hide NSFW content
2. Modify the ContentHider component to hide adult content
3. Remove options to show NSFW content in the preferences UI

## Deployment

### Vercel Deployment

This repository is configured for easy deployment on Vercel:

1. Fork this repository
2. Connect your fork to Vercel
3. Deploy with default settings

The build process will:
- Clone the official Bluesky client repository
- Apply our custom modifications
- Build the web version

### Local Development

To develop locally:

```bash
# Clone this repository
git clone https://github.com/epaproditus/sfw-bluesky.git
cd sfw-bluesky

# Install dependencies and build
npm install
npm run build
```

## Modified Files

The key modifications are in:

- `src/customization/hard-coded-prefs.ts` - Forces NSFW filtering preferences
- `src/components/moderation/ContentHider.tsx` - Ensures content hiding works as expected
- `src/state/preferences/moderation-opts.tsx` - Removes NSFW toggle options

## License

This project is licensed under the MIT License, consistent with the original Bluesky client.
