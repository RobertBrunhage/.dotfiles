echo ------------------------------------
echo Installing Chocolatey...
echo ------------------------------------
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

echo ------------------------------------
echo Installing 7-zip...
echo ------------------------------------
choco install 7zip -y

echo ------------------------------------
echo Installing Google Chrome...
echo ------------------------------------
choco install googlechrome -y

echo ------------------------------------
echo Installing Git...
echo ------------------------------------
choco install git -y

echo ------------------------------------
echo Installing VSCode...
echo ------------------------------------
choco install vscode -y

echo ------------------------------------
echo Installing Discord...
echo ------------------------------------
choco install discord -y

echo ------------------------------------
echo Installing Steam...
echo ------------------------------------
choco install steam-client -y

echo ------------------------------------
echo Installing VLC...
echo ------------------------------------
choco install vlc -y

echo ------------------------------------
echo Installing Flutter...
echo ------------------------------------
choco install flutter -y

echo ------------------------------------
echo Installing Android Studio...
echo ------------------------------------
choco install androidstudio -y

echo ------------------------------------
echo Installing Figma...
echo ------------------------------------
choco install figma -y

echo ------------------------------------
echo Installing Notion...
echo ------------------------------------
choco install notion -y

echo ------------------------------------
echo Installing Obs...
echo ------------------------------------
choco install obs-studio -y

echo ------------------------------------
echo Installing Slack...
echo ------------------------------------
choco install slack -y

echo ------------------------------------
echo Installing Node...
echo ------------------------------------
choco install nodejs -y

echo ------------------------------------
echo Installing Yarn...
echo ------------------------------------
choco install yarn -y

echo ------------------------------------
echo Installing Neovim...
echo ------------------------------------
choco install neovim -y

echo ------------------------------------
echo Installing mingw, ripgrep and fd for neovim...
echo ------------------------------------
choco install mingw -y
choco install ripgrep -y
choco install fd -y


echo ------------------------------------
echo Installing tsserver and prettier...
echo ------------------------------------
npm install -g prettier
npm install -g typescript typescript-language-server

PAUSE
