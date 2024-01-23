-- ++++++++++++ copied from the vim help ++++++++++++
-- no code in this file has been written by me, it is copied from vim 
-- documentation, and credit should go Bram Molenaar

--write some stuff here so vim uses powershell, vim commands are
--let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
--		let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
--		let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
--		let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
--		set shellquote= shellxquote=

vim.cmd("let &shell = executable('pwsh') ? 'pwsh' : 'powershell'")
vim.cmd("let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'")
vim.cmd("let &shellredir = '2>&1 | %%{ \"$_\" } | Out-File %s; exit $LastExitCode'")
vim.cmd("let &shellpipe  = '2>&1 | %%{ \"$_\" } | Tee-Object %s; exit $LastExitCode'")
vim.cmd("set shellquote= shellxquote=")
