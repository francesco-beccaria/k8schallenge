#!/bin/bash

# register for the preview
az provider register -n Microsoft.ContainerService

# build resource groups and storage
az group create --name Team3 --location "East US
az storage account create --location eastus --name team3 --resource-group Team3 --sku Standard_RAGRS

# get kube up
az aks create --resource-group Team3 --name Team3 --node-count 1 --generate-ssh-keys

# create acr registry
az acr create --resource-group Team3 --name Team3ACR --sku Basic
