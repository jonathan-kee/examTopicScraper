# EXAMTOPICSCRAPER
The reason I was doing this is because I don't want to pay the expensive fee to see the certification dumps lol. 

# Project Highlights
[Docker containers in workflow created & removed](./screenshots/serviceContainerInWorkflow.png)

![Docker containers in workflow created & removed](./screenshots/serviceContainerInWorkflow.png)

[Node & NPM in workflow created & removed](./screenshots/node&npmInWorkflow.png)

![Node & NPM in workflow created & removed](./screenshots/node&npmInWorkflow.png)

# Installation Guide
Follow the official github documentation:
- https://docs.github.com/en/actions/how-tos/manage-runners/self-hosted-runners/add-runners#adding-a-self-hosted-runner-to-a-repository

Follow below for personalized installation:
- https://github.com/jonathan-kee/examTopicScraper/settings/actions/runners/new?arch=arm64&os=linux

# Vagrant After Setup & Provisioning 
1) cd linux/selfhost-runner
2) vagrant up --provider vmware_desktop
3) vagrant ssh Server1
4) cd actions-runner
5) ./run.sh

# Run Github Actions
Link to Github Actions workflow:
- https://github.com/jonathan-kee/examTopicScraper/actions/workflows/first-example.yml

- Click Run Workflow

# Vagrant Setup & Provisioning
You need to enable the setting below for vmware to work:
Privacy & Security -> Full Disk Access -> vagrant-vmware-utility

1) cd linux/selfhost-runner
2) vagrant up --provider vmware_desktop
3) vagrant provision (You can skip this step, vagrant up will already provision)
4) vagrant ssh Server1
5) sudo chown -R vagrant:vagrant /home/vagrant/actions-runner
6) cd actions-runner
7) ./config.sh --url https://github.com/<OWNER>/<REPO> --token YOUR_TOKEN_HERE

*** Enter registration process details ***

./run.sh

# My registration process
Runner Registration
Enter the name of the runner group to add this runner to: [press Enter for Default] 

Enter the name of runner: [press Enter for Server1] prod-rocky-runner

This runner will have the following labels: 'self-hosted', 'Linux', 'ARM64' 
Enter any additional labels (ex. label-1,label-2): [press Enter to skip] 

√ Runner successfully added

Runner settings

Enter name of work folder: [press Enter for _work] 

√ Settings Saved.

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

# Project Management Tools
Github's Project Management tool like Trello, Jira:
https://github.com/jonathan-kee/examTopicScraper/projects?query=is%3Aopen

Very useful feature for Github:
https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/linking-a-pull-request-to-an-issue

Scrum with GitHub Projects (Very good introduction to Github Projects):
https://www.youtube.com/watch?v=06AWiNvjlQU&list=PLGxFXI4dC2siB2ENZ6OhagfwSId5FcWmY

Github Workflow for Issues and Pull Requests
https://www.youtube.com/watch?v=d3N2yeAaLkc
^
1) Create Issues 
2) Issue can become a branch or link a pull request to the Issue
3) Issue become a new branch, compare branch to main and create a pull request
4) Creating a pull request will link to the issue
5) Merge Pull request will also close the issue

TLDR: Create Issue -> New Branch from Issue -> Create Pull Request (Compare branch to main) -> Merge Pull Request -> Close Issue

GitHub Foundations Certification Course (Most detailed explanation on Issues & Pull Request)
https://www.youtube.com/watch?v=Jdc0i7RcBv8

Learn about Github Issue before moving into Github projects:
https://docs.github.com/en/issues/tracking-your-work-with-issues/learning-about-issues/quickstart

Github projects training course:
https://learn.microsoft.com/en-us/training/modules/manage-work-github-projects/

Question: So how does Github Issues, Github Projects fit into CI / CD?

*** Project Idea, have text to speech for recordings / meetings, then translate it Github Projects UI ***

# System Packages / Project Setup
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
^
If I am not mistaken, the 12 factor app mentioned about containerize scripts
^
The famous voting app has a image that is not a web server, it's like a script that has loop forevor until it errors

Docker is actually a server, it comes with 
- Docker Daemon (dockerd)
- REST API
- Docker CLI (docker)
^
Based on Kodekloud's Docker-Certified-Associate-Exam-Course, You still need indepth knowledge of Linux

Link to Docker Certified Associate (DCA) Exam:
https://a.storyblok.com/f/146871/x/2001ce939c/docker-study-guide_v1-5-jan-2025.pdf

Mirantis bought over the Docker Certification Exam:
https://training.mirantis.com/certification/dca-certification-exam/

An alternative to Kodekloud's docker courses
https://labs.iximiuz.com/roadmaps/docker

Not sure what is the importance for the process tree looking like that
https://labs.iximiuz.com/challenges/docker-101-container-run-in-background

Download an image without starting a container:
1) docker image pull minio/minio

2) docker image pull postgres:14.21-trixie

3) Build Image for the webscraper

4) Create docker compose file

## Docker Setup QNA
Question: If Postgres has delta table extension, 
will it be able to handle DBA SQL as well?
Answer: 
- Oracle Database 12c DBA Handbook book is around 700 pages,
I will just assume Postgres DBA SQL is that deep as well.

- I have a folder named DBA1-handouts-16-en for Postgres DBA SQL, 
I downloaded from https://edu.postgrespro.com/16/DBA1-handouts-16-en.zip

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
^
This pattern is good, because you don't have to think about transforming the data, you just focus on extracting as much data as possible
^
Good oppurtunity to use pg_lake for Postgres:
https://github.com/Snowflake-Labs/pg_lake

- Convert the project into a CLI

- Add Presentation like Excel or PowerBi if possible

# QNA
Question: Is SSIS still worth learning just to learn more about ETL patterns?

# Projects Ideas
- Connect Touch&Go Ewallet to Bukku Accounting system  

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