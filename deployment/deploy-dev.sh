#!/bin/bash

# push changes
echo ">>> Pushing dev to GitHub"
git push origin dev

# Log in to DIY-ML-P
echo ">>> Log into DIY-ML-P"
ssh pi@diy-ml-p.local << EOF

# Pull dev branch from remote into dev folder
echo ">>> Create temp folder"
cd ~/
mkdir tmp_deploy_feature_store/
cd tmp_deploy_feature_store

echo ">>> Cloning current dev branch"
git clone --branch dev https://github.com/bhundt/diy-ml-p-feature-store.git
cd diy-ml-p-feature-store

# clear working folder
echo ">>> Removing current deployment"
rm -r ~/diy-ml-p/dev/feature-store/*

# copy to working folder
echo ">>> Dopying new files"
cp -a src/ ~/diy-ml-p/dev/feature-store/

# feast apply
echo ">>> Applying changes"
cd ~/diy-ml-p/dev/feature-store/
feast apply

echo ">>> Removing temp files"
rm -rf ~/tmp_deploy_feature_store/
exit
EOF

echo ">>> ...Done!"