# LBG Pega PoC: Terraform Repository
## Author: David Sanders <david@kubology.uk>
This repository contains all the necessary TF assets for building the PoC1 environment.

- `targetEnvType`: string [ production | test ] (unused)
- `resourceGroup`: string [ name of a new Azure resource group ]
- `vnetCidr` : string [ IPv4 CIDR for the Azure VNet ]
- `azureRegion` : string [ Azure Region for project ]


See `./variables.tf` for more details.

If you're new to Terraform, then please read the [Introduction and Getting Started guides](https://www.terraform.io/intro/index.html).

# Prerequisites

* If you intend to use the cli, ensure that you have __git__ [installed](https://git-scm.com/download/win), otherwise ensure you have Visual Studio or Visual Studio Code installed.
* Ensure you have __Terraform__ [installed](https://www.terraform.io/downloads.html)
* Ensure you have the __Azure CLI__ [installed](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)


# Using Azure DevOps

To check-out the code:

1. From within Azure DevOps, on the __Pega-PoC__ project page, choose __Repos__ from the left-hand menu.
2. Click on __files__ 
3. Click on __clone__ on the right-hand top icon bar
4. Click __Clone In__ and choose your code editor from the list
6. Your editor will open, and automatically clone the repository

You now have a local working copy of the Terraform templates.

# Using Git

If you are using Visual Studio, or Visual Studio Code, Git functionality is available within the editor for cloning , adding, committing and push/pull to the remote. This section will cover use of the command-line __git__ tool, and cover general principles.

## Cloning The Repository

Dependent on your Azure DevOps credentials, you can clone the repository via __ssh__ or __https__. For the below example we will use __ssh__.

Git will pull the code from the remote repository, and produce output similar to the below:

<code>
Cloning into 'pegapoc'...

remote: Azure Repos

remote: Found 62 objects to send. (64 ms)

Receiving objects: 100% (62/62), 11.38 KiB | 647.00 KiB/s, done.
Resolving deltas: 100% (27/27), done.
</code>


You will now have a local copy in the current directory.

## Git Repo operations

Once you have made any necessary modifications to templates within the repository, there are some stages to follow before invoking Terraform.

1. Add any modified files to the commit:

   * `git add FILENAMES`
2. Commit the files to your local repository:

   * `git commit`
3. Push your changes to the remote:

   * `git push`

3. Ensure you've pulled all changes from the repository before continuing:

   * `git pull`

If the pull produces any merge conflicts, ensure you resolve them as directed, and then return to step 1 of the above.

# Using Terraform

Now that you have a working local repository, and have ensured that it is up to date, you can begin planning your Terraform deployment.

1. You will need to login to your Azure Subscription at a Powershell CLI by typing:

    * `az login`
2. Powershell will open your default browser and ask you to login to the required Azure subscription
3. You are now logged in, so ensure the output from `az login` matches your expected account details - not doing so can be __extremely dangerous and/or costly__
4. You can run Terraform in planning mode, by typing: 
    * `terraform.exe plan`
5. Terraform will output a list of any errors, changes and additions required for the infrastructure. Read this thoroughly and ensure the output matches your expectations. If any changes need to be made, please refer back to the __Using Git__ section above, and ensure the full workflow is followed.
6. When you are satisfied that the `terraform.exe plan` output resembles your expectations, you are ready to apply the plan with:
    * `terraform.exe apply`
7. Again, Terraform will run through a planning stage, and then ask you to verify that you are happy to apply the changes. Only by typing in fully the word __yes__ will Terraform proceed.
8. You may now experience additional errors, as Terraform has only now begun to utilise the Azure API to apply the changes -so any non-syntax related errors (such as Azure Resource naming errors, Resource Limit errors etc) will now become visible. Again, you may need to return to the git workflow to resolve these before proceeding.
9. If no errors are raised, the modifications to the environment will be made, and an output report produced detailing any changes. 