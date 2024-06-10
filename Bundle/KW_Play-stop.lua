--  @noindex
package.path = debug.getinfo(1,"S").source:match[[^@?(.*[\/])[^\/]-$]] .."?.lua;".. package.path
require 'KW_User'

-----------
-- Setup --
-----------
SCRIPT_NAME = "Transport: Play/stop"
MEDIA_EXPLORER_STOP = true
REMOVE_EMPTY_TAKES = true

----------------
-- User Setup --
----------------
if USER == "Nico" then
  REMOVE_EMPTY_TAKES = false
end

-- Begin undo-block
reaper.Undo_BeginBlock2(0)

-- Main function
function main()
    -- Unused
    --reaper.Main_OnCommand(40878,0) --Global Trim/read Mode
    --reaper.Main_OnCommand(40879,0) --Global Read Mode
    --reaper.Main_OnCommand(42022,0) --Global Latch Preview Mode
    
    playstate = reaper.GetPlayState() -- Get current play state
    reaper.Main_OnCommand(40044,0)    -- Transport: Play/stop
    
    if playstate == 1 then            -- If before was playing
      reaper.Main_OnCommand(40879,0)  -- Global Read Mode
    elseif playstate == 0 then        -- If before was stopped
      reaper.Main_OnCommand(40879,0)  -- Global Read Mode as well.
    elseif playstate == 5 then        -- If before was recording
      reaper.Main_OnCommand(40879,0)   -- Global Read Mode, and
      if REMOVE_EMPTY_TAKES == true then
        -- SWS/S&M: Takes - Remove empty MIDI takes/items among selected items
        reaper.Main_OnCommand(reaper.NamedCommandLookup("_S&M_DELEMPTYTAKE2"), 0)
      end
    end
    
    if MEDIA_EXPLORER_STOP == true then
      -- Focus Media Explorer and Stop Preview
      function GetMediaExplorerHWND()
        local state = reaper.GetToggleCommandState( 50124 )
        if state ~= 0 then return reaper.OpenMediaExplorer( "", false ) end
      end
      
      if not reaper.JS_Window_SetFocus then
        reaper.ShowConsoleMsg('Please Install js_ReaScriptAPI extension.\nhttps://forum.cockos.com/showthread.php?t=212174\n')
      else
        hwnd = GetMediaExplorerHWND()
      
        if hwnd then
          -- Focus Media Explorer
          reaper.JS_Window_SetFocus( hwnd )
          -- Stop Preview
          reaper.JS_Window_OnCommand(hwnd, 1009)
        end
      end

      -- Focus Arrange View
      reaper.Main_OnCommand(reaper.NamedCommandLookup("_BR_FOCUS_ARRANGE_WND"), 0)
    end
end

-- Run
reaper.PreventUIRefresh(1)
main()
reaper.PreventUIRefresh(-1)
reaper.UpdateArrange()

-- End undo-block
reaper.Undo_EndBlock2(0,SCRIPT_NAME,-1)
