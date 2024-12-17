provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eks-opensearch-cluster"
  cluster_version = "1.27"

  vpc_security_group_ids = ["sg-07832342d5cdd6bb4"] #replace your SG
  subnet_id = "subnet-047891b2b720a7614"

  node_groups = {
    opensearch_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t3.medium"]

      iam_role_attach_cni_policy = true
    }
  }
}
