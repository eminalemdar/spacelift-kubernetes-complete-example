variable "aws_region" {
  description = "AWS region"
}

variable "cluster_name" {
  description = "Name of the EKS Cluster"
}

variable "cluster_version" {
  description = "Kubernetes version of the EKS Cluster"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
}