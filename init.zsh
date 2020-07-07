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
    ModuleDeps=()
}

######################################################################
#<
#
# Function: p6df::modules::kubernetes::external::brew()
#
#>
######################################################################
p6df::modules::kubernetes::external::brew() {

  brew install kube-aws
  brew install kube-ps1
  brew install kubeaudit
  brew install kubebuilder
  brew install kubecfg
  brew install kubectx
  brew install kubeless
  brew install kubeprod
  brew install kubernetes-cli
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
}

######################################################################
#<
#
# Function: p6df::prompt::kubernetes::line()
#
#>
######################################################################
p6df::prompt::kubernetes::line() {

}

######################################################################
#<
#
# Function: str str = p6_kubernetes_prompt_info()
#
#  Returns:
#	str - str
#
#>
######################################################################
p6_kubernetes_prompt_info() {

}