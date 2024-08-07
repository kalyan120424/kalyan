#!/bin/bash

# Variables
RESOURCE_GROUP_NAME=your_resource_group_name
STORAGE_ACCOUNT_NAME=your_storage_account_name
CONTAINER_NAME=static-content
ICON_NAME=greeting-icon.png

# Upload the greeting icon to Azure Blob Storage
az storage blob upload \
    --account-name $STORAGE_ACCOUNT_NAME \
    --container-name $CONTAINER_NAME \
    --name $ICON_NAME \
    --file greeting-icon.png

# Deploy the web application
zip -r webapp.zip .
az webapp deployment source config-zip \
    --resource-group $RESOURCE_GROUP_NAME \
    --name hello-world-app \
    --src webapp.zip
