## My Neovim Configuration

This is my new (for 2024) configuration of neovim, the editor that makes it 
feel like you built it yourself.

It's probably not the most slick config out there, but it works and if you're
interested in writing one yourself it might be useful - feel free to contact
me with questions, although I make no promises about responding quickly!

---

### Features
- Fuzzy-finding for any directory on your system with Telescope
- A session manager (see lua/amber)
- Way too many colourschemes!

### TODO
*Please note this list is not really meant to be readable for anyone but me*
- [ ] refactor amber to fully utilise telescope API; use table for options 
  instead of "list"
- [ ] integrate shada files into Amber sessions?
- [ ] incorporate :Git difftool into my workflow? (see 
  ![vim-fugitive](https://github.com/tpope/vim-fugitive))
- [ ] use :make instead of Yona (see 
  <https://github.com/SixteenThousand/Yona>)
- [ ] create colour/style options popover/floating menu; should configure
    - vim.o.background (dark/light)
    - guibg (:highlight Normal guibg={NONE/DEFAULT})\
    - ![neovide](https://neovide.dev/index.html) settings
    use
    - nvim_open_win()
    - nvim_create_buf()
    - nvim_close_win()
- [ ] add some kind of window switcher, possibly just using 
  ggandor/leap.nvim
- [ ] bug: auto-generated code folding done by the :Fold command is 
  basically useless, just folding everything
- [ ] refactor terminal opening keymaps with `:rightbelow`, `:vertical`, 
  etc.

---

#### Notes
- the next review of the todo list will be in early September 
- echohl seems cool. That is all.
