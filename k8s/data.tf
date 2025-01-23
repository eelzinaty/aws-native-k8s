data "aws_vpc" "vpc" {
  tags = {
    // we could have used other tags like name and project, 
    // but I want to demonestrate the importance of this tag to make the cluster functionaly
    "karpenter.sh/discovery" = local.name
  }
}

data "aws_eks_cluster" "cluster" {
  name = local.name
}

data "aws_eks_cluster_auth" "cluster" {
  name = local.name
}
