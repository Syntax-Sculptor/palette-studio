-- Shims for include

include = require

-- Reimplementation of Isaac's `Random` function. Isaac's `Random` function generates a random
-- 32-bit integer.
Random = function()
    return love.math.random(0, 4294967295)
end

-- Shims for the RNG class
-- TODO: seed shifting. For now seed related functions just exist so Love won't error.
local RNGMT = {}
RNGMT.__index = RNGMT
RNGMT.__type = "RNG"

RNG = {}

-- For now this exists to prevent errors
function RNGMT:GetSeed()
    return self.Seed
end

function RNGMT:RandomFloat()
    return self.Generator:random()
end

function RNGMT:RandomInt(min, max)
    if max == nil then
        return self.Generator:random(0, min - 1)
    else
        return self.Generator:random(min, max)
    end
end

function RNGMT:SetSeed(seed)
    self.Generator:setSeed(seed)
    self.Seed = seed
end

function RNGMT:Next()
    self.Generator:random()
end

setmetatable(RNG, {
    -- Omit shift index, not really needed.
    __call = function(rng, seed)
        seed = seed or Random()
        local self = {}
        self.Generator = love.math.newRandomGenerator(seed)
        self.Seed = seed
        return setmetatable(self, RNGMT)
    end
})

-- Shims for the Isaac class.

Isaac = {}

function Isaac.WorldToScreen(vector)
    return vector
end

-- Shims for the Renderer class.

Renderer = {}

function Renderer.LoadImage(path)
    return path
end

-- Shims for the DestinationQuad class.

DestinationQuad = {}

function DestinationQuad.NewFromRectangle(topLeft, w, h)
end

