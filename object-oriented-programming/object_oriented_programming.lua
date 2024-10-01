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
    local self = setmetatable({}, YourObject);

    self.tag = tag;

    makeLuaSprite(tag, image, x, y)
    setScrollFactor(tag, scrollX, scrollY)

    return self;
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
---@param shouldGetProperty boolean
--[[
This function does `setProperty(property, value)` if `shouldGetProperty` is set to `false`.
]]--
function YourObject:accessProperty(property, value, shouldGetProperty)
    if shouldGetProperty == true then
        getProperty(self.tag .. "." .. property)
    else
        setProperty(self.tag .. "." .. property, value)
    end
end

---@param axes string
--[[
This function moves your object to the center of the screen.
]]--
function YourObject:screenCenter(axes)
    screenCenter(self.tag, axes)
end

---@param name string
---@param prefix string
---@param framerate number
---@param loop boolean
--[[
This function adds an animation to your object.
]]--
function YourObject:addAnimationByPrefix(name, prefix, framerate, loop)
    addAnimationByPrefix(self.tag, name, prefix, framerate, loop)
end

---@param name string
---@param prefix string
---@param indices string
---@param framerate number
---@param loop boolean
--[[
This function adds an animation to your object.

`indices` works like "0,1,2,3,4,5".
]]--
function YourObject:addAnimationByIndices(name, prefix, indices, framerate, loop)
    if loop == true then
        addAnimationByIndicesLoop(self.tag, name, prefix, indices, framerate)
    else
        addAnimationByIndices(self.tag, name, prefix, indices, framerate)
    end
end

---@param name string
---@param forced boolean
---@param reverse boolean
---@param startFrame number
--[[
This function plays an animation on your object.
]]--
function YourObject:playAnim(name, forced, reverse, startFrame)
    playAnim(self.tag, name, forced, reverse, startFrame)
end