return {
    {
	"nvim-treesitter/nvim-treesitter", 
	branch = 'master', 
	lazy = false, 
	build = ":TSUpdate",
	config = function()
	    local configs = require('nvim-treesitter.configs')
	    configs.setup({
		highlight = { enable = true },
		indent = { enable = true },
		autotage = { enable = true },
		ensure_installed = { "lua", "tsx", "typescript", 'html', 'css', 'rust', 'c_sharp' },
		auto_install = false
	    })
	end
    }
}
