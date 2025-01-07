## My Neovim Configuration

This is my configuration of neovim, the editor that makes it feel like you 
built it yourself.

It's probably not the most slick config out there, but it works and if you're
interested in writing one yourself it might be useful - feel free to contact
me with questions, although I make no promises about responding quickly!

---

### Features

- A session manager (see lua/amber)
- Hand-written HTML tag completion (see `./lua/settings/custom.lua -> 
  tag_mode` for the code)
- Key bindings to run unit tests or build a project (uses 
  [Yona](https://github.com/SixteenThousand/Yona))
- Good error checking for plugin loading (always good if you want to drop 
  your config onto a new machine)
- Cross-platform functionality (i.e., this *should* still work on windows, 
  at least mostly ;))
- Way too many colourschemes!! You can never have enough colour schemes.


### TODO

*Please note this list is for my use only*
- [ ] refactor amber session manager:
    - [ ] split into actual plugin?
    - [ ] remove need to use telescope?
    - [ ] give option to save session files in project directory
    - [ ] fully utilise telescope API; use table for options instead of 
      "list"
    - [ ] integrate shada files into Amber sessions?
- [x] fix & extend `:Fold` command:
    - [x] have python-style indentation folding, OR more C-style indentation 
      folding, OR just use braces as fold markers
    - [x] make folds respect indentation
- [ ] make *list.nvim*, a plugin for editing lists in text
    - [x] add :Number command
    - [ ] make keymap for putting a list on one line
    - [ ] make a keymap for putting a one-line list on separate lines; MUST be 
      able to deal with surrounding brackets, that's the whole point
- [ ] Yona/terminal integration (see 
  <https://github.com/SixteenThousand/Yona>):
    - [ ] use `:make` with `yona build`?
    - [ ] get output from yona into quickfix list (may need to do filetype 
      detection)
    - [ ] refactor terminal opening keymaps to use `:rightbelow`, 
      `:vertical`, etc.

---

#### Notes

- the next review of the todo list will be in March
- echohl seems cool. That is all.
