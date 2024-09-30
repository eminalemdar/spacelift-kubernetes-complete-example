resource "spacelift_context" "k8s-stack" {
  description = "Configuration details for the EKS cluster"
  name        = "EKS Cluster"
}

resource "spacelift_environment_variable" "aws_region" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_aws_region"
  value       = "eu-west-1"
  write_only  = false
  description = "AWS region to deploy the EKS cluster to"
}

resource "spacelift_environment_variable" "vpc_name" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_vpc_name"
  value       = "eks-vpc"
  write_only  = false
  description = "VPC name for the EKS cluster"
}

resource "spacelift_environment_variable" "vpc_cidr" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_vpc_cidr"
  value       = "10.0.0.0/16"
  write_only  = false
  description = "CIDR block for the VPC"
}

resource "spacelift_environment_variable" "public_subnets" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_public_subnets"
  value       = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
  type        = list(string)
  write_only  = false
  description = "CIDR blocks for the public subnets"
}

resource "spacelift_environment_variable" "private_subnets" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_private_subnets"
  value       = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  type        = list(string)
  write_only  = false
  description = "CIDR blocks for the private subnets"
}

resource "spacelift_environment_variable" "cluster_name" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_cluster_name"
  value       = "eks-cluster"
  write_only  = false
  description = "Name of the EKS cluster"
}

resource "spacelift_environment_variable" "cluster_version" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_cluster_version"
  value       = "1.30"
  write_only  = false
  description = "Version of the EKS cluster"
}

resource "spacelift_environment_variable" "node_group_name" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_node_group_name"
  value       = "eks-node-group"
  write_only  = false
  description = "Name of the EKS node group"
}

resource "spacelift_environment_variable" "node_group_instance_type" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_node_group_instance_type"
  value       = "t3.medium"
  write_only  = false
  description = "Instance type of the EKS node group"
}

resource "spacelift_environment_variable" "node_group_desired_capacity" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_node_group_desired_capacity"
  value       = "2"
  write_only  = false
  description = "Desired capacity of the EKS node group"
}

resource "spacelift_environment_variable" "node_group_max_capacity" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_node_group_max_capacity"
  value       = "3"
  write_only  = false
  description = "Maximum capacity of the EKS node group"
}

resource "spacelift_environment_variable" "node_group_min_capacity" {
  context_id  = spacelift_context.k8s-stack.id
  name        = "TF_VAR_node_group_min_capacity"
  value       = "1"
  write_only  = false
  description = "Minimum capacity of the EKS node group"
}




resource "spacelift_context_attachment" "attachment" {
  context_id = spacelift_context.k8s-stack.id
  stack_id   = spacelift_stack.eks-stack.id
}