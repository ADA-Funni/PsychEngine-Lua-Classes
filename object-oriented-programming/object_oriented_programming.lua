require("mods." .. currentModDirectory .. ".lua.globals")

--[[
### Object Oriented Programming

Name `YourObject` the name of your script, only uppercase.

(e.g. if your script is called `"object_oriented_programming"`,
`YourObject` should be named `ObjectOrientedProgramming`.)

<i> (Leave `YourObject` blank, it gets filled in when you call `new()`.) </i>
]]--
YourObject = {}
YourObject.__index = YourObject

--- @param tag string
--- @param image string
--- @param x number
--- @param y number
--- @param scrollX number
--- @param scrollY number
--- @return table
--[[
This function creates your object.
]]--
function YourObject.new(tag, image, x, y, scrollX, scrollY)
    local self = setmetatable({}, YourObject)

    self.tag = tag

    makeLuaSprite(tag, self.directory .. "/" .. image, x, y)
    setScrollFactor(tag, scrollX, scrollY)

    return self
end

---@param front boolean
--[[
This function adds your object to the stage.
]]--
function YourObject:add(front)
    addLuaSprite(self.tag, front)
end

---@param property string
---@param value any
---@param getProperty boolean
--[[
This function does `setProperty(property, value)` if `shouldGetProperty` is set to `false`.
]]--
function YourObject:accessProperty(property, value, shouldGetProperty)
    if shouldGetProperty == true then
        getProperty(property)
    else
        setProperty(property, value)
    end
end