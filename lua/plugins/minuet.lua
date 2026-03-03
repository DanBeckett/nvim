return {
    -- Minuet plugin
    {
        'milanglacier/minuet-ai.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },  -- Plenary is a required dependency
        config = function()
            require('minuet').setup({
                provider = "openai",
                provider_options = {
                    openai = {
                        api_key = 'OPENAI_API_KEY',
                        end_point = 'https://api.openai.com/v1/chat/completions',
                        model = "gpt-4o-mini",
                        --model = "gpt-3.5-turbo",  -- or "gpt-4" for paid users
                    },
                    openai_compatible = {
                        api_key = os.getenv("OPENROUTER_API_KEY"),
                        end_point = "https://openrouter.ai/api/v1/chat/completions",
                        model = "mistralai/mistral-7b-instruct:free",
                    },
                },
                virtualtext = {
                    --auto_trigger_ft = {'lua'},
                    keymap = {
                        accept = '<A-A>',
                        accept_line = '<A-a>',
                        accept_n_lines = '<A-z>',
                        prev = '<A-[>',
                        next = '<A-]>',
                        dismiss = '<A-e>',
                    },
                },
            })
        end,
    },
    -- Uncomment and add nvim-cmp if you're using it
    -- {
    --   'hrsh7th/nvim-cmp',
    --   -- additional nvim-cmp setup here if needed
    -- },

    -- Uncomment if using blink.cmp with nvim-cmp
    -- {
    --   'Saghen/blink.cmp',
    --   -- additional blink setup if needed
    -- }
}
