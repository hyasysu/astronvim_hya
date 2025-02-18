# AstroNvim Template

**NOTE:** This is for AstroNvim v4+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/hyasysu/astronvim_hya.git ~/.config/nvim
```

#### Clone the repository by ssh
```shell
git clone git@github.com:hyasysu/astronvim_hya.git ~/.config/nvim
```

#### Windows
```shell
git clone git@github.com:hyasysu/astronvim_hya.git $env:LOCALAPPDATA\nvim
```

#### Start Neovim

```shell
nvim
```

#### PS
When you want to add markdownpreview-nvim, you should install `yarn`.
```
npm install -g yarn

cd ~/.local/share/nvim/lazy/markdown-preview.nvim/app
yarn install
```
