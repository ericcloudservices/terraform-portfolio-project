# State Locking Static Website Project : An S3 bucket that stores static website files and is distributed by CloudFront.

! Image

## The problem

If you and your team are using Terraform, there is a possibility that members of the team might push changes at the same time, causing the Terraform state file to overwrite one of the team member’s work.
If a Terraform state file becomes out of sync with the infrastructure that is in place, then there is no way of knowing what part of the current infrastructure is associated with the .tf file without manually going through all the resources in the console. For a company with large infrastructure, this can be a nightmare.

## Decisions I made
I was attempting to store the project's state file in an S3 bucket and use DynamoDB for state locking to prevent two people on the project from saving changes to the state at the same time. I had to do some research, and I found that this was the old way of doing things. Newer versions of Terraform can lock the state file using S3 alone. The DynamoDB table is now unnecessary.
I was originally instructed to lock the state file with DynamoDB, but I decided to try it with just the S3 bucket because the project becomes less complex, we won't be charged for DynamoDB usage, and this is probably how we'll be going about locking state files in the future.

## What broke and how I fixed it
Before building the CloudFront/S3 website project, I warmed up with a Terraform project where I built an unrelated test project to get a feel for Terraform.
I tried to initialize the Terraform file I created... 30+ errors!
I made mistakes like inputting region: instead of region =, forgetting closing quotes, writing tages instead of tags, and more.
Some of my CloudFormation coding habits are becoming mistakes in Terraform. I need to train my brain to operate in different IaCs. I eventually got through all the errors, fortunately I only had to make a few changes and the 30+ errors went away.

## Result
The terraform.tfstate file is secured in a private S3 bucket and a next.js static website accessible by a CloudFront url.
￼
￼
