# Setting Up GitHub Codespace

This guide will help you set up a GitHub Codespace for this repository to enable to provision AWS infrastructure using Terraform in your browser.

## Prerequisites

- A GitHub Codespace enabled on your account
- AWS credentials with permissions to provision infrastructure

> Please note that you will be charged for any AWS resources you provision. Please make sure to clean up any resources you provision to avoid unnecessary charges and delete credentials from AWS IAM when you are done.

## Setting up the Codespace secrets

After you have AWS credentials, you need to add them to the Codespace as secrets. To do this, follow these steps:

1. Open your fork of this repository
2. Click on the `Settings` tab
3. Click on `Secrets and variables` in the left navigation
4. Click on `Codespaces` in the left navigation
5. From here, you can add your AWS credentials as secrets to the Codespace, if you already have some secrets, you can click on `New repository secret` to add a new one, otherwise, it'll display input fields for you to add your very first secret, you need to add the following secrets keys:

   - `AWS_ACCESS_KEY_ID`: The AWS access key ID
   - `AWS_DEFAULT_REGION`: The AWS region you want to provision resources in (e.g. `us-east-1`)
   - `AWS_SECRET_ACCESS_KEY`: The AWS secret access key

6. Click on `Add secret` to add the secret to the Codespace

## Launch the Codespace

Now that you have the secrets set up, you can launch the Codespace. To do this, follow these steps:

1. Open your fork of this repository
2. Click on the `Code` tab
3. Click on the `Open with Codespaces` button
4. Click on `New codespace` in the dropdown
5. Wait for the Codespace to be provisioned

> If you want to customize the Codespace configuration, head over to the `devcontainer.json` file and change the configuration as you see fit.

## Post-launch steps

After the Codespace is provisioned, it will automatically open a terminal window to run the `post-install.sh` script. This script will install the necessary tools to provision AWS infrastructure using Terraform. Please monitor the script output to make sure it runs successfully.

> If you want to run the script again, you can run `./post-install.sh` in the terminal window and write your own script to install the tools you need.
