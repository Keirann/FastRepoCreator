#!bin/bash
if [ $# != 2 ]
then
    echo 'Expected 2 arguments'
    echo Usage:'sudo bash createRepo.sh gitUserName newGitRepoName'
    exit
fi
response=`curl -u $1 https://api.github.com/user/repos -d "{\"name\":\"$2\"}"`;
echo $response
mkdir $2
cd $2
git init
git remote add origin git@github.com:$1/$2.git
