-- myformatter.lua

local M = {}

function M.formatShaderLab(code)
    local indentLevel = 0
    local formattedCode = ""

    -- Iterate through each line of the code
    for line in code:gmatch("[^\r\n]+") do
        -- Trim leading and trailing whitespaces
        line = line:match("^%s*(.-)%s*$")

        -- Increase indentation for opening braces
        if line:find("{") then
            formattedCode = formattedCode .. string.rep("    ", indentLevel) .. line .. "\n"
            indentLevel = indentLevel + 1
            -- Decrease indentation for closing braces
        elseif line:find("}") then
            indentLevel = math.max(indentLevel - 1, 0)
            formattedCode = formattedCode .. string.rep("    ", indentLevel) .. line .. "\n"
            -- Maintain indentation for other lines
        else
            formattedCode = formattedCode .. string.rep("    ", indentLevel) .. line .. "\n"
        end
    end

    return formattedCode
end

return M
