
local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        ____moduleCache[file] = { value = (select("#", ...) > 0) and module(...) or module(file) }
        return ____moduleCache[file].value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["main"] = function(...) 
local ____exports = {}
local ____tstl_2Dmodule = require("lua_modules.@zamiell.tstl-module.dist.index")
local doSomeFeature = ____tstl_2Dmodule.doSomeFeature
doSomeFeature(nil)
return ____exports
 end,
["lua_modules.@zamiell.tstl-module.dist.index"] = function(...) 
local ____exports = {}
do
    local ____export = require("lua_modules.@zamiell.tstl-module.dist.feature.feature")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["lua_modules.@zamiell.tstl-module.dist.feature.feature"] = function(...) 
local ____exports = {}
local ____constants = require("lua_modules.@zamiell.tstl-module.dist.feature.constants")
local BASE_CONSTANT = ____constants.BASE_CONSTANT
local ____constants = require("lua_modules.@zamiell.tstl-module.dist.feature.constants")
local FEATURE_CONSTANT = ____constants.FEATURE_CONSTANT
function ____exports.doSomeFeature(self)
    print("base constant:", BASE_CONSTANT)
    print("feature constant:", FEATURE_CONSTANT)
end
return ____exports
 end,
["lua_modules.@zamiell.tstl-module.dist.feature.constants"] = function(...) 
local ____exports = {}
____exports.FEATURE_CONSTANT = 456
return ____exports
 end,
}
return require("main", ...)
