return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
        local startify = require("alpha.themes.startify")

        -- Right-column ASCII art
        local totoro = {
            [[⠀⠀⠀⠀⠄⠀⠀⢸⣿⣿⣿⣄⠀⠀⠘⣿⢸⣿⣿⡇⠀⠀⢸⡾⡗⠀⢀⡀⡀⠀⠀⠈⣻⣾⠿⢿⣦⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠠⠀]],
            [[⠀⠀⠀⠀⠀⠀⠀⣾⣿⡟⢿⣿⣇⠀⠀⣿⢸⣿⣿⣿⠀⢠⠞⢰⡟⢀⠎⢀⣟⣠⠔⠉⢁⡿⣧⣤⣿⣷⡄⠀⠀⠀⢘⡁⠀⠀⠀⠀⠀⠀]],
            [[⣄⣄⠂⠀⠀⠀⠀⣿⣿⡄⠈⢿⣿⣧⡀⢻⣿⣿⣿⣿⡷⠋⠀⠘⣿⡏⢠⠎⠀⡄⠀⠀⡞⣠⠞⠁⣷⡜⢿⣝⡆⠀⣿⡿⠀⢀⡄⠀⠀⠀]],
            [[⡛⠿⣷⣦⣤⣄⣀⣸⣿⣧⡀⠀⠙⢿⣿⡎⣿⣿⣿⠟⠁⠀⠀⢠⡏⣧⡎⠀⠀⡇⠀⢸⡟⠁⠀⢰⢿⣷⠘⣿⣿⢰⣿⡗⠀⣾⡟⠀⠀⠀]],
            [[⣷⠀⠀⠻⡏⠛⠻⡿⣿⣿⣿⣷⣦⣀⠙⠷⢿⣿⠏⠀⠀⠀⠀⠈⡇⡾⠳⠀⠀⠙⡿⠋⠀⠀⠀⣼⠀⠹⣿⣿⡏⣾⣿⠁⢸⣿⠁⠀⠀⠀]],
            [[⣮⣧⣔⠠⣇⠀⠀⠃⣹⣿⣇⠙⠿⠿⠷⠿⣿⠏⠀⠀⠀⠀⠀⢸⠷⣇⠘⠀⢀⡞⠁⠀⠀⠀⢀⡇⠀⠀⢻⣿⢠⣿⣿⢠⣿⠇⠀⠀⠀⣸]],
            [[⢘⡿⠛⠋⠉⠉⠉⠉⠉⠉⠙⠲⢤⡀⠀⢸⡏⠀⠀⠀⠀⠀⠐⠛⠒⠛⠒⠲⠞⠀⠀⠀⠀⠀⣸⠃⠀⠀⠈⡏⣸⣿⠏⣼⡏⠀⠀⠀⢠⣿]],
            [[⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣦⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡟⠀⠀⠀⣼⣠⣿⣇⣼⡟⠀⠀⠀⣠⣿⣿]],
            [[⠀⠀⠀⠀⠀⠀⠲⣄⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⠀⠀⣠⠇⢉⣽⣿⣿⣄⠀⠀⣴⣿⣿⣿]],
            [[⠀⠀⠀⠀⠀⠀⠀⠈⢣⣠⠞⢻⣆⣰⠋⠹⡄⠀⠀⣰⠋⢁⡉⣇⠀⠀⠀⠀⠀⠀⢀⣠⣀⣼⢻⡇⢠⡿⢠⣿⣿⢇⣾⡿⠀⣰⣿⣿⣿⣿]],
            [[⠀⠀⠀⠀⠀⠀⠀⠑⠢⢿⡀⠀⢻⠁⢀⣾⡇⠀⠀⠘⣄⣈⣡⡇⠀⠀⠀⠷⠦⠀⡏⢽⠈⣿⢸⣷⣾⣇⣾⣿⣳⣿⣿⡇⠀⣿⣿⣿⣿⣿]],
            [[⠀⠀⠀⠀⠀⠀⣠⠖⠋⠛⢿⠷⣤⠗⢋⡟⠀⠀⠀⠀⠘⠃⠀⠀⠀⠀⠀⠀⠀⠀⠱⠤⠜⣿⠀⣿⡿⢻⣿⣿⣿⣿⡟⠀⣼⣿⣿⣿⣿⣿]],
            [[⠀⠀⠀⠀⢐⡿⠋⠀⠀⣰⡯⠔⠃⣠⠋⠀⣀⣠⠤⠤⠒⠒⠒⠒⠒⠒⠠⠤⢤⣀⠀⠀⠀⡿⠀⣿⠥⠾⢿⣿⣿⡿⠁⠀⢻⣿⣿⣿⣿⣿]],
            [[⠀⠀⠀⠀⢸⠁⠀⠀⠀⣇⠀⣠⠾⠛⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠉⠲⣤⣇⠀⡇⠀⠀⠀⠀⠈⠙⠒⣶⣿⣿⣿⣿⣿⣿]],
            [[⠧⣄⡀⠀⠈⣧⣀⣀⣤⣿⠟⠁⠀⠀⢀⣤⣶⠖⣲⡄⠀⠀⠀⢀⡴⠋⢁⠘⢷⠀⠀⠀⠈⠳⣄⢱⡀⠀⢀⣀⣀⣠⡤⠭⠼⠿⣿⣿⣿⣿]],
            [[⠀⠀⢹⠉⠛⢻⣿⠟⣻⠏⠀⠀⠀⣴⠿⠟⠛⠛⠻⡇⠀⠀⠴⠟⠛⠉⠉⠙⢿⡇⠀⠀⣴⣦⠘⣷⠀⠀⠀⠀⠀⠀⢀⣤⣤⣾⣿⣿⣿⣿]],
            [[⠀⠀⣾⡞⠉⢙⡏⢠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⢀⡾⠟⢿⣇⢸⣆⣠⣴⠞⢋⣿⣿⣿⣿⣿⣿⣿⣿⡏]],
            [[⠀⠀⣼⡇⠀⣸⠀⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⠀⠀⠈⠛⢸⣿⡿⠁⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⠁]],
            [[⡀⠀⢈⡇⠀⡏⠀⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠏⠀⠀⠀⠀⠀⢸⠟⠁⣠⣾⣿⣿⣿⣿⣿⣏⣹⢿⣿⡆]],
            [[⠀⠠⠾⣷⣼⠃⠀⢼⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⢀⣿⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⡄⠐⣿⣿]],
            [[⠀⠀⢼⢻⢿⠀⠀⠈⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⠁⠛⠛⠛⠀⠈⠀]],
            [[⠓⠀⠀⠀⢸⡄⠀⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠙⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣟⡉⢉⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠀⠀⢰⢿⡄⠀⠀⠀⠀⠈⠙⠒⢤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⠗⠋⣿⣿⣿⣿⣿⣿⡿⠀⣁⣀⠀⠀⠀⠀⣀]],
            [[⣤⣾⣦⢦⠀⣠⣷⡀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⣀⣠⣴⣟⣉⣽⣁⡄⠻⢻⣿⣿⣿⣿⣿⣷⣤⣿⠿⢣⣾⣿⣿⣿]],
        }

        -- Header / footer (edit these)
        local v = vim.version()
        local header_text = string.format("JKVIM v%d.%d.%d", v.major, v.minor, v.patch)

        local footer_buttons = {
            { sc = "e", txt = "New file", cmd = "<cmd>ene <CR>" },
            { sc = "L", txt = "Lazy", cmd = "<cmd>Lazy <CR>" },
            { sc = "q", txt = "Quit", cmd = "<cmd>q <CR>" },
        }

        -- Layout
        local min_left = 50
        local gap = 6
        local art_hl = "Type"
        local button_sep = "   "
        local mru_path_width = 50

        local function display_width(s)
            return vim.fn.strdisplaywidth(s)
        end

        -- Path shortening (theta-style: keep last segments, collapse the rest)
        local function join_path(parts)
            if parts[1] == "" then
                return "/" .. table.concat(parts, "/", 2)
            end
            return table.concat(parts, "/")
        end

        local function collapse_path(parts, keep_last)
            local n = #parts
            local out = {}
            for i, part in ipairs(parts) do
                if part == "" or part == "~" or i > n - keep_last then
                    out[i] = part
                else
                    out[i] = vim.fn.strcharpart(part, 0, 1)
                end
            end
            return join_path(out)
        end

        local function shorten_path(path, target)
            if display_width(path) <= target then
                return path
            end
            local parts = vim.split(path, "[/\\]", { trimempty = false })
            local short = collapse_path(parts, 2)
            if display_width(short) > target then
                short = collapse_path(parts, 1)
            end
            return short
        end

        local function mru(start, cwd, items_number)
            items_number = items_number or 10
            local opts = startify.mru_opts
            local found = require("alpha.utils").get_mru(cwd, items_number, opts.ignore)
            local tbl = {}
            for i, fn in ipairs(found) do
                local short_fn = cwd and vim.fn.fnamemodify(fn, ":.") or vim.fn.fnamemodify(fn, ":~")
                short_fn = shorten_path(short_fn, mru_path_width)
                tbl[i] = startify.file_button(fn, tostring(i + start - 1), short_fn, opts.autocd)
            end
            return { type = "group", val = tbl, opts = {} }
        end

        -- Footer button row
        local function button_row(buttons)
            local parts = {}
            local hl = {}
            local col = 0
            for i, b in ipairs(buttons) do
                if i > 1 then
                    col = col + #button_sep
                end
                local label = "[" .. b.sc .. "] " .. b.txt
                parts[#parts + 1] = label
                table.insert(hl, { "Operator", col, col + 1 })
                table.insert(hl, { "Number", col + 1, col + 1 + #b.sc })
                table.insert(hl, { "Operator", col + 1 + #b.sc, col + 2 + #b.sc })
                col = col + #label
            end
            return {
                type = "text",
                val = table.concat(parts, button_sep),
                opts = { hl = hl, shrink_margin = false },
            }
        end

        local function bind_footer_buttons(buf)
            for _, b in ipairs(footer_buttons) do
                vim.keymap.set("n", b.sc, b.cmd, {
                    buffer = buf,
                    noremap = true,
                    silent = true,
                    nowait = true,
                })
            end
        end

        -- Flatten Alpha groups into a single list of rows
        local function resolve_val(val)
            if type(val) == "function" then
                return val()
            end
            return val
        end

        local function as_string(val)
            val = resolve_val(val)
            if type(val) == "table" then
                return val[1] or ""
            end
            if type(val) == "string" then
                return val
            end
            return ""
        end

        local function flatten(section, out)
            out = out or {}
            if not section then
                return out
            end

            if type(section) == "table" and section[1] and not section.type then
                for _, child in ipairs(section) do
                    flatten(child, out)
                end
                return out
            end

            local typ = section.type
            if typ == "group" then
                flatten(resolve_val(section.val), out)
            elseif typ == "padding" then
                local n = resolve_val(section.val)
                if type(n) == "number" then
                    for _ = 1, n do
                        table.insert(out, { type = "padding", val = 1 })
                    end
                end
            elseif typ == "text" or typ == "button" then
                table.insert(out, {
                    type = typ,
                    val = as_string(section.val),
                    on_press = section.on_press,
                    opts = vim.deepcopy(section.opts or {}),
                })
            end
            return out
        end

        -- Two-column zip (startify left, art right)
        local function left_label(el)
            if el.type == "button" then
                local shortcut = (el.opts and el.opts.shortcut) or ""
                return shortcut .. as_string(el.val)
            end
            if el.type == "text" then
                return as_string(el.val)
            end
            return ""
        end

        local function art_width(art)
            local width = 0
            for _, line in ipairs(art) do
                width = math.max(width, display_width(line))
            end
            return width
        end

        local function attach_art(el, left, left_width, art_line)
            local pad = math.max(0, left_width - display_width(left))
            local prefix = as_string(el.val)
            if el.type == "padding" then
                prefix = ""
            end
            local art_start = #prefix + pad + gap
            el.val = prefix .. string.rep(" ", pad + gap) .. art_line
            el.type = el.type == "padding" and "text" or el.type
            el.opts = el.opts or {}
            el.opts.shrink_margin = false

            local hl = el.opts.hl
            if type(hl) == "string" then
                el.opts.hl = {
                    { hl, 0, #prefix },
                    { art_hl, art_start, art_start + #art_line },
                }
            elseif type(hl) == "table" then
                table.insert(hl, { art_hl, art_start, art_start + #art_line })
            else
                el.opts.hl = { { art_hl, art_start, art_start + #art_line } }
            end
            return el
        end

        local function displayed_width(el)
            if el.type == "button" then
                local shortcut = (el.opts and el.opts.shortcut) or ""
                return display_width(shortcut .. as_string(el.val))
            end
            if el.type == "text" then
                return display_width(as_string(el.val))
            end
            return 0
        end

        local function pad_to_block(items)
            local width = 0
            for _, el in ipairs(items) do
                width = math.max(width, displayed_width(el))
            end
            for _, el in ipairs(items) do
                if el.type == "button" or el.type == "text" then
                    local extra = width - displayed_width(el)
                    if extra > 0 then
                        el.val = as_string(el.val) .. string.rep(" ", extra)
                    end
                    el.opts = el.opts or {}
                    el.opts.shrink_margin = false
                end
            end
            return items
        end

        local function zip_columns(items, art)
            local win_width = vim.o.columns
            local ok, width = pcall(vim.api.nvim_win_get_width, 0)
            if ok then
                win_width = width
            end

            local left_width = min_left
            for _, el in ipairs(items) do
                left_width = math.max(left_width, display_width(left_label(el)))
            end

            local needed = left_width + gap + art_width(art)
            if needed > win_width then
                return items
            end

            local left_shift = 0
            local art_shift = 0
            if #art < #items then
                art_shift = math.floor((#items - #art) / 2)
            else
                left_shift = math.floor((#art - #items) / 2)
            end

            local result = {}
            local rows = math.max(#items + left_shift, #art + art_shift)
            for i = 1, rows do
                local el = items[i - left_shift]
                local art_line = art[i - art_shift] or ""
                if not el then
                    result[i] = attach_art({
                        type = "text",
                        val = "",
                        opts = {},
                    }, "", left_width, art_line)
                elseif art_line == "" then
                    result[i] = el
                else
                    local left = left_label(el)
                    result[i] = attach_art(el, left, left_width, art_line)
                end
            end
            return result
        end

        -- Dashboard layout
        require("alpha").setup({
            layout = {
                {
                    type = "group",
                    val = function()
                        local items = flatten({
                            {
                                type = "text",
                                val = header_text,
                                opts = { hl = "SpecialComment", shrink_margin = false },
                            },
                            {
                                type = "group",
                                val = function()
                                    local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
                                    return {
                                        { type = "padding", val = 1 },
                                        { type = "text", val = cwd, opts = { hl = "SpecialComment", shrink_margin = false } },
                                        { type = "padding", val = 1 },
                                        {
                                            type = "group",
                                            val = function()
                                                return { mru(0, vim.fn.getcwd()) }
                                            end,
                                            opts = { shrink_margin = false },
                                        },
                                    }
                                end,
                            },
                            {
                                type = "group",
                                val = {
                                    { type = "padding", val = 1 },
                                    { type = "text", val = string.rep("─", min_left), opts = { hl = "Comment" } },
                                    { type = "padding", val = 1 },
                                    {
                                        type = "group",
                                        val = function()
                                            return { mru(10) }
                                        end,
                                    },
                                },
                            },
                            { type = "padding", val = 1 },
                            button_row(footer_buttons),
                        })
                        return pad_to_block(zip_columns(items, totoro))
                    end,
                    opts = {
                        position = "v_center",
                        inherit = {
                            position = "center",
                            shrink_margin = false,
                        },
                    },
                },
                startify.section.footer,
            },
            opts = vim.tbl_extend("force", startify.config.opts, {
                margin = 0,
                redraw_on_resize = true,
            }),
        })

        -- Bind footer shortcuts when Alpha opens
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                bind_footer_buttons(vim.api.nvim_get_current_buf())
            end,
        })
    end,
}
