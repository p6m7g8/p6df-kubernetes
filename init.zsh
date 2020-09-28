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
      ohmyzsh/ohmyzsh:plugins/kubectl
      p6m7g8/p6kubernetes
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

  brew install buildkit

  brew install kind

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

  brew install openshift-cli
  
  brew install docker-machine-driver-xhyve
  sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
  sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
  brew cask install minishift
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
# Function: p6df::modules::kubernetes::on()
#
#>
######################################################################
p6df::modules::kubernetes::on() {

  KUBECONFIG=$HOME/.kube/config
  p6_env_export "KUBECONFIG" "$KUBECONFIG"
}

######################################################################
#<
#
# Function: p6df::modules::kubernetes::off()
#
#>
######################################################################
p6df::modules::kubernetes::off() {

  p6_env_unexport "KUBECONFIG"
  p6_env_unexport "P6_KUBE_CFG"
  p6_env_unexport "P6_KUBE_NS"
}

######################################################################
#<
#
# Function: p6df::modules::kubernetes::ctx(ctx)
#
#  Args:
#	ctx - 
#
#>
######################################################################
p6df::modules::kubernetes::ctx() {
  local ctx="$1"

  kubectx "$ctx"

  p6_env_export "P6_KUBE_CFG" "$ctx"

  p6df::modules::kubernetes::on
}

######################################################################
#<
#
# Function: p6df::modules::kubernetes::ns(ns)
#
#  Args:
#	ns - 
#
#>
######################################################################
p6df::modules::kubernetes::ns() {
  local ns="$1"

  kubens "$ns"

  p6_env_export "P6_KUBE_NS" "$ns"
}

######################################################################
#<
#
# Function: p6df::modules::kubernetes::minikube()
#
#>
######################################################################
p6df::modules::kubernetes::minikube() {

  eval $(minikube -p minikube docker-env)
  p6df::modules::kubernetes::ctx "$MINIKUBE_ACTIVE_DOCKERD"
  p6df::modules::kubernetes::ns "default"
}

######################################################################
#<
#
# Function: p6df::modules::kubernetes::minikube::start()
#
#>
######################################################################
p6df::modules::kubernetes::minikube::start() {

  minikube start

  p6df::modules::kubernetes::minikube
}
