--todo - make this not look at terrible
selected_track = reaper.GetSelectedTrack(0, 0)
cursor_position = reaper.GetCursorPosition()

selected_track_number = reaper.GetMediaTrackInfo_Value(selected_track, 'IP_TRACKNUMBER')

reaper.InsertTrackInProject(0, selected_track_number, 0)

new_track = reaper.GetTrack(0, selected_track_number)

new_midi = reaper.CreateNewMIDIItemInProj( new_track, cursor_position, cursor_position + 0.25, false )
local take = reaper.GetActiveTake( new_midi )

vars = {}
vars.chan = 1
vars.pitch = 60
vars.vel = 100

item_pos = reaper.GetMediaItemInfo_Value( new_midi, "D_POSITION" )
item_len = reaper.GetMediaItemInfo_Value( new_midi, "D_LENGTH" )
item_end = item_pos + item_len
start_ppq = reaper.MIDI_GetPPQPosFromProjTime( take, item_pos )
end_ppq = reaper.MIDI_GetPPQPosFromProjTime( take, item_end )
reaper.MIDI_InsertNote( take, false, false, start_ppq, end_ppq, vars.chan, vars.pitch, vars.vel, false )