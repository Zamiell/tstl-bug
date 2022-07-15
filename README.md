# tstl-bug

Steps to reproduce:

```sh
git clone git@github.com:Zamiell/tstl-bug.git
cd tstl-bug
npm ci
npx tstl
vim dist/main.lua
```

For reference, you can look at the minimal TSTL module here: https://github.com/Zamiell/tstl-module

The bugged code is here:

```lua
["lua_modules.@zamiell.tstl-module.dist.feature.feature"] = function(...) 
local ____exports = {}
local ____constants = require("lua_modules.@zamiell.tstl-module.dist.feature.constants") -- BUG HERE
local BASE_CONSTANT = ____constants.BASE_CONSTANT
local ____constants = require("lua_modules.@zamiell.tstl-module.dist.feature.constants")
local FEATURE_CONSTANT = ____constants.FEATURE_CONSTANT
```

Instead of this, TSTL should be outputting this:

```lua
["lua_modules.@zamiell.tstl-module.dist.feature.feature"] = function(...) 
local ____exports = {}
local ____constants = require("lua_modules.@zamiell.tstl-module.dist.constants") -- FIX HERE
local BASE_CONSTANT = ____constants.BASE_CONSTANT
local ____constants = require("lua_modules.@zamiell.tstl-module.dist.feature.constants")
local FEATURE_CONSTANT = ____constants.FEATURE_CONSTANT
```
