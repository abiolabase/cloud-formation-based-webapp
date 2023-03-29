# Project Title - Highly Available Cloud-Formation-Based-Webapp

> This project is one of the project carried out during my Udacity Cloud Developer Nanodegree program. "ND9991 - C2- Infrastructure as Code - Deploy a high-availability web app using CloudFormation" project.Deploy a high-availability web app using CloudFormation
As your final project, you'll be faced with a real scenario.

> There will be two parts to this project:

- Diagram: This is the diagram showing the implementation of the cloud formation cloud template. 

-  Script (Template and Parameters): The second part is to interpret the instructions and create a matching CloudFormation script


## Project Scenario
> Your company is creating an Instagram clone called Udagram. Developers want to deploy a new application to the AWS infrastructure. You have been tasked with provisioning the required infrastructure and deploying a dummy application, along with the necessary supporting software. This needs to be automated so that the infrastructure can be discarded as soon as the testing team finishes their tests and gathers their results

> A sample website files located in a public S3 Bucket was deployed to the Apache Web Server running on an EC2 instance. 

## This folder contains the following files:

### compute.yml

> This contains the CloudFormation YAML code for the webapp cloud infrastructure, as required for the project.

### compute-parameters.json

> This contains the parameters used for the webapp.

### network.yml

> This contains the CloudFormation YAML code for the webapp network, as required for the project.

### network-parameters.json

> This contains the parameters used for the webapp network.

## Command to Run Project

> **__./create.sh network network.yml network-parameters.json__**

> **__./create.sh server compute.yml compute-parameters.json__**

## Overview

## What Is High Availability?
> Highly available systems are reliable in the sense that they continue operating even when critical components fail. They are also resilient, meaning that they are able to simply handle failure without service disruption or data loss, and seamlessly recover from such failure.

### Highly Available Compute on AWS
> Amazon EC2 and other services that let you provision computing resources, provide high availability features such as load balancing, auto-scaling and provisioning across Amazon Availability Zones (AZ), representing isolated parts of an Amazon data center

> If you are running instances on Amazon EC2, Amazon provides several built-in capabilities to achieve high availability:

- Elastic Load Balancing - you can launch several EC2 instances and distribute traffic between them

- Availability Zones - you can place instances in different AZs

- Auto Scaling - use auto-scaling to detect when loads increase, and then dynamically add more instances

> These capabilities are illustrated in the diagram below. The Elastic Load Balancer distributes traffic between two or more EC2 instances, each of which can potentially be deployed in a separate subnet that resides in a separate Amazon Availability Zone. These instances can be part of an Auto-Scaling Group, with additional instances launched on demand

### Networking needs for HA Compute
> Our Compute power (EC2 Auto scaling instances and Load Balancer) will require a network that spans multiple AZs

> At least one private subnet and one public subnet for two (or more) availability zones


## Requirements
### Server specs
- You'll need to create a Launch Configuration for your application servers in order to deploy four servers, two located in each of your private subnets. The launch configuration will be used by an auto-scaling group

- You'll need two vCPUs and at least 4 GB of RAM. The Operating System to be used is Ubuntu. So, choose an Instance size and Machine Image (AMI) that best fits this spec

- Be sure to allocate at least 10 GB of disk space so that you don't run into issues

## Routing and Security Groups
### Web Servers
> Inbound

- Udagram communicates on the default HTTP Port: 80, so your servers will need this inbound port open since you will use it with the Load Balancer and the Load Balancer Health Check

> Outbound

- The servers will need unrestricted internet access to be able to download and update their software

### Load balancer
> Inbound

- The load balancer should allow all public traffic (0.0.0.0/0) on port 80 inbound, which is the default HTTP port. Outbound, it will only be using port 80 to reach the internal servers

> Outbound

- The application needs to be deployed into private subnets with a Load Balancer located in a public subnet

## IAM Access and Roles
- Since you will be downloading the application archive from an S3 Bucket, you'll need to create an IAM Role that allows your instances to use the S3 Service

### Extra
- One of the output exports of the CloudFormation script should be the public URL of the Load Balancer. Bonus points if you add http:// in front of the load balancer DNS Name in the output, for convenience

### Prerequisites
- An S3 Bucket hosted on the account

- A simple index.html file uploaded to the bucket, you can find a sample in the assets` folder
