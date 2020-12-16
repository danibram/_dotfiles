#!/usr/bin/env zsh

curl -o gcloud.tar.gz 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-317.0.0-darwin-x86_64.tar.gz'

tar -zxvf gcloud.tar.gz

cp -R google-cloud-sdk $HOME/.gcloud

rm -rf google-cloud-sdk

rm gcloud.tar.gz

echo "Done!"