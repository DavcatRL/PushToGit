# PushToGit
This repository contains Bash scripts to automate the process of pushing local files or folders to a GitHub repository.

Before using the scripts in this repository, you have to make them executable. To do it, open a terminal in the cloned directory and run:
``` bash
chmod +x push_homework.sh
```
In addition, make sure your Git identity is configured. To do that globally, so that you no longer have to do it, the commands are:
``` bash
git config --global user.name "your_username"
git config --global user.email "your_email@example.com"
```

Now you're ready to use the scripts.
First, move the files/directories you want to push to GitHub into the cloned push_dir directory. Then, open here a terminal and execute:
``` bash
./push_github.sh GitHub_username repo_name "commit_message" files/directories to push...
```
The script also cleans your directory from previous pushes, so you don't have to worry about it.
For the last push instruction you will need to enter your GitHub credentials. Use your token as password, otherwise the push command will fail.
