--  @noindex



----------------
-- Screensets --
----------------

-- Screenset: Load window set #01
reaper.Main_OnCommand(40454, 0)



-----------------
-- MIDI Editor --
-----------------

-- Active midi editor
local activeMidiEditor = reaper.MIDIEditor_GetActive()

-- Midi editor and Arrange view DONT share the same grid
if reaper.GetToggleCommandStateEx(32060, 41022) == 1 then reaper.MIDIEditor_OnCommand(activeMidiEditor, 41022) end

-- Set length for next inserted note: grid (A must)
reaper.MIDIEditor_OnCommand(activeMidiEditor, 41295)

-- Grid: Set grid type to straight
reaper.MIDIEditor_OnCommand(activeMidiEditor, 41003)

-- Virtual MIDI keyboard: Send all input to VKB
-- Only has effect if Virtual MIDI Keyboard is selected from View menu. Useful to have activated.
if reaper.GetToggleCommandState(40637) == 0 then reaper.Main_OnCommand(40637, 0) end

-- Set FOLD to off (don't see why, but ok)
local kwFold = reaper.NamedCommandLookup("_RS7d3c_9a8b79b859379fd62c7f096df7a06c07e67ba0c6")
if reaper.GetToggleCommandState(kwFold) == -1 then reaper.SetToggleCommandState(0, kwFold, 0) end

-- Active midi item follow selection changes in arrange view ON
-- This ensures better visibility when opening midi items and switch them on the fly
if reaper.GetToggleCommandStateEx(32060, 40826) == 0 then reaper.MIDIEditor_OnCommand(activeMidiEditor, 40826) end



-------------
-- Arrange --
-------------

-- Global sampler GUI window (Only used in Sonobus template)
-- reaper.Main_OnCommand(reaper.NamedCommandLookup("_RSdbf64708ea8abea46b82a08cabc050148d65176c"), 0)

-- Paranormal FX Router
-- reaper.Main_OnCommand(reaper.NamedCommandLookup("_RS4466532563f07c099f8ec22b9b79e819e0d3f3d4"), 0)

-- Set obey track locked height when using vertical zooming ACTIONS
local obeyTrackHeight = reaper.NamedCommandLookup("_NF_TOGGLE_OBEY_TRACK_HEIGHT_LOCK")
if reaper.GetToggleCommandState(obeyTrackHeight) == 0 then reaper.Main_OnCommand(obeyTrackHeight, 0) end

-- Show FX in TCP when size permits OFF
if reaper.GetToggleCommandState(40302) == 1 then reaper.Main_OnCommand(40302, 0) end

-- Show sends in TCP (when size permits) OFF
if reaper.GetToggleCommandState(40677) == 1 then reaper.Main_OnCommand(40677, 0) end

-- View: Toggle show media cues in items OFF (hides markers, regions and stuff from items)
if reaper.GetToggleCommandState(40691) == 1 then reaper.Main_OnCommand(40691, 0) end

-- Arm ALL envelopes for ALL tracks (not sure if this is still useful, but anyways. It doesn't hurt)
reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_SAVESEL"), 0) -- Save track selection
reaper.Main_OnCommand(40296, 0)  -- Select all tracks
reaper.Main_OnCommand(reaper.NamedCommandLookup("_S&M_ARMALLENVS"), 0) -- Arm all active envelopes of selected tracks
reaper.Main_OnCommand(40769, 0)  -- Unselect everything
reaper.NamedCommandLookup("_SWS_RESTORESEL") -- Restore track selection

-- Auto crossfade OFF and while splitting too (a must)
if reaper.GetToggleCommandState(40912) == 1 then reaper.Main_OnCommand(40912, 0) end
if reaper.GetToggleCommandState(40041) == 1 then reaper.Main_OnCommand(40041, 0) end

-- Ruler: set to minimum height (a must)
reaper.Main_OnCommand(42321, 0)

-- Markers, Regions and Time signatures in lanes: OFF
if reaper.GetToggleCommandState(42323) == 1 then reaper.Main_OnCommand(42323, 0) end
if reaper.GetToggleCommandState(42324) == 1 then reaper.Main_OnCommand(42324, 0) end
if reaper.GetToggleCommandState(42325) == 1 then reaper.Main_OnCommand(42325, 0) end

-- Hide video window if open.
if reaper.GetToggleCommandState(50125) == 1 then reaper.Main_OnCommand(50125, 0) end

-- Reset project peaks zoom
reaper.Main_OnCommand(42449, 0)

-- Options: Show empty takes (align takes by recording pass) OFF
if reaper.GetToggleCommandState(41346) == 1 then reaper.Main_OnCommand(41346, 0) end

-- Options: Allow selecting empty takes OFF
if reaper.GetToggleCommandState(41355) == 1 then reaper.Main_OnCommand(41355, 0) end

-- Options: Move envelope points with media items OFF (turn on if needed)
if reaper.GetToggleCommandState(40070) == 1 then reaper.Main_OnCommand(40070, 0) end

-- Grid behind items --> OFF (Best with the Peace theme)
if reaper.GetToggleCommandState(reaper.NamedCommandLookup("_BR_OPTIONS_GRID_Z_OVER_ITEMS")) == 0 
then reaper.Main_OnCommand(reaper.NamedCommandLookup("_BR_OPTIONS_GRID_Z_OVER_ITEMS"), 0)
end

if reaper.GetToggleCommandState(reaper.NamedCommandLookup("_BR_OPTIONS_GRID_Z_UNDER_ITEMS")) == 1 
then reaper.Main_OnCommand(reaper.NamedCommandLookup("_BR_OPTIONS_GRID_Z_UNDER_ITEMS"), 0)
end

if reaper.GetToggleCommandState(reaper.NamedCommandLookup("_SWS_TOGGRID_OU")) == 0 
then reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_TOGGRID_OU"), 0)
end



---------------
-- Recording --
---------------

-- Options: New recording splits items and creates new takes (default)
-- The default. The safest option!
reaper.Main_OnCommand(41330, 0)

-- Record: Set record mode to time selection auto-punch
-- Default record mode beheavior
if reaper.GetToggleCommandState(40076) == 0 then reaper.Main_OnCommand(40076, 0) end



-----------
-- Mixer --
-----------

-- Mixer: Toggle docking in docker ON (Carl's workflow)
if reaper.GetToggleCommandState(40083) == 0 then reaper.Main_OnCommand(40083, 0) end

-- Mixer: Clickable icon for folder tracks to show/hide children ON
if reaper.GetToggleCommandState(41154) == 0 then reaper.Main_OnCommand(41154, 0) end

-- Mixer: Master track visible OFF
-- It's best to have it OFF if using the Peace theme
if reaper.GetToggleCommandState(41209) == 1 then reaper.Main_OnCommand(41209, 0) end

-- Mixer: Toggle master track in docked window ON
-- Only required for Carl using Peace Theme or Reapertips Theme
if reaper.GetToggleCommandState(41610) == 0 then reaper.Main_OnCommand(41610, 0) end

-- Mixer: Group FX parameters with their inserts ON
-- Always ON
if reaper.GetToggleCommandState(41829) == 0 then reaper.Main_OnCommand(41829, 0) end

-- Mixer: Toggle show FX parameters (when size permits) ON
-- 
if reaper.GetToggleCommandState(40910) == 0 then reaper.Main_OnCommand(40910, 0) end

-- Mixer: Group sends with (before/after) FX inserts OFF (Nico's workflow)
-- Looks tidier
if reaper.GetToggleCommandState(40267) == 1 then reaper.Main_OnCommand(40267, 0) end

-- Mixer: Toggle show FX inserts (when size permits) ON
-- 
if reaper.GetToggleCommandState(40549) == 0 then reaper.Main_OnCommand(40549, 0) end

-- Mixer: Toggle show sends (when size permits) ON
-- 
if reaper.GetToggleCommandState(40557) == 0 then reaper.Main_OnCommand(40557, 0) end



---------------
-- Metronome --
---------------
-- (these don't apply when executing global action upon opening a new project/project template)

-- Enable metronome during recording
reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_AWMRECON"), 0)
-- Enable metronome during playback
reaper.Main_OnCommand(reaper.NamedCommandLookup("_SWS_AWMPLAYON"), 0)
-- Disable metronome
reaper.Main_OnCommand(41746, 0)



-----------------
-- SubProjects --
-----------------

-- Project tabs: Defer rendering of subprojects (render on tab switch rather than save) OFF
-- The opposite is not really beneficial in any way.
if reaper.GetToggleCommandState(41998) == 1 then reaper.Main_OnCommand(41998, 0) end

-- Project tabs: Do not automatically render subprojects (require manual render) ON
-- Manual rendering is much safer and provides a faster workflow
if reaper.GetToggleCommandState(42333) == 0 then reaper.Main_OnCommand(42333, 0) end

-- Project tabs: Prompt before automatic rerender of background subprojects OFF
-- It auto-switches when the previous action is executed. But anyways. Just in case:
if reaper.GetToggleCommandState(42334) == 1 then reaper.Main_OnCommand(42334, 0) end

-- Project tabs: Run background projects --> OFF
-- This will only play the active tab/subproject
-- Nico's workflow by default. Can be turned On from Settings menu.
if reaper.GetToggleCommandState(40871) == 1 then reaper.Main_OnCommand(40871, 0) end

-- Project tabs: Synchronize any parent projects when playing back subproject ON
-- Always a must to have turned on. Will only take effect if "Run background projects" is ON
if reaper.GetToggleCommandState(41994) == 0 then reaper.Main_OnCommand(41994, 0) end

-- Project tabs: Run stopped background projects OFF
-- This will prevent FX from running (aka consume CPU) on inactive tabs. A must on most ocations.
if reaper.GetToggleCommandState(40873) == 1 then reaper.Main_OnCommand(40873, 0) end



--------------
-- Playback --
--------------

-- SWS/BR: Options - Toggle "Stop/repeat playback at end of project" --> OFF
if reaper.GetToggleCommandState(reaper.NamedCommandLookup("_BR_OPTIONS_STOP_PLAYBACK_PROJ_END")) == 1 
then reaper.Main_OnCommand(reaper.NamedCommandLookup("_BR_OPTIONS_STOP_PLAYBACK_PROJ_END"), 0) end

-- Transport: Toggle repeat --> OFF
if reaper.GetToggleCommandState(1068) == 1 then reaper.Main_OnCommand(1068, 0) end
