vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>p", "\"+p")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")


vim.keymap.set("n", "<leader>m", function()
    local weekOfYear = os.date("%V")
    local year = os.date("%Y")
    local hour = os.date("%H")
    local day = os.date("%A")
    if tonumber(hour) > 16 then
        day = os.date("%A", os.time() + 86400)
    end
    local url = "https://sparnord.iss.dk/api/v1/iss-menu-plan/menus/" .. weekOfYear .. "/" .. year .. "/lunch"
    local handle = io.popen("curl -s -X 'GET' " .. url .. " -H 'accept: */*'")
    local result = handle:read("*a")
    handle:close()
    local str = tostring(result)

    local decoded_data = vim.json.decode(str)

    local daily_menus = decoded_data.data.attributes.daily_menus

    local translation = {
        ["Monday"] = "Mandag",
        ["Tuesday"] = "Tirsdag",
        ["Wednesday"] = "Onsdag",
        ["Thursday"] = "Torsdag",
        ["Friday"] = "Fredag"
    }

    local danish_day = translation[day]
    local menu_for_today = nil

    for _, menu in ipairs(daily_menus) do
        if menu.weekday == danish_day then
            menu_for_today = menu.menu_items
        end
    end

    if menu_for_today then
        local output = ""
        for _, item in ipairs(menu_for_today) do
            output = output .. item.name .. "\n"
        end
        output = output:sub(1, -2)
        require("notify")(output, "info", {title = danish_day .. "s menu:"})
    else
        require("notify")("No menu found :-(", "error")
    end
end)
