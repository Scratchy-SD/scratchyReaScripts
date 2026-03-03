-- @description Scratchy_SD - create region from time selection and 
-- @author Scratchy_SD
-- @version 0.0.1

function getTimeSelectionBounds()
    local start_time_selection, end_time_selection = reaper.GetSet_LoopTimeRange(false, false, 0, 0, false)
    if start_time_selection ~= end_time_selection then
        return true, start_time_selection, end_time_selection
    else
        reaper.ShowMessageBox('No time selection. Can\'t create region.', 'Scratchy_SD - Create region from time selection and link to selected track in RRM ', 0)
        return false, 0, 0
  end
end

-- Create Region from time selection
function createRegion(start_time_region, end_time_region)
    return reaper.AddProjectMarker(0, true, start_time_region, end_time_region, "", -1)
end

function assignToRrmFromSelectedTracks(region_ID)
    local num_selected_tracks = reaper.CountSelectedTracks(0)
    if num_selected_tracks > 0 then
        for i = 0, num_selected_tracks - 1 do
        local track = reaper.GetSelectedTrack(0, i)
        reaper.SetRegionRenderMatrix(0, region_ID, track, 1) 
        end 
    end
end


-- Main

time_selected, region_start_time, region_end_time = getTimeSelectionBounds()

if time_selected then
    local region = createRegion(region_start_time, region_end_time)
    assignToRrmFromSelectedTracks(region)
else
    reaper.ShowMessageBox("No time selection found.", "Scratchy_SD - Create region from time selection and link to selected track in RRM", 0)
end