### init.zsh:
- p6_kubernetes_aws_cluster_fargate_profile_create([cluster_name=$KUBE_CLUSTER_NAME], profile_name, namespace)
- p6_kubernetes_aws_cluster_logging_enable([cluster_name=$KUBE_CLUSTER_NAME])
- p6_kubernetes_aws_iam_oidc_create([cluster_name=$KUBE_CLUSTER_NAME])
- p6_kubernetes_cluster_create(cluster_name, [cluster_version=1.17], [vpc_id=$AWS_VPC_ID])
- p6_kubernetes_coredns_status()
- p6_kubernetes_dashboard_server_deploy()
- p6_kubernetes_dashboard_server_token_get()
- p6_kubernetes_deployments()
- p6_kubernetes_ingress_controller_alb_deploy([cluster_name=$KUBE_CLUSTER_NAME])
- p6_kubernetes_jenkins_deploy()
- p6_kubernetes_jenkins_ip_get()
- p6_kubernetes_jenkins_passwd_get()
- p6_kubernetes_metrics_raw_get()
- p6_kubernetes_metrics_server_deploy()
- p6_kubernetes_minikube_docker()
- p6_kubernetes_pods_status()
- p6_kubernetes_prometheus_console_forward()
- p6_kubernetes_prometheus_deploy()
- p6_kubernetes_prometheus_pods_status()
- p6_kubernetes_prompt_info()
- p6_kubernetes_svc_account([cluster_name=$KUBE_CLUSTER_NAME])
- p6_kubernetes_svc_get()
- p6_kubernetess_metrics_server_status()
- p6_kunernetes_nodegroup_create([cluster_name=$KUBE_CLUSTER_NAME], profile_name)
- p6df::modules::kubernetes::deps()
- p6df::modules::kubernetes::external::brew()
- p6df::modules::kubernetes::home::symlink()
- p6df::modules::kubernetes::init()
- p6df::modules::kubernetes::version()
- p6df::prompt::kubernetes::line()

