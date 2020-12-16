# Credits to https://github.com/mcornella/dotfiles

This is a simplified version for me

## Requirements

- git
- zsh installed and set up:
  1. Install zsh (e.g. `apt-get install zsh`)
  2. Use zsh as default shell: `chsh -s $(which zsh)`
  - _Restart the user session to apply the change._
  - _`chsh` doesn't work in every system._

## Usage

1. Download or clone repository:

```sh
git clone --depth 1 git@github.com:codelytv/dotfiles.git
```

2. Update git submodules:

```sh
cd dotfiles
git submodule init
git submodule update
```

3. Run init script: `./init.zsh`

4. Restart the shell or run `exec zsh`
