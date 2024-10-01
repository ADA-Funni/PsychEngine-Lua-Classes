# Documentation - Lua "Classes" (Psych Engine)

The `lua` folder is basically a LUA library for globals and LUA "classes".
All of it is run without source code interference in any way.

It also is unique to your mod, only triggering when `currentModDirectory` is the name of your mod's folder.

## How to import a "class"

```lua
require("mods." .. currentModDirectory .. ".lua.globals")
```

Lua "classes" go in `mods/My-Mod/lua/your_script.lua`.

There's two templates in the `lua` folder, `globals.lua`, and `object-oriented-programming/object_oriented_programming.lua`.

## How to turn a script into an object

-# (Big thanks to @voxov_tired for this part.)

```lua
YourObject = {}
YourObject.__index = YourObject

--- @param tag string
--[[
This function creates your object.
]]--
function YourObject.new(tag)
    local self = setmetatable({}, YourObject)

    self.tag = tag

    -- Code goes here.

    return self
end
```

## Object Oriented Programming

Name `YourObject` the name of your script, only uppercase.
-# Leave `YourObject` blank, it gets filled in when you call `new()`.

(e.g. if your script is called `"object_oriented_programming"`,
`YourObject` should be named `ObjectOrientedProgramming`.)

## How to make an object function

You're supposed to format it like this:

```lua
--- @param printEnabled boolean
--[[
This function does something.
]]--
function YourObject:functionName(printEnabled)
    if printEnabled == true then
        print(self.tag)
    end
end
```
