# Deploying the SFW Bluesky Client

This guide provides step-by-step instructions for deploying the SFW Bluesky client to Vercel, which offers free hosting for this type of web application.

## Prerequisites

- A GitHub account (where this repository is hosted)
- A Vercel account (free tier is sufficient)

## Deployment Steps

### 1. Fork or Clone This Repository

If you haven't already, fork or clone this repository to your own GitHub account.

### 2. Connect Vercel to GitHub

1. Sign up or log in to [Vercel](https://vercel.com/)
2. From the Vercel dashboard, click "Add New..." → "Project"
3. Select "Import Git Repository"
4. Connect your GitHub account if it's not already connected
5. Select this repository from the list

### 3. Configure the Build Settings

Vercel will attempt to auto-detect the build settings, but you may need to configure them manually:

- **Framework Preset**: Select "Other"
- **Build Command**: `yarn && yarn build-web`
- **Output Directory**: `bskyweb/build`
- **Install Command**: `yarn install`

### 4. Environment Variables (Optional)

If you want to connect to a specific Bluesky PDS instance, add the following environment variable:

- **Name**: `BLUESKY_SERVICE_URL`
- **Value**: `https://api.bsky.app` (for the official Bluesky API) or your custom PDS URL

### 5. Deploy

Click the "Deploy" button and wait for the build to complete. Vercel will build and deploy your SFW Bluesky client.

### 6. Use Your Deployed Client

Once deployment is successful, Vercel will provide you with a URL for your deployed application (e.g., `sfw-bluesky.vercel.app`). Users can access this URL to use your filtered Bluesky client.

## Customizing the Deployment

### Custom Domain

You can configure a custom domain for your deployment through Vercel's settings:

1. Go to your project in the Vercel dashboard
2. Navigate to "Settings" → "Domains"
3. Add your custom domain and follow the verification steps

### Automatic Updates

By default, Vercel will automatically rebuild and redeploy your site whenever you push changes to the connected GitHub repository.

## Troubleshooting

If you encounter build errors:

1. Check the build logs in Vercel
2. Common issues include:
   - Node.js version conflicts (try specifying Node.js 18 in the Vercel settings)
   - Package installation errors (check your yarn.lock file)

For more help, refer to the [Vercel Documentation](https://vercel.com/docs) or [GitHub issues](https://github.com/epaproditus/sfw-bluesky/issues).