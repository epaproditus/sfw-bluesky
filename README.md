# SFW Bluesky

A modified Bluesky client with enforced NSFW content filtering. This repository contains the customized code that ensures NSFW content is always filtered without any user override options.

## Purpose

This project provides a safer browsing experience on Bluesky by enforcing content filtering. It's designed to connect to the standard Bluesky API but present a filtered view that hides inappropriate content.

## Key Features

- Enforced NSFW content filtering with no override options
- Compatible with standard Bluesky infrastructure
- Can be deployed to free hosting platforms like Vercel
- No need for custom server infrastructure

## Implementation

This is achieved through several strategic modifications to the official Bluesky client code:

1. Hard-coded moderation preferences that always hide NSFW content
2. Removal of UI toggles for content filtering settings
3. API-level safeguards to prevent preference changes
4. Enhanced content hiding to prevent revealing filtered content

## Deployment

This repository is designed to be deployed directly to Vercel:

1. Connect this repository to Vercel
2. Use default build settings
3. Deploy

No additional configuration is needed.

## Credits

Based on the [Bluesky Social App](https://github.com/bluesky-social/social-app) with custom modifications for content filtering.