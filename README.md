# EXAMTOPICSCRAPER
An easy starting point would be start reverse engineering websites, like the project right now I am working on is an examdump web scraper. The reason I was doing this is because I don't want to pay the expensive fee to see the certification dumps lol. 

# Project Setup
1) Install node version manager:
- curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

^^^^^^
The following wont work if ~/.profile exist, Then you need to manually add to .bashrc by doing the following:
- echo 'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.bashrc

2) Make .bashrc take effect immediately by sourcing:
- source ~/.bashrc

3) Install Node 20:
- nvm install 20

4) Verify node:
- node -v

5) Install Typescript:
- npm install -g typescript

6) Install Dependencies:
- npm install

7) Compile Typescript and launch with node with sample arguments:
- tsc && node ./build/index.js