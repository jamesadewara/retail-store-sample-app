output "configure_kubectl" {
  description = "Command to update kubeconfig for this cluster"
  value       = module.retail_app_eks.configure_kubectl
}

output "retail_app_url" {
  description = "URL to access the retail store application"
  value = try(
    "http://${data.kubernetes_service.ui_service.status[0].load_balancer[0].ingress[0].hostname}",
    "LoadBalancer provisioning - run: kubectl get svc -n ui ui"
  )
}

output "cluster_endpoint" {
  value = module.retail_app_eks.cluster_endpoint
}

output "cluster_name" {
  value = "${module.retail_app_eks.eks_cluster_id}-cluster"
}

output "region" {
  value = "us-east-1"
}

output "vpc_id" {
  value = module.vpc.inner.vpc_id
}

output "assets_bucket_name" {
  value = "bedrock-assets-altsoe0253359"
}