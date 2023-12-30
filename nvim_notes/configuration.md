# Configuration

Neovim looks for configuration files at `~/.config/nvim`. To accomodate this with stow we nest our configuration in `.config/nvim`. 

```text
nvim/               <-- dotfiles organization
    .config/        <-- stow will extract config from here and place it in ~/.config
        nvim/       <-- nvim configuration lives here
nvim_notes/         <-- dotfiles organization
```

`:echo &runtimepath` will show you a list of the directories where Neovim looks for runtime files, including configuration files. Additionally, you can run `:echo stdpath("config")`.

Reload Neovim configuration changes by running `:luafile $MYVIMRC`. However, if there are modifications to module important (added/removed) then you'll need to restart nvim.

When loading, configuring, and debugging plugins you can run `:checkhealth <plugin-name>`.

The hard reset option is to delete Neovim's data directory at `echo stdpath("data")` here `rm -rf ~/.local/share/nvim`.

Default package configuration behavior

Configuration files in `.config/nvim/after/plugin` are evaluated automatically and the only way to prevent this behavior, if you have invalid configurations, is to prepend:

```lua
if true then
	return
end
```

1. System-Wide Configuration:
    Neovim first checks for a system-wide configuration file. The location of this file may vary depending on your operating system, but common locations include /etc/nvim/nvimrc (Linux) or C:\Program Files\Neovim\nvimrc (Windows).
2. User Configuration:
    Next, Neovim looks for a user-specific configuration file. This file is typically located at ~/.config/nvim/init.vim (for VimScript) or ~/.config/nvim/init.lua (for Lua). Users can customize Neovim by adding their configuration settings to this file.
3. Default Configuration Files:
    - Neovim loads a set of default configuration files and directories regardless of whether the user has a custom configuration. These include:
        - defaults.vim: Contains various default settings and key mappings.
        - autoload/: A directory where autoloaded functions and scripts can be placed.
        - ftplugin/: A directory for filetype-specific settings.
        - after/: A directory for user-specific customizations that are loaded after the main configuration. Users can place their customizations here to override default settings or plugin configurations.