## Running Terraform on your workstation: Primary Authentication
If you are using Terraform on your workstation we recommend that you install gcloud and authenticate using User Application Default Credentials ("ADCs") as a primary authentication method. 

Download https://cloud.google.com/sdk/docs/install?hl=pt-br

You can enable ADCs by running the command: 
`gcloud init`
`gcloud auth application-default login`


## Active API Cloud Storage:
`gcloud services enable storage.googleapis.com`

