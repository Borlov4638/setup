return {
  {
    "nosduco/remote-sshfs.nvim", -- правильный репозиторий
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- опционально, для иконок
    },
    config = function()
      -- Настройка remote-sshfs
      require("remote-sshfs").setup({
        connections = { ssh_config = true }, -- читаем ~/.ssh/config
        mounts = {
          base_dir = vim.fn.stdpath("data") .. "/remote-sshfs",
          unmount_on_exit = true,
        },
      })

      -- Подключаем расширение к Telescope
      local status, _ = pcall(require("telescope").load_extension, "remote-sshfs")
      if not status then
        vim.notify("Failed to load remote-sshfs extension for Telescope", vim.log.levels.ERROR)
      end
    end,
    keys = {
      {
        "<leader>rs",
        "<cmd>lua require('telescope').extensions['remote-sshfs'].connect()<CR>",
        desc = "SSHFS: Connect/Mount",
      },
      { "<leader>ru", "<cmd>RemoteSshfsUnmount<CR>", desc = "SSHFS: Unmount Current" },
      { "<leader>rU", "<cmd>RemoteSshfsUnmountAll<CR>", desc = "SSHFS: Unmount All" },
    },
  },
}
