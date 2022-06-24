#!/bin/bash

echo "Enter profile name to clone:"
read USER
if [[ $USER != " " ]]
then
mkdir repo_$USER

cd repo_$USER


list_repos=$(curl -s https://api.github.com/users/$USER/repos | awk '/ssh_url/{print $2}' | sed 's/^"//g' | sed 's/",$//g')

for repo in $list_repos
do
        git clone $repo
done
fi





