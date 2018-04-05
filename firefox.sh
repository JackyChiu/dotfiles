#/bin/bash

mkdir -p ~/Library/Application\ Support/Firefox/Profiles/gxcsf7j2.default/chrome
rm ~/Library/Application\ Support/Firefox/Profiles/gxcsf7j2.default/chrome/userChrome.css

ln -s $(pwd)/userChrome.css ~/Library/Application\ Support/Firefox/Profiles/gxcsf7j2.default/chrome/userChrome.css

