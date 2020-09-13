### init.zsh:
- p6_kubernetes_aws_cluster_logging_enable([cluster_name=$KUBE_CLUSTER_NAME])
- p6_kubernetes_aws_iam_oidc_create([cluster_name=$KUBE_CLUSTER_NAME])
- p6_kubernetes_dashboard_server_token_get()
- p6_kubernetes_metrics_raw_get()
- p6_kubernetes_minikube_docker()
- p6_kubernetes_prompt_info()
- p6df::modules::kubernetes::deps()
- p6df::modules::kubernetes::external::brew()
- p6df::modules::kubernetes::home::symlink()
- p6df::modules::kubernetes::init()
- p6df::modules::kubernetes::version()
- p6df::prompt::kubernetes::line()

