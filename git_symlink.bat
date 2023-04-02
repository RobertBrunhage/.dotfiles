ECHO Symlinking gitconfig
cd %USERPROFILE%
del .gitconfig

mklink .gitconfig %USERPROFILE%\dotfiles\git\.gitconfig

PAUSE
