#!/bin/bash

# check input
if [[ $# -eq 0 ]] ; then
    echo 'No argument given. Execute script with environment: dev, staging, prod'
    exit 1
fi

if [[ "$1" =~ ^(dev|staging|prod)$ ]]; then
    echo ">>> Deploying: $1"
else
    echo "Wrong environment given! Environment needs to be dev, staging or prod"
	exit 1
fi

# push changes
echo ">>> Pushing dev to GitHub"
git push origin $1

# Log in to DIY-ML-P
echo ">>> Log into DIY-ML-P"
ssh pi@diy-ml-p.local << EOF

# Pull dev branch from remote into dev folder
echo ">>> Create temp folder"
cd ~/
mkdir tmp_deploy_feature_store
cd tmp_deploy_feature_store

echo ">>> Cloning current $1 branch"
git clone --branch $1 https://github.com/bhundt/diy-ml-p-feature-store.git
cd diy-ml-p-feature-store

# clear working folder
echo ">>> Removing current deployment"
rm -r ~/app/$1/feature-store/*

# copy to working folder
echo ">>> Dopying new files"
cp -a src/. ~/app/$1/feature-store/

# feast apply
echo ">>> Applying changes"
cd ~/app/$1/feature-store/
feast apply

echo ">>> Removing temp files"
rm -rf ~/tmp_deploy_feature_store/
exit
EOF

echo ">>> ...Done!"