local function setTrackMIDIInput(track, input, channel)
  assert(input   & ~0x3f == 0)
  assert(channel & ~0x1f == 0)
  reaper.SetMediaTrackInfo_Value(track, 'I_RECINPUT', 0x1000 | (input<<5) | channel)
end

local trackSelected = reaper.GetSelectedTrack(0, 0)
reaper.SetTrackUIRecArm(trackSelected, 1, 1)
setTrackMIDIInput(trackSelected, 63, 0)
--[[
local trackSelected = reaper.GetSelectedTrack(0, 0)

reaper.SetTrackUIRecArm(trackSelected, 1, 1)
reaper.SetMediaTrackInfo_Value(trackSelected, "I_RECINPUT", 4096)
]]


