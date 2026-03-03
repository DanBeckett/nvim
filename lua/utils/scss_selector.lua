local M = {}

local function resolve_selector(parent, current)
    if not parent then
        return current
    end

    if current:find("&") then
        return current:gsub("&", parent)
    else
        return parent .. " " .. current
    end
end

local function get_full_selector()
    local node = vim.treesitter.get_node()

    if not node then
        return "No Treesitter node found"
    end

    local selectors = {}
    local full_selector = nil

    while node do
        if node:type() == "rule_set" then
            for child in node:iter_children() do
                if child:type() == "selectors" then
                    local text = vim.treesitter.get_node_text(child, 0)
                    table.insert(selectors, 1, text)
                end
            end
        end
        node = node:parent()
    end

    for _, sel in ipairs(selectors) do
        if not full_selector then
            full_selector = sel
        else
            full_selector = resolve_selector(full_selector, sel)
        end
    end

    if full_selector then
        return full_selector
    else
        print "No selector found"
    end
end

function M.print_full_selector()
    print(get_full_selector())
end

function M.copy_full_selector()
    vim.fn.setreg("+", get_full_selector())
end

return M
