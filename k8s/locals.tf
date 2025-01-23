locals {
  region  = "eu-central-1"
  name    = "native-cluster"
  project = "native-demo"
  tags = {
    Project = local.project
  }
}
