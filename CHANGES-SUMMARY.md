# Summary of Changes for Filtered Bluesky Client

## Files Created

1. `src/customization/hard-coded-prefs.ts`
   - Created a new file with hard-coded moderation preferences
   - These preferences enforce hiding all NSFW content

2. `scripts/custom/build-filtered-web.sh`
   - Added a custom build script for the filtered web client

## Files Modified

1. `src/state/preferences/moderation-opts.tsx`
   - Modified the moderation preferences provider to always use our hard-coded preferences
   - Removed the dependency on user preferences for moderation settings

2. `src/screens/Moderation/index.tsx`
   - Removed adult content toggle from settings
   - Replaced with informational text that adult content filtering is permanently enabled
   - Replaced content filtering toggles with read-only information

3. `src/components/moderation/ContentHider.tsx`
   - Enhanced to detect NSFW content and force noOverride to true
   - Modified the UI to prevent showing NSFW content under any circumstances

4. `src/state/queries/preferences/index.ts`
   - Modified `usePreferencesSetAdultContentMutation` to always disable adult content regardless of user request
   - Updated `usePreferencesSetContentLabelMutation` to enforce 'hide' setting for all NSFW-related labels

## Key Features of the Customized Client

1. **No Adult Content Toggle:** Adult content filtering is permanently enabled

2. **Hidden NSFW Content:** All NSFW-labeled content is hidden with no option to view

3. **API-Level Protection:** Even API-level attempts to change preferences are intercepted and overridden

4. **Works with Standard Infrastructure:** Compatible with the official Bluesky API, no need for custom servers

## Deployment Instructions

The customized client can be hosted on Vercel with these steps:

1. Push the modified code to GitHub
2. Connect the repository to Vercel
3. Use the default build settings
4. Deploy

This provides a free hosting solution that enforces NSFW content filtering for users.