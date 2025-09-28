# EXAMTOPICSCRAPER
The reason I was doing this is because I don't want to pay the expensive fee to see the certification dumps lol. 

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

# Features to add
- Rescrape pages that result in dirty data, need to update / merge existing data.

# List of bugs to fix
- Answer cannot be scraped:
https://www.examtopics.com/discussions/oracle/view/92435-exam-1z0-071-topic-1-question-24-discussion/
^
The answers was already scraped, but it is contained within questions

- Need to handle 
- https://img.examtopics.com/1z0-071/image98.png
- https://www.examtopics.com/assets/media/exam-media/04351/0002400002.jpg

# Launch browser that google does not capcha
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --remote-debugging-port=9222 \
  --user-data-dir=/tmp/chrome-profile

# How to remove popup block
Apparently if you edit class="popup-overlay show" to "popup-overla show",
the popup will break


# Question with Screenshot (Unsure how to deal with images in question)
/html/body/div[2]/div/div[4]/div/div[1]/div[2]/p

# Screenshot
/html/body/div[2]/div/div[4]/div/div[1]/div[2]/p/img

# Question Screenshot full link
https://www.examtopics.com/assets/media/exam-media/04351/0000200001.png

# Answers
/html/body/div[2]/div/div[4]/div/div[1]/div[2]/div[2]/ul/li[1]/text()

/html/body/div[2]/div/div[4]/div/div[1]/div[2]/div[2]/ul/li[2]/text()

/html/body/div[2]/div/div[4]/div/div[1]/div[2]/div[2]/ul/li[3]/text()

/html/body/div[2]/div/div[4]/div/div[1]/div[2]/div[2]/ul/li[4]/text()

/html/body/div[2]/div/div[4]/div/div[1]/div[2]/div[2]/ul/li[5]/text()


# Discussion texts
/html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2]/div[2]

/html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[2]/div/div[2]/div[2]

# Discussion upvotes
/html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2]/div[3]/span[2]/span

/html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[2]/div/div[2]/div[3]/span[2]/span