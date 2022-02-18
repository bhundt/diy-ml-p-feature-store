# Fature-Store component for DIY-ML-P

This is the feature store component for my DIY machine learning plattform (TODO put link to general description of DIY-ML-P). It is based around [Feast](https://feast.dev/).

## Repository Overview
- `config/`: settings used by deployment scripts.
- `deployment/`: scripts for local and remote deployment.
- `src/`: files which describe the feature store infrastructure and corresponding feature descriptions. The content of this folder is deployed to DIY-ML-P server.

## Deployment
We assume DIY-ML-P is accessible in the network under `diy-ml-p.local` and allows SSH accesss. The assumed folder structure is created using [bhundt/diy-ml-p-infrastructure: Infrastructure repository for DIY-ML-P](https://github.com/bhundt/diy-ml-p-infrastructure) under `~/app/`. 