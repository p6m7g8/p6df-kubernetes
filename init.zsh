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

  p6_kubernetes_prompt_info
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

    local ctx
    local ns

    if ! p6_file_exists "$HOME/.kube/config"; then
      p6_return_void
    else
      ctx=$(kubectx -c)
      ns=$(kubens -c)

      local str
      str="kube:   ${ctx}:${ns}"

      if p6_string_blank "$str"; then
        p6_return_void
      else
        p6_return_str "$str"
      fi
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

# p6aws/lib/svc/eks
######################################################################
#<
#
# Function: p6_kubernetes_aws_cluster_logging_enable([cluster_name=$KUBE_CLUSTER_NAME])
#
#  Args:
#	OPTIONAL cluster_name -  [$KUBE_CLUSTER_NAME]
#
#>
######################################################################
p6_kubernetes_aws_cluster_logging_enable() {
  local cluster_name="${1:-$KUBE_CLUSTER_NAME}"

  aws eks update-cluster-config \
    --name "$cluster_name" \
    --logging '{"clusterLogging":[{"types":["api","audit","authenticator","controllerManager","scheduler"],"enabled":true}]}'
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

  kubectl -n kube-system get --raw /metrics
}

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
    --cluster $cluster_name \
    --approve
}
