#!/bin/bash
echo "########### Creating profile ###########"
aws configure set aws_access_key_id AKIAZBB5EHJKXHVTO6AE --profile=Ajibowu
aws configure set aws_secret_access_key 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 --profile=Ajibowu
aws configure set region us-east-1 --profile=Ajibowu 

echo "########### Setting default profile ###########"
export AWS_PROFILE=Ajibowu 

echo "########### Listing profile ###########"
aws configure list