## My Neovim Configuration

This is my new (for 2024) configuration of neovim, the editor that makes it 
feel like you built it yourself.

It's probably not the most slick config out there, but it works and if you're
interested in writing one yourself it might be useful - feel free to contact
me with questions, although I make no promises about responding quickly!

---

### Features
- Fuzzy-finding any directory on your system with Telescope
- A session manager (see lua/amber)
- Way too many colourschemes installed!

### TODO
*Please note this list is not really meant to be readable for anyone but me*
- [-] bug: fern-action-trash does not work on windows (canclled: who uses 
  windows anyway?)
- [ ] refactor amber to fully utilise telescope API; use table for options 
  instead of "list" & use less commands (e.g. ":Amber quit" instead of 
  ":AmberQuit")
- [-] add Amber function to wipe current buffer list without quitting vim 
  (use special file as homepage to go to on wiping) (turns out this exists 
  in vim already)
- [ ] integrate shada files into Amber sessions?
- [x] create :Salt command that deletes current buffer and goes to other  
  buffer; should take 1 argument that is passed to :b, and if no arguments, 
  open telescope buffer picker
- [x] create :Diff command to better handle :Git diff options?
    (vsplit/new tab and --cached options will have to handled)
- [ ] incorporate :Git difftool into my workflow? (see 
  ![vim-fugitive](https://github.com/tpope/vim-fugitive))
- [x] extend capabilities of 
  ![vim-closetag](https://github.com/alvan/vim-closetag) to any filetype
- [ ] use :make instead of Yona (see 
  <https://github.com/SixteenThousand/Yona>)
- [-] bug: ![telescope](https://github.com/nvim-telescope/telescope.nvim) 
  regularly crashes neovim (fixed in later vim updates)
- [ ] create colour/style options popover/floating menu; should configure
    - vim.o.background (dark/light)
    - guibg (:highlight Normal guibg={NONE/DEFAULT})\
    - ![neovide](https://neovide.dev/index.html) settings
    use
    - nvim_open_win()
    - nvim_create_buf()
    - nvim_close_win()
- [x] add proper code completion & snippet support
- [ ] add some kind of window switcher, possibly just using 
  ggandor/leap.nvim
- [ ] bug: auto-generated code folding done by the :Fold command is 
  basically useless, just folding everything
- [ ] refactor terminal opening keymaps with `:rightbelow`, `:vertical`, 
  etc.
- [ ] refactor current snippets & add more snippets using new vim.snippets 
  module

---

#### Notes
- The config is now working on Linux, and updates to it are going to be 
  pushed here. To avoid version conflicts when pulling to the windows 
  version, lazy-lock.json has been `--assumed-unchanged`'ed *temporarily* on 
  Linux.
  In future, the Linux version will likely become the primary version.
- Update: yup, it's the main version now. In a different copy of the repo 
  now though, so no need to worry about the `--assume-unchanged` above
- The next overall review of the config is due in early June
