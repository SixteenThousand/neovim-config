# My Neovim Configuration

This is my configuration of neovim, the editor that makes it feel like you 
built it yourself.

It's probably not the most slick config out there, but it works and if you're
interested in writing one yourself it might be useful - feel free to contact
me with questions, although I make no promises about responding quickly!

---

## Features

- A session manager (see `lua/amber`)
- Hand-written HTML tag completion (see `./lua/settings/custom.lua -> 
  tag_mode` for the code)
- Key bindings to run unit tests or build a project (uses 
  [Yona](https://github.com/SixteenThousand/Yona))
- Good error checking for plugin loading (always good if you want to drop 
  your config onto a new machine)

---

## Installing Language Servers
For future reference, here is how I installed the language servers that I 
use:
- [pyright](https://github.com/Microsoft/pyright) was installed globally via 
  pnpm
- [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server) 
  was installed globally via pnpm
- [gopls](https://github.com/golang/tools) was installed using my system 
  package manager
- [clangd](https://clangd.llvm.org/installation) was installed by my system 
  package manager; the package is `clang-tools-extra` on Fedora, `clangd` on 
  Debian
