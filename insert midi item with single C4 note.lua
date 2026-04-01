--todo - make this not look at terrible
local selected_track = reaper.GetSelectedTrack(0, 0)
local cursor_position = reaper.GetCursorPosition()

local selected_track_number = reaper.GetMediaTrackInfo_Value(selected_track, 'IP_TRACKNUMBER')


local new_midi = reaper.CreateNewMIDIItemInProj( selected_track, cursor_position, cursor_position + 0.25, false )
local take = reaper.GetActiveTake( new_midi )

local vars = {}
vars.chan = 1
vars.pitch = 60
vars.vel = 100

local item_pos = reaper.GetMediaItemInfo_Value( new_midi, "D_POSITION" )
local item_len = reaper.GetMediaItemInfo_Value( new_midi, "D_LENGTH" )
local item_end = item_pos + item_len
local start_ppq = reaper.MIDI_GetPPQPosFromProjTime( take, item_pos )
local end_ppq = reaper.MIDI_GetPPQPosFromProjTime( take, item_end )
reaper.MIDI_InsertNote( take, false, false, start_ppq, end_ppq, vars.chan, vars.pitch, vars.vel, false )
