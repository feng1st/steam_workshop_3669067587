-- unfuddfemale.lua
-- Makes bald females (Dwarf, Human, Elf) grow hair.

local fixed = 0

for _, unit in ipairs(df.global.world.units.active) do
    if unit.sex == 0 and unit.appearance then
        local a = unit.appearance

        if not a.tissue_style or not a.tissue_length or not a.bp_modifiers then
            goto continue
        end
        
        -- Check if arrays are long enough
        if #a.tissue_style < 4 or #a.tissue_length < 4 or #a.bp_modifiers < 52 then
            goto continue
        end

        -- head hair is tissue indices 2 and 3
        if a.tissue_style[2] == 4 or a.tissue_length[2] <= 0 then
            -- enable hair tissue
            a.tissue_style[2] = 0
            a.tissue_style[3] = 0
            a.tissue_length[2] = 150
            a.tissue_length[3] = 150

            -- THIS is the key part that actually makes it render
            a.bp_modifiers[50] = 150
            a.bp_modifiers[51] = 150

            -- force redraw (this is sufficient for head hair)
            unit.flags4.portrait_must_be_refreshed = true
            unit.flags4.any_texture_must_be_refreshed = true

            fixed = fixed + 1
        end
    end
    ::continue::
end

print("Fixed female hair on "..fixed.." creatures.")