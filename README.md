# EXAMTOPICSCRAPER
The reason I was doing this is because I don't want to pay the expensive fee to see the certification dumps lol. 

# Resources to learn webscraping
1) Website on webscraping & crawling
https://webscraping.fyi/

^
https://webscraping.fyi/overview/browser-automation/

^
I am currently using browser automation instead of http clients

^
https://webscraping.fyi/overview/languages/#http-clients

2) Youtube channels on webscraping & crawling
https://www.youtube.com/@MichaelMintz
https://www.youtube.com/@JohnWatsonRooney/playlists

3) Airflow being used for webscraping
https://www.youtube.com/watch?v=CraPKax37lo

# Resources to learn Data Engineering
1) Official Reddit Date Engineering website
https://dataengineering.wiki/Tools/Tools

2) Kodekloud
https://kodekloud.com/courses/data-engineering-fundamentals

3) Architecture for Data
https://www.youtube.com/watch?v=gsUqW1IookY

4) Workflow Orchestration
- Airflow certification link:
https://academy.astronomer.io/page/astronomer-certification

- Notes on Airflow certification:
https://substack.com/@michaelsalata/p-181463528

5) Data Ingestion
- Dlt Certification links:
https://dlthub.learnworlds.com/course/dlt-fundamentals
https://dlthub.learnworlds.com/course/dlt-advanced

6) Data Processing
- DBT Certification links:
https://learn.getdbt.com/learning-paths/dbt-certified-developer
https://learn.getdbt.com/learning-paths/dbt-certified-cloud-architect

- Apache Spark 

7) Data Analytics
- Excel
- Power BI

# 12 Factor App Methodology
Github Actions solves 
- Codebase
- Build, Release and Run
^
You have to learn Git before Github Actions to make sense
^
Can try below:
https://blinry.itch.io/oh-my-git

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

# Github Actions / Forejo Actions Setup

# Docker Setup
- Minio
- Postgres
^
Both of these need to use volume, otherwise they would data would be lost

I am not entirely sure if I should create an image for the webscraper

# DBT Setup 
1) Install DBT fusion
https://docs.getdbt.com/docs/fusion/install-fusion-cli

2) Install DBT extension by "dbt Labs Inc"
https://docs.getdbt.com/docs/install-dbt-extension

# Features to add
- Rescrape pages that result in dirty data, need to update / merge existing data.
^
Partially added for Answers, never needed for question & discussions

- Error handling for missing src images

- Workflow Orchestration with Airflow

- Column lineage with dbt

- Schema Drift from upstream (The HTML, Javascript from examtopics)

- SQL backup dump on repository, so when switch computer we get the data back

- Maybe instead of scraping the data directly, you take all the data first and dump it into a data lake,
then only process it at some future point
^
Try to use MINIO as a datalake, Hadoop also works

- Convert the project into a CLI

# List of bugs to fix
- Answer cannot be scraped:
https://www.examtopics.com/discussions/oracle/view/92435-exam-1z0-071-topic-1-question-24-discussion/
^
The answers was already scraped, but it is contained within questions

- Need to handle 
- https://img.examtopics.com/1z0-071/image98.png
- https://www.examtopics.com/assets/media/exam-media/04351/0002400002.jpg

- Apparently there was nothing wrong with my scraping code, the image's src just did not appear, meaning the resource did not lead.

- Need to rescrape images from 103, 119, 120, 127, 128, 131, 133, 146, 166, 228, 236, 245, 256

- replace pngMost with png

- if pngMost exist, then replace 'pngMost' with 'png' & replace 'Voted' with ''

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