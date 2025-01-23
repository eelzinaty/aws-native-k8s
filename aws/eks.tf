module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name                  = local.name
  cluster_version               = "1.31"
  tags                          = local.tags
  bootstrap_self_managed_addons = false // this is the default value

  // vpc config block
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  # This will cause the karpenter to by default provision nodes in these subnets. 
  # We can override this by creaing another node class with proper subnets
  # control_plane_subnet_ids       = module.vpc.intra_subnets
  cluster_endpoint_public_access = true


  // access config block
  authentication_mode                      = "API"
  enable_cluster_creator_admin_permissions = true


  // compute config and creating nodes
  cluster_compute_config = {
    enabled    = true
    node_pools = ["system"]
  }

  // Storage management is enabled by default for Auto cluster
  // storage_config

  // Encryption is enabled by default as well, but we can customize the KMS configurations
  // cluster_encryption_config

  // ELB is enabled by default for Auto Mode
  // kubernetes_network_config => elastic_load_balancing

  // remote_network_config is out of scope

  cluster_addons = {
    "metrics-server" = {
      enabled = true
      configuration_values = jsonencode({
        tolerations = [
          # Allow metrics-server to run on the critcal nodes
          {
            key      = "CriticalAddonsOnly"
            operator = "Exists"
            effect   = "NoSchedule"
          },
        ]
      })
    }
  }

  node_iam_role_additional_policies = {
    ecr = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  }

}
