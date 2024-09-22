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
- [ ] use :make instead of Yona (see 
  <https://github.com/SixteenThousand/Yona>)
- [ ] bug: auto-generated code folding done by the :Fold command is 
  basically useless, just folding everything
- [ ] refactor terminal opening keymaps to use `:rightbelow`, `:vertical`, 
  etc.
- [ ] investigate startup time
- [ ] make quickfix keymaps
- [ ] make *list.nvim*, a plugin for editing lists in text
    - add :Number command
    - make keymap for putting a list on one line
    - make a keymap for putting a one-line list on separate lines; MUST be 
      able to deal with surrounding brackets, that's the whole point

---

#### Notes

- the next review of the todo list will be in early December
- echohl seems cool. That is all.
