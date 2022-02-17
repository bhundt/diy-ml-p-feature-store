#!/bin/bash

source config/dev_env.sh

# clear working folder
rm -r $DIY_ML_P_REL_DEPLOY_PATH/$DIY_ML_P_ENVIRONMENT/feature-store/*

# copy to working folder
cp -a src/. $DIY_ML_P_REL_DEPLOY_PATH/$DIY_ML_P_ENVIRONMENT/feature-store/

# apply changes
cd $DIY_ML_P_REL_DEPLOY_PATH/$DIY_ML_P_ENVIRONMENT/feature-store/
feast apply
