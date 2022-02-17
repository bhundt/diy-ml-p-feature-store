#!/bin/bash

source config/dev_env.sh

# Copy to working folder
cp feature_store.yaml $DIY_ML_P_REL_DEPLOY_PATH/$DIY_ML_P_ENVIRONMENT/feature-store/feature_store.yaml

cp example.py $DIY_ML_P_REL_DEPLOY_PATH/$DIY_ML_P_ENVIRONMENT/feature-store/example.py

# execute feast apply
cd $DIY_ML_P_REL_DEPLOY_PATH/$DIY_ML_P_ENVIRONMENT/feature-store/
feast apply
