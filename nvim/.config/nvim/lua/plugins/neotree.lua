return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    config = function()
        require('neo-tree').setup {
            auto_clean_after_session_restore = false, -- Automatically clean up broken neo-tree buffers saved in sessions
            source_selector = {
                winbar = true,
            },
            filesystem = {
                bind_to_cwd = true,
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = {
                        -- add extensions to explicitly hide
                        '.DS_Store',
                    },
                    never_show = {},
                },
            },
            follow_current_file = {
                enabled = true,          -- This will find and focus the file in the active buffer every time
                --               -- the current file is changed while the tree is open.
                leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            default_component_configs = {
                name = {
                    use_git_status_colors = false,
                },
            },
            window = {
                color_set = 'siva',
            },
        }
        vim.keymap.set('n', '<leader>n', function()
            vim.cmd [[Neotree toggle]]
        end)
    end,
}
