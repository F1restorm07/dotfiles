require('true-zen').setup{
modes = {
        minimalist = {
                options = {
                        number = true,
                        relativenumber = true,
                        signcolumn = "yes"
                        }
                }
        },
integrations = {
        tmux = true,
        lualine = true,
        }
}
