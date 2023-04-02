ECHO Starting neovim setup
cd %USERPROFILE%\AppData\Local

mklink /D nvim %USERPROFILE%\dotfiles\nvim\.config\nvim

PAUSE
