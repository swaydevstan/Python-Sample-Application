#!/bin/

RESOURCE_GROUP_NAME="devops-hardway-azure-stanley"
STORAGE_ACCOUNT_NAME="devopsazurestanley"

#Create resource group
az group create -n $RESOURCE_GROUP_NAME -l eastus

#create storage account
az storage account create -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP_NAME -l eastus --sku Standard_LRS

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

#create blob container
az storage container create  --name tfstate --account-name $STORAGE_ACCOUNT_NAME

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "access_key: $ACCOUNT_KEY"