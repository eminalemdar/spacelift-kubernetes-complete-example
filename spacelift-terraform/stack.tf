resource "spacelift_stack" "eks-stack" {
  github_enterprise {
    namespace = "eminalemdar" # The GitHub organization / user the repository belongs to
  }

  administrative    = true
  autodeploy        = true
  branch            = "main"
  description       = "Provisions an Amazon EKS Kubernetes cluster"
  name              = "eks-stack"
  project_root      = "cluster"
  repository        = "spacelift-kubernetes-complete-example"
  terraform_version = "1.5.7"
  terraform_smart_sanitization = true
}

data "spacelift_aws_integration" "aws" {
  name = "AWS"
}

resource "spacelift_aws_integration_attachment" "this" {
  integration_id = data.spacelift_aws_integration.aws.id
  stack_id       = spacelift_stack.eks-stack.id
  read           = true
  write          = true
}