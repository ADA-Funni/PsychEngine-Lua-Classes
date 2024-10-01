function AddProperty(name, value) setProperty(name, getProperty(name) + value) end

function math.lerp(to, from, ratio)
    return (from + (to - from)) * ratio
end

function math.quickInterpolate(obj, elapsed, defaultProp, speed)
    setProperty(obj, math.lerp(getProperty(obj), defaultProp, elapsed * speed))
end