# Neovim

Download the pre-built binary for Linux and check if the archive is good using
the checksum [found on the release page](https://github.com/neovim/neovim/releases/tag/stable).

```bash
curl -JOL https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
echo "fee870b6173f1da134281824a744ada91ef612723bd328683dc941ef16837ec5  nvim-linux64.tar.gz" | sha256sum -c -
```

Note: The checksum used above is for version 0.9.2 which is the latest stable
release on 2023-09-16.

If the archive is good, the last command prints `nvim-linux64.tar.gz: OK`

Extract the archive and copy the hierarchy in `/usr/local` to install neovim.

```bash
tar zxvf nvim-linux64.tar.gz
sudo cp -r nvim-linux64/* /usr/local
```

# The plugin manager

Install the **vim-plug** plugin manager.

The following command downloads a Vimscript to `~/.local/share/nvim` which
will be auto-loaded on neovim startup.

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

# The language servers (LSP)

In order to activate LSP support for a language in neovim, install the
language server first. Then configure the **lspconfig** plugin to use it.
Refer to the sub-sections below to setup some popular languages.

<details>
    <summary>HTML/CSS</summary>

Install the language server:

```bash
npm i -g vscode-langservers-extracted
```

Edit `~/.config/nvim/lua/lsp/lspconfig.lua` and add the following entries to
the `servers` list.

```lua
local servers = {
  ...
  'html',
  'cssls',
}
```
</details>

<details>
    <summary>Typescript</summary>

Install the language server:

```bash
npm i -g typescript typescript-language-server
```

Edit `~/.config/nvim/lua/lsp/lspconfig.lua` and add the following entries to
the `servers` list.

```lua
local servers = {
  ...
  'tsserver',
}
```
</details>

<details>
    <summary>Python</summary>

There are multiple language servers available for Python such as pyright,
python-lsp-server, etc. Pylyzer is a recent one developed in Rust which makes
it fast and efficient.

Install the **pylyzer** language server for Python by downloading a pre-built
binary from its
[GitHub repository](https://github.com/mtshiba/pylyzer/releases).

```bash
curl -JOL https://github.com/mtshiba/pylyzer/releases/download/v0.0.45/pylyzer-x86_64-unknown-linux-gnu.tar.gz
tar zxvf pylyzer-x86_64-unknown-linux-gnu.tar.gz
sudo cp pylyzer /usr/local/bin/
```

As pylyzer does not provide linting, a linter is needed as a complement. Ruff
is a Python linter also developed in Rust.

Install the **ruff** linter by downloading a pre-built binary from its [GitHub
repositoy](https://github.com/astral-sh/ruff/releases).

```bash
curl -JOL https://github.com/astral-sh/ruff/releases/download/v0.0.290/ruff-x86_64-unknown-linux-gnu.tar.gz
tar zxvf ruff-x86_64-unknown-linux-gnu.tar.gz
sudo cp ruff /usr/local/bin/
```

Edit `~/.config/nvim/lua/lsp/lspconfig.lua` and add the following entries to
the `servers` list.

```lua
local servers = {
  ...
  'pylyzer',
  'ruff_lsp',
}
```
</details>

<details>
    <summary>Svelte</summary>

Install the language server:

```bash
npm i -g svelte-language-server
```

Note: This language server depends on the Typescript one, i.e. **tsserver**.

Edit `~/.config/nvim/lua/lsp/lspconfig.lua` and add the following entries to
the `servers` list.

```lua
local servers = {
  ...
  'svelte',
}
```
</details>

<details>
    <summary>Lua</summary>

Install the **lua-language-server** by downloading a pre-built binary from its
[GitHub repository](https://github.com/LuaLS/lua-language-server/releases).

```bash
curl -JOL https://github.com/LuaLS/lua-language-server/releases/download/3.7.0/lua-language-server-3.7.0-linux-x64.tar.gz
mkdir /opt/lua-language-server
tar zxvf lua-language-server-3.7.0-linux-x64.tar.gz --directory /opt/lua-language-server
```

Create a wrapper script at `/usr/local/bin/lua-language-server` because the
language server [expects to find the scripts in a fixed location relative to
the directory it is run from](https://github.com/LuaLS/lua-language-server/wiki/Getting-Started#command-line).

```bash
#!/bin/bash
exec "/opt/lua-language-server/bin/lua-language-server" "$@"
```

Make it executable with `sudo chmod +x /usr/local/bin/lua-language-server`.

Edit `~/.config/nvim/lua/lsp/lspconfig.lua` and add the following entries to
the `servers` list.

```lua
local servers = {
  ...
  'lua_ls',
}
```
</details>

<details>
    <summary>TailwindCSS</summary>

Install the language server:

```bash
npm i -g @tailwindcss/language-server
```

Edit `~/.config/nvim/lua/lsp/lspconfig.lua` and add the following entries to
the `servers` list.

```lua
local servers = {
  ...
  'tailwindcss',
}
```
</details>

<details>
    <summary>Bash</summary>

Install the language server:

```bash
npm i -g bash-language-server
```

Edit `~/.config/nvim/lua/lsp/lspconfig.lua` and add the following entries to
the `servers` list.

```lua
local servers = {
  ...
  'bashls',
}
```
</details>

# The configuration

Download our neovim configuration.

```bash
git clone https://github.com/k-joey/nvim-config.git ~/.config/nvim
```

Start neovim and run `:PlugInstall` to install all the plugins. Then quit
neovim.

Edit `~/.config/nvim/init.lua` and uncomment the `require` lines at the end of
the file to enable the plugins and load their configuration.

Start neovim. Enjoy.
