-- defudd.lua
-- Makes selected unit grow a beard. 

local unit = dfhack.gui.getSelectedUnit()
if not unit or not unit.appearance then qerror('Select a unit') end
if unit.sex ~= 1 then qerror('Not male') end

local ap = unit.appearance

-- REQUIRED supporting fields
ap.tissue_style[0] = 4
ap.tissue_style[1] = 4
ap.tissue_style[2] = 0
ap.tissue_style[3] = 4

ap.tissue_length[0] = 0
ap.tissue_length[1] = 0
ap.tissue_length[2] = 100
ap.tissue_length[6] = 130
ap.tissue_length[7] = 130

-- SINGLE decisive bp_modifier
ap.bp_modifiers[55] = 102

unit.flags4.portrait_must_be_refreshed = true
unit.flags4.any_texture_must_be_refreshed = true

print('Beard settings applied to creature.')
