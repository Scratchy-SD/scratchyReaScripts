--[[
Scratchy_SD
Creates 4 measure empty midi item on currently selected track
at edit cursor position

REAPER v7.11

6/8/2024
]]

function isNumeric(value)
  if value == tostring(tonumber(value)) then
    return true
  else
    return false
  end
end


retval, retvals_csv = reaper.GetUserInputs( "Number of measures", 1, "Enter number of measures: ", "" )


if retval and isNumeric(retvals_csv) then
  proj, projfn = reaper.EnumProjects(-1)
  if reaper.CountSelectedTracks(proj) > 0 then
    timesig_num, timesig_denom, tempo = reaper.TimeMap_GetTimeSigAtTime(proj, 0)
    endtime = (tonumber(retvals_csv)*timesig_num*4/timesig_denom)/(tempo*1/60)
    startTime = reaper.GetCursorPosition(proj)
    reaper.CreateNewMIDIItemInProj(reaper.GetSelectedTrack(0, 0), startTime, startTime + endtime)
  else
    --yahaha, you found me!(Korok seed chime plays)
    --fails if no selected track is found
  end
else
  --nothing happens if user input fails or user provides non number input
end

