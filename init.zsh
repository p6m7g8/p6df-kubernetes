######################################################################
#<
#
# Function: p6df::modules::kubernetes::version()
#
#>
######################################################################
p6df::modules::kubernetes::version() { echo "0.0.1" }

######################################################################
#<
#
# Function: p6df::modules::kubernetes::deps()
#
#>
######################################################################
p6df::modules::kubernetes::deps() {
    ModuleDeps=(
      robbyrussell/oh-my-zsh:plugins/kubectl
    )
}

######################################################################
#<
#
# Function: p6df::modules::kubernetes::external::brew()
#
#>
######################################################################
p6df::modules::kubernetes::external::brew() {

  brew tap weaveworks/tap
  brew install weaveworks/tap/eksctl

  brew install kubeaudit
  brew install kubebuilder
  brew install kubecfg
  brew install kubectx
  brew install kubeless
  brew install kubeprod
  brew install kubernetes-service-catalog-client
  brew install kubeseal
  brew install kubespy
  brew install minikube

  brew cask install kube-cluster
  brew cask install kube-forwarder
  brew cask install kubecontext
  brew cask install kubernetic
}

######################################################################
#<
#
# Function: p6df::modules::kubernetes::home::symlink()
#
#>
######################################################################
p6df::modules::kubernetes::home::symlink() { }

######################################################################
#<
#
# Function: p6df::modules::kubernetes::init()
#
#>
######################################################################
p6df::modules::kubernetes::init() {

  true
}

######################################################################
#<
#
# Function: p6df::prompt::kubernetes::line()
#
#>
######################################################################
p6df::prompt::kubernetes::line() {

  true

#  p6_kubernetes_prompt_info
}

######################################################################
#<
#
# Function: p6_kubernetes_prompt_info()
#
#  Returns:
#	str - str
#
#>
######################################################################
p6_kubernetes_prompt_info() {

    local str

    str="kube:   ${KUBE_PS1_CONTEXT}:${KUBE_PS1_NAMESPACE}"

    if p6_string_blank "$str"; then
      p6_return_void
    else
      p6_return_str "$str"
    fi
}

######################################################################
#<
#
# Function: p6_kubernetes_minikube_docker()
#
#>
######################################################################
p6_kubernetes_minikube_docker() {

  eval $(minikube -p minikube docker-env)
}


######################################################################
#<
#
# Function: p6_kubernetes_deployments()
#
#>
######################################################################
p6_kubernetes_deployments() {

  kubectl get deployment -A
}

######################################################################
#<
#
# Function: p6_kubernetes_coredns_status()
#
#>
######################################################################
p6_kubernetes_coredns_status() {

  kubectl get deployment coredns -n kube-system
}

######################################################################
#<
#
# Function: p6_kubernetes_metrics_server_deploy()
#
#>
######################################################################
p6_kubernetes_metrics_server_deploy() {

  kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.7/components.yaml
}

######################################################################
#<
#
# Function: p6_kubernetess_metrics_server_status()
#
#>
######################################################################
p6_kubernetess_metrics_server_status() {

  kubectl get deployment metrics-server -n kube-system
}

######################################################################
#<
#
# Function: p6_kubernetes_dashboard_server_deploy()
#
#>
######################################################################
p6_kubernetes_dashboard_server_deploy() {

  kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.3/aio/deploy/recommended.yaml
  kubectl apply -f conf/default/eks-admin-service-account.yaml
}

######################################################################
#<
#
# Function: p6_kubernetes_dashboard_server_token_get()
#
#>
######################################################################
p6_kubernetes_dashboard_server_token_get() {

  local secret
  secret=$(kubectl -n kube-system get secret | grep eks-admin | awk '{ print $1 }')

  kubectl -n kube-system describe secret "$secret" | awk '/^token/ { print $2 }'
}

######################################################################
#<
#
# Function: p6_kubernetes_metrics_raw_get()
#
#>
######################################################################
p6_kubernetes_metrics_raw_get() {

  kubectl get --raw /metrics
}

######################################################################
#<
#
# Function: p6_kubernetes_pods_status()
#
#>
######################################################################
p6_kubernetes_pods_status() {

  kubectl get pods -A
}

######################################################################
#<
#
# Function: p6_kubernetes_svc_get()
#
#>
######################################################################
p6_kubernetes_svc_get() {

  kubectl get svc
}

######################################################################
#<
#
# Function: p6_kubernetes_prometheus_deploy()
#
#>
######################################################################
p6_kubernetes_prometheus_deploy() {

  kubectl create namespace prometheus
  helm install prometheus stable/prometheus \
    --namespace prometheus \
    --set alertmanager.persistentVolume.storageClass="gp2",server.persistentVolume.storageClass="gp2"
}

