return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
        theme = 'hyper',
        config = {
            header = {
                '██╗████████╗    ██╗     ██╗         ██████╗ ███████╗',
                '██║╚══██╔══╝    ██║     ██║         ██╔══██╗██╔════╝',
                '██║   ██║       ██║     ██║         ██████╔╝█████╗  ',
                '██║   ██║       ██║     ██║         ██╔══██╗██╔══╝  ',
                '██║   ██║       ███████╗███████╗    ██████╔╝███████╗',
                '╚═╝   ╚═╝       ╚══════╝╚══════╝    ╚═════╝ ╚══════╝',
                '                                                    ',
                '         ██████╗ ███████╗██╗   ██╗████████╗         ',
                '         ██╔══██╗██╔════╝╚██╗ ██╔╝╚══██╔══╝         ',
                '         ██████╔╝█████╗   ╚████╔╝    ██║            ',
                '         ██╔══██╗██╔══╝    ╚██╔╝     ██║            ',
                '         ██║  ██║███████╗   ██║      ██║            ',
                '         ╚═╝  ╚═╝╚══════╝   ╚═╝      ╚═╝            ',
                '                                                    ',
            },
            shortcut = {
                { desc = ' danbeckett' },
                { desc = ' Find File ', group = '@property', action = 'Telescope find_files', key = 'f' },
                { desc = ' Recently Used Files ', group = '@variable', action = 'Telescope oldfiles', key = 'r' },
                { desc = ' Config ', group = '@function.builtin', action = 'edit ~/.config/nvim/init.lua', key = 'c' },
                { desc = ' Lazy ', group = '@variable.builtin', action = 'Lazy', key = 'l' },
            },
        }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
