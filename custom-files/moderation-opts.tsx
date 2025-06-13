import React, {createContext, useContext, useMemo} from 'react'
import {BskyAgent, ModerationOpts} from '@atproto/api'

import {useHiddenPosts, useLabelDefinitions} from '#/state/preferences'
import {DEFAULT_LOGGED_OUT_LABEL_PREFERENCES} from '#/state/queries/preferences/moderation'
import {useSession} from '#/state/session'
import {usePreferencesQuery} from '../queries/preferences'

// Import our hard-coded preferences
import {getHardcodedModerationPrefs} from '#/customization/hard-coded-prefs'

export const moderationOptsContext = createContext<ModerationOpts | undefined>(
  undefined,
)

// used in the moderation state devtool
export const moderationOptsOverrideContext = createContext<
  ModerationOpts | undefined
>(undefined)

export function useModerationOpts() {
  return useContext(moderationOptsContext)
}

export function Provider({children}: React.PropsWithChildren<{}>) {
  const override = useContext(moderationOptsOverrideContext)
  const {currentAccount} = useSession()
  const prefs = usePreferencesQuery()
  const {labelDefs} = useLabelDefinitions()
  const hiddenPosts = useHiddenPosts() // TODO move this into pds-stored prefs

  const userDid = currentAccount?.did
  const value = useMemo<ModerationOpts | undefined>(() => {
    if (override) {
      return override
    }
    
    // Always use our hard-coded preferences
    const hardcodedPrefs = getHardcodedModerationPrefs()
    
    // Set dynamic values that we need at runtime
    hardcodedPrefs.userDid = userDid
    hardcodedPrefs.labelDefs = labelDefs
    
    return hardcodedPrefs
  }, [override, userDid, labelDefs])

  return (
    <moderationOptsContext.Provider value={value}>
      {children}
    </moderationOptsContext.Provider>
  )
}