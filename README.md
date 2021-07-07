# HeLx

HeLx puts the most advanced analytical scientific models at investigator's finger tips using equally advanced cloud native, container orchestrated, distributed computing systems. HeLx can be applied in many domains. Its ability to empower researchers to leverage advanced analytical tools without installation or other infrastructure concerns has broad reaching benefits.

Contact [HeLx Help](mailto:catalyst-admin@lists.renci.org) with questions.

# Installing HeLx to a Kubernetes Cluster

These instructions aim at offering way to deploy, run and maintain a HeLx installation on any kind of Kubernetes-based cloud infrastructure.

You can use this on your laptop, in your on-prem datacenter or public cloud. With the power of Kubernetes, many scenarios are possible.

To install HeLx you will need access to a Kubernetes cluster.  This includes having kubectl installed and a kubeconfig with enough privileges to create resources in a namespace.  In our examples below we use "helx" as the namespace, so that will need to exist in your cluster.

## General Prerequisites

### Tools
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [helm version 3](https://helm.sh/docs/intro/install/)
- [git](https://git-scm.com/)

## Basic Install Commands
```
# add the helxplatform Helm repository
helm repo add helxplatform https://helxplatform.github.io/devops/charts
# to pull down latest chart updates
helm repo update
# install HeLx
helm install helx helxplatform/helx
```

For more detailed information on the charts see the [documentation](helx).
For information on using the helx-monitoring chart see it's [documentation](helx/charts/helx-monitoring).

## HeLx Deployment to GKE Cluster Using Centos 8

### Tools Setup for Centos 8

```
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

sudo yum -y install google-cloud-sdk
gcloud init
```
After the "gcloud init" command you will need to allow the Google SDK to access to your account and set the default project.

Check your Google Cloud Cloud SDK is setup correctly.

```
glcoud info
```

Install necessary packages for running cluster creation script.
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [helm](https://helm.sh/docs/intro/install/)

```
sudo bash -c "cat > /etc/yum.repos.d/kubernetes.repo" <<EOF
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
sudo yum install -y kubectl git

# install helm3
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

### Cluster Environment Variables and Creation of Cluster in GKE
Create a text file named "env-vars-helx.sh" in the HeLx Platform directory. You may also create this file elsewhere and point to it with the CLUSTER_CONFIG variable below. It should contain the following variables that are used in the creation of the Kubernetes cluster.  Edit the variables as needed. At the very least you will need to update the PROJECT_ID.  Values with "< text >" need to be replaced with values for your environment.

```
export PROJECT="< Google project Id >" # Set this to your Google project ID.
export AVAILABILITY_ZONE=us-east1-b
export HELXPLATFORM_HOME=$HOME/src/helxplatform
export CLUSTER_NAME="$USER-cluster"
export CLUSTER_VERSION="1.18.15-gke.1501" # Check what GKE supports.
```

After the variables file is changed open a terminal and change your current directory to where it is located.  Run the following commands to create the cluster.

```
export HELXPLATFORM_HOME=$HOME/src/helxplatform
export CLUSTER_CONFIG=$HELXPLATFORM_HOME/env-vars-helx.sh

# Create directory to hold the source repositories.
mkdir -p $HELXPLATFORM_HOME
cd $HELXPLATFORM_HOME
git clone https://github.com/helxplatform/devops.git
cd $HELXPLATFORM_HOME/devops/bin
./gke-cluster.sh -c $CLUSTER_CONFIG deploy cluster
```

### Commands to Delete Cluster

```
$HELXPLATFORM_HOME/devops/bin/gke-cluster.sh -c $CLUSTER_CONFIG delete cluster
```

# Minimal Deployment to GKE Cluster Using HeLx Parent Helm Chart
Follow instructions in the "Tools Setup for Centos 8" and "Create Cluster in GKE Using Script" sections above.
```
# add the helxplatform Helm repository
helm repo add helxplatform https://helxplatform.github.io/devops/charts
# to pull down latest chart updates
helm repo update
# install HeLx
helm install helx helxplatform/helx
```
It will take a few minutes for HeLx to deploy.  Follow the instructions in the output of the Helm command to log in as the Django admin.  Once logged in as the Django admin you can go to the HeLx URL and navigate to the apps section to create new apps.

To delete HeLx run this command.
```
helm delete helx
```
***NOTE***
You will need to delete any apps created with HeLx using the web UI or manually with kubectl commands.

# Minimal Deployment to Blackbalsam Kubernetes cluster using HeLx Parent Helm Chart in development mode
### Connecting to a cluster
```
Copy the kubeconfig generated by admin to ~/.kube/config
```
### A basic-values.py file for the HeLx chart

- Appstore/Nginx/Ambassador
```

# Override the default appstore values in the Appstore chart.
appstore:
  image:
    # Docker registry.
    respository:
    # Uncomment this to specify a tag, defaults to latest.
    # tag:
  userStorage:
    # Apps launched via Appstore need default volumes. When set to true, creates a stdnfs PVC.
    createPVC: true
  django:
    # Add authorized user email, this will get past the whitelisting step.
    AUTHORIZED_USERS: ""
    # Optional, for whitelisting.
    EMAIL_HOST_USER: ""
    # Optional, for whitelisting.
    EMAIL_HOST_PASSWORD: ""
    # Optional, OAuth Web App credentials.
    oauth:
      OAUTH_PROVIDERS: ""
      GOOGLE_NAME: ""
      GOOGLE_CLIENT_ID: ""
      GOOGLE_SECRET: ""
  ACCOUNT_DEFAULT_HTTP_PROTOCOL: https

  # Choosing a project ( cat | braini | scidas | reccap )
  djangoSettings: cat

# Override the default values in the NFS server chart.
nfs-server:
  enabled: false

# Override the default values in the Nginx chart.
nginx:
  service:
    # Internal static IP for the Nginx service already assigned by admin.
    IP:
    # Domain name already assigned by admin.
    serverName:
  # SSL certs already installed by admin in your namespace.
  SSL:
    nginxTLSSecret:

```
- Ambassador/Nginx in dev mode
```
    # Override the default values in the Nginx chart.
    nginx:
      DEV_PHASE:
        dev: True
    service:
      # Internal static IP for the Nginx service already assigned by admin.
      IP:
      # Domain name already assigned by admin.
      serverName:

   ```

### Installing the chart.
The parent Helm chart values gives the ability to enable/disable certain microservices/apps to be installed.
Using $HELXPLATFORM_HOME/devops/helx/values.yaml, enable Appstore/Nginx/Ambassador.

NOTE: Enable Ambassador/Nginx in development mode, if Appstore is running on localhost:port.
```
helm install release-name $HELXPLATFORM_HOME/devops/helx --values basic-values.yaml --namespace your-k8s-namespace
```

### TLS/SSL

The helm charts will not create the TLS secrets for nginx (`nginxTLSSecret`), meaning the nginx pod will crashloop until that secret is created. You will either need to create a self-signed certificate, or have an administrator create one for you. To create the secret from an existing certificate:

```
kubectl create secret tls -n <your-namespace> <your-namespace>.blackbalsam-cluster.edc.renci.org-tls-secret --cert=tls.crt --key=tls.key
```

### Deleting the chart.
```
helm delete release-name --namespace your-k8s-namespace
```
