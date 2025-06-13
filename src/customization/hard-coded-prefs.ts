import {ModerationOpts} from '@atproto/api'

// Hard-coded moderation preferences with no user overrides
export const getHardcodedModerationPrefs = (): ModerationOpts => {
  return {
    userDid: undefined, // Will be set at runtime
    prefs: {
      // Always disable adult content
      adultContentEnabled: false,
      
      // Global label settings to hide unwanted content
      labels: {
        porn: 'hide',
        sexual: 'hide',
        nudity: 'hide',
        nsfw: 'hide',
        graphic: 'hide',
        gore: 'hide',
      },
      
      // Use Bluesky's default labeler
      labelers: [
        {
          did: 'did:web:api.bsky.app',
          labels: {
            porn: 'hide',
            sexual: 'hide',
            nudity: 'hide',
            nsfw: 'hide',
            graphic: 'hide',
            gore: 'hide',
          }
        }
      ],
      
      hiddenPosts: [],
      mutedWords: [],
    },
    // Include labelDefs (will be populated at runtime)
    labelDefs: {},
  }
}