######################################################################
#<
#
# Function: p6_kubernetes_prometheus_pods_status()
#
#>
######################################################################
p6_kubernetes_prometheus_pods_status() {

  kubectl get pods -n prometheus
}

#export POD_NAME=$(kubectl get pods --namespace prometheus -l "app=prometheus,component=server" -o jsonpath="{.items[0].metadata.name}")
#kubectl --namespace prometheus port-forward $POD_NAME 9090
######################################################################
#<
#
# Function: p6_kubernetes_prometheus_console_forward()
#
#>
######################################################################
p6_kubernetes_prometheus_console_forward() {

  kubectl --namespace=prometheus port-forward deploy/prometheus-server 9090
}

#export POD_NAME=$(kubectl get pods --namespace prometheus -l "app=prometheus,component=alertmanager" -o jsonpath="{.items[0].metadata.name}")
#kubectl --namespace prometheus port-forward $POD_NAME 9093

#export POD_NAME=$(kubectl get pods --namespace prometheus -l "app=prometheus,component=pushgateway" -o jsonpath="{.items[0].metadata.name}")
#kubectl --namespace prometheus port-forward $POD_NAME 9091

######################################################################
#<
#
# Function: p6_kubernetes_aws_iam_oidc_create([cluster_name=$KUBE_CLUSTER_NAME])
#
#  Args:
#	OPTIONAL cluster_name -  [$KUBE_CLUSTER_NAME]
#
#>
######################################################################
p6_kubernetes_aws_iam_oidc_create() {
  local cluster_name="${1:-$KUBE_CLUSTER_NAME}"

  eksctl utils associate-iam-oidc-provider \
    --cluster Smile-Central \
    --approve
}

######################################################################
#<
#
# Function: p6_kubernetes_svc_account([cluster_name=$KUBE_CLUSTER_NAME])
#
#  Args:
#	OPTIONAL cluster_name -  [$KUBE_CLUSTER_NAME]
#
#>
######################################################################
p6_kubernetes_svc_account() {
  local cluster_name="${1:-$KUBE_CLUSTER_NAME}"

  eksctl create iamserviceaccount \
    --cluster="$cluster_name" \
    --namespace=kube-system \
    --name=alb-ingress-controller \
    --attach-policy-arn=arn:aws:iam::XXXXXXXXXXX:policy/ALBIngressControllerIAMPolicy \
    --override-existing-serviceaccounts \
    --approve
}

# XXX: crashes
######################################################################
#<
#
# Function: p6_kubernetes_ingress_controller_alb_deploy([cluster_name=$KUBE_CLUSTER_NAME])
#
#  Args:
#	OPTIONAL cluster_name -  [$KUBE_CLUSTER_NAME]
#
#>
######################################################################
p6_kubernetes_ingress_controller_alb_deploy() {
  local cluster_name="${1:-$KUBE_CLUSTER_NAME}"

  p6_kubernetes_aws_iam_oidc_create "$cluster_name"

  kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/rbac-role.yaml

  aws iam create-policy \
    --policy-name ALBIngressControllerIAMPolicy \
    --policy-document https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/iam-policy.json

  p6_kubernetes_svc_account_create "$cluster_name"

  curl -sS "https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.8/docs/examples/alb-ingress-controller.yaml" \
    | sed "s/# - --cluster-name=devCluster/- --cluster-name=$cluster_name/g" \
    | kubectl apply -f -
}

# kubectl get ingress/2048-ingress -n 2048-game
######################################################################
#<
#
# Function: p6_kubernetes_jenkins_deploy()
#
#>
######################################################################
p6_kubernetes_jenkins_deploy() {

  kubectl create namespace jenkins
  helm install cicd stable/jenkins \
    --namespace jenkins \
    --set rbac.create=true,master.servicePort=80,master.serviceType=LoadBalancer
}

######################################################################
#<
#
# Function: p6_kubernetes_jenkins_passwd_get()
#
#>
######################################################################
p6_kubernetes_jenkins_passwd_get() {

  printf $(kubectl get secret --namespace jenkins cicd-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode)
}

######################################################################
#<
#
# Function: p6_kubernetes_jenkins_ip_get()
#
#>
######################################################################
p6_kubernetes_jenkins_ip_get() {

  kubectl get svc --namespace jenkins cicd-jenkins --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}"
}

# kubectl get svc --namespace default -w cicd-jenkins