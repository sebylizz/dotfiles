return {
    {
        "williamboman/mason.nvim",
        dependencies = "mfussenegger/nvim-jdtls",
        config = function()
            require("mason").setup();
        end
    }
}
