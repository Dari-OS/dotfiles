-- File: lua/plugins/lsp/lsp-loader.lua

-- Store the loaded config data
local config_data = nil

-- Function to load the config file
local function load_config()
    -- Attempt to require the config file
    local status, config = pcall(require, "config.lsp-config")
    if status then
        -- If successful, store and return the config data
        config_data = config
        return config_data
    else
        -- If loading fails, throw an error with the failure message
        error("Failed to load the config file: " .. tostring(config))
    end
end

-- Create the lsp_loader table with a custom metatable
local lsp_loader = setmetatable({}, {
    -- Define the __index metamethod for custom property access
    __index = function(_, key)
        -- Load the config if it hasn't been loaded yet
        if not config_data then
            load_config()
        end
        
        -- Collect values for the given key across all language configs
        local result = {}
        for _, lang in ipairs(config_data) do
            if lang[key] then
                table.insert(result, lang[key])
            end
        end
        -- Return the collected values or nil if none found
        return #result > 0 and result or nil
    end
})

-- Initialization function for the loader
function lsp_loader.init()
    -- Load the config if it hasn't been loaded yet
    if not config_data then
        load_config()
    end
end

-- Return the plugin specification for Lazy.nvim
return {
    -- Specify the plugin directory
    dir = vim.fn.stdpath("config") .. "/lua/plugins/lsp",
    -- Set the plugin name
    name = "lsp-loader",
    -- Define the config function that Lazy.nvim will run
    config = function()
        lsp_loader.init()  -- Initialize the loader
    end,
    -- Expose the lsp_loader table for use in other files
    loader = lsp_loader,
}
