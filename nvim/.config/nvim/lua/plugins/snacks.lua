return {
  'folke/snacks.nvim',
  opts = {
    dashboard = {
      preset = {
        header = [[
        

                      █████                       
                     ████████                     
                   ████████████                   
                 ████████████████                 
               ████████████████████               
             ███████████ ███████████              
           ███████████     ███████████            
         ███████████         ███████████          
        ███████████            ███████████        
                 █            ███████████         
               ███          ███████████ ██        
             █████        ███████████ ████        
           ███████       ██████████ ██████        
         █████████       ████████ ████████        
       ███████████       ██████ ██████████        
       ██████████        █████ █████████          
       ████████          ███ █████████            
       ██████            █ █████████              
       ████              ██████████               
       ██                ████████                 
                         ██████                   
                         ████                     
                         ██                       
        
      consume. enhance. replicate.       
        ]],
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'p', desc = 'Open Project', action = ':Telescope project' },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy' },
          { icon = '', key = 'm', desc = 'Mason', action = ':Mason' },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
      sections = {
        { section = 'header' },
        { section = 'keys', padding = 1 },
        { section = 'startup' },
      },
    },
  },
}
