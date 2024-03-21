## My Neovim Configuration

This is my new (for 2024) configuration of neovim, the editor that makes it 
feel like you built it yourself.

It's probably not the most slick config out there, but it works and if you're
interesting in writing one yourself it might be useful - feel free to contact
me with questions, although I make no promises about responding quickly!

---

### Features
- Fuzzy-finding any directory on your system with Telescope
- A session manager (see lua/amber)
- Way too many colourschemes installed!

### TODO
Please note this list is not really meant to be readable for anyone but me
- [ ] bug: fern-action-trash does not work
- [ ] refactor amber to fully utilise telescope API; use table for options 
  instead of "list" & use less commands (e.g. ":Amber quit" instead of 
  ":AmberQuit")
- [ ] create :Salt command that deletes current buffer and goes to other  
  buffer; should take 1 arg that is passed to :b, and if no args, open 
  telescope buffer picker
- [ ] create :Diff command to better handle :Git diff options?
    (vsplit/new tab and --cached optinos will have to handled)
<!-- [ ]  -->
