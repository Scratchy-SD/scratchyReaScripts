--[[
Scratchy_SD
Inserts global sampler jsfx on last selected track. Removes all other instances of global sampler in project.

REAPER v7.11

6/8/2024
]]
selectedTrack = reaper.GetLastTouchedTrack()
i = 0
while i < reaper.CountTracks(0) do
  tempTrack = reaper.GetTrack(0, i)
  fxNum = reaper.TrackFX_GetByName(tempTrack, "JS: Global Sampler", false)
  reaper.TrackFX_Delete( tempTrack, fxNum )
  
  i = i + 1
end


reaper.TrackFX_AddByName(selectedTrack, "JS: Global Sampler", false, 1)
