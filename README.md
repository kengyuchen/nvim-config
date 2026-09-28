# Neovim Configuration

## Installation

### 1. Install Neovim

Install a recent version of Neovim.

On macOS with Homebrew:

```bash
brew install neovim
```

Check the installation:

```bash
nvim --version
```

### 2. Clone this configuration

If `~/.config/nvim` does not already exist:

```bash
git clone https://github.com/kengyuchen/nvim-config.git
```

### 3. Install GitHub Copilot (Optional)

`copilot.vim` is deliberately not stored in this repository. Install it separately using Neovim's native package mechanism:

```bash
mkdir -p ~/.config/nvim/pack/github/start
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```

Start Neovim:

```bash
nvim
```

Then authenticate GitHub Copilot inside Neovim:

```vim
:Copilot setup
```

Follow the authentication instructions shown by Copilot.

To check its status:

```vim
:Copilot status
```

## Updating Copilot

Update the manually installed Copilot plugin with:

```bash
cd ~/.config/nvim/pack/github/start/copilot.vim
git pull
```

## Updating this configuration

After modifying the Neovim configuration:

```bash
cd ~/.config/nvim
git status
git add .
git commit -m "Update Neovim configuration"
git push
```

## Restoring Everything on a New Machine

In summary:

```bash
# Install Neovim
brew install neovim

# Clone configuration
git clone git@github.com:YOUR_USERNAME/nvim-config.git ~/.config/nvim

# Install Copilot
mkdir -p ~/.config/nvim/pack/github/start
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim

# Start Neovim
nvim
```

Then run:

```vim
:Copilot setup
```

## Files Not Stored in Git

The following files/directories are intentionally excluded from this repository:

- `pack/github/start/copilot.vim/` — downloaded separately from GitHub
- macOS `.DS_Store` files
- Vim/Neovim swap and temporary files
