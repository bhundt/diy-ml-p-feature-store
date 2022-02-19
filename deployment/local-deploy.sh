#!/bin/bash

# settings
DIY_ML_P_ENVIRONMENT=local
DIY_ML_P_REL_DEPLOY_PATH=../../app

# check input
if [[ $# -eq 0 ]] ; then
    echo 'No argument given. Execute script with environment: dev, staging, prod'
    exit 1
fi

if [[ "$1" =~ ^(local)$ ]]; then
    echo ">>> Deploying: $1"
else
    echo "Wrong environment given! Deployment to local on dev only!"
	exit 1
fi

read -p "Script intended to be run from repo main folder and with ../../app/local/ rel. path . Are you sure you want to continue? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "..exiting!"
    exit 1
fi

# clear working folder
rm -r $DIY_ML_P_REL_DEPLOY_PATH/$DIY_ML_P_ENVIRONMENT/feature-store/*

# copy to working folder
cp -a src/. $DIY_ML_P_REL_DEPLOY_PATH/$DIY_ML_P_ENVIRONMENT/feature-store/

# apply changes
cd $DIY_ML_P_REL_DEPLOY_PATH/$DIY_ML_P_ENVIRONMENT/feature-store/
feast apply
