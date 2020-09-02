#!/bin/bash
#set -x
path="`pwd`"
replace="cicd/$PRODUCT"
PATH_ENV="${path/bin/$replace}"
source $PATH_ENV/env.sh
source $JENKINS_HOME/deployment-secrets/$PRODUCT/$DEV-secrets.sh

export PROJECT="DISABLED"
export CLUSTER_NAME="blackbalsam"
export NAMESPACE="braini-dev"

#export APPSTORE_IMAGE="heliumdatastage/appstore:mastercca-v0.0.13"
#export TYCHO_API_IMAGE="heliumdatastage/tycho-api:mastercca-v0.0.5"
export APPSTORE_IMAGE="heliumdatastage/appstore:$BRANCH_NAME-$APPSTORE_VERSION"
export TYCHO_API_IMAGE="heliumdatastage/tycho-api:$BRANCH_NAME-$TYCHO_VERSION"
export NGINX_IMAGE="heliumdatastage/nginx:cca-v0.0.5"