--[[
Scratchy_SD
Creates 4 measure empty midi item on currently selected track
at edit cursor position

REAPER v7.11

6/8/2024
]]
proj, projfn = reaper.EnumProjects(-1)
if reaper.CountSelectedTracks(proj) > 0 then
  timesig_num, timesig_denom, tempo = reaper.TimeMap_GetTimeSigAtTime(proj, 0)
  endtime = (4*timesig_num*4/timesig_denom)/(tempo*1/60)
  startTime = reaper.GetCursorPosition(proj)
  reaper.CreateNewMIDIItemInProj(reaper.GetSelectedTrack(0, 0), startTime, startTime + endtime)
else
  --yahaha, you found me!(Korok seed chime plays)
end
