# Project Title

## About the Project
This project demonstrates how to use EKS (Elastic Kubernetes Service) in auto mode. The primary goal is to test the created EKS cluster and evaluate how easy it is to maintain it.

## How to Use It
The project is organized into two main folders:

- **aws**: This folder contains all the AWS setup, including the EKS infrastructure and supported EKS addons.
```bash
export AWS_PROFILE=<your aws profile>
export AWS_REGION=eu-central-1
terraform init
terraform apply -y
```
- **k8s**: This folder includes the Kubernetes objects necessary to ensure the cluster functions as desired.
```bash
export AWS_PROFILE=<your aws profile>
export AWS_REGION=eu-central-1
terraform init
terraform apply -y
```

### Future Plans
In the near future, I will be adding two additional folders:
- **apps**: This folder will host the applications.
- **helm**: This folder will contain the Helm configurations, allowing ArgoCD to manage GitOps for Helm updates.

## Next Steps
- Set up the EKS cluster using the configurations in the `aws` folder.
- Deploy the necessary Kubernetes objects from the `k8s` folder.
- Implement the applications and Helm configurations in their respective folders.