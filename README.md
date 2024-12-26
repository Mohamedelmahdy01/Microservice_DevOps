
# Microservices Deployment with Terraform, Docker, Ansible, and GitLab CI/CD

This project demonstrates the deployment of a microservices application using Infrastructure as Code (Terraform), containerization (Docker), configuration management (Ansible), and automated CI/CD pipelines (GitLab CI/CD).

## Project Overview

This project deploys a simple application composed of three microservices:
-   `frontend`: A web application that interacts with the other services.
-   `products`: A service that manages product information.
-   `shopping-cart`: A service that manages the user's shopping cart.

These microservices are containerized using Docker, deployed on an AWS EC2 instance created with Terraform and configured with Ansible, and use a GitLab pipeline for continuous integration and deployment.

## Prerequisites

Before you begin, ensure you have the following installed and configured:

-   **Git**: [Download Git](https://git-scm.com/downloads)
-   **Terraform**: [Download Terraform](https://www.terraform.io/downloads)
-   **Ansible**: [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
-   **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
-   **AWS CLI**: [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
-   **An account on AWS**
-   **An account on GitLab**

## Repository Structure

```plaintext
Microservice_DevOps/
├── ansible/             # Ansible files for server setup
│   ├── playbook.yml      # Main playbook
│   ├── inventory         # Target hosts
│   └── roles/            # Reusable roles
│       └── ...
├── application/          # Microservices code
│   ├── frontend/         # Frontend service
│   │   ├── Dockerfile    # Build frontend image
│   │   ├── ...
│   ├── products/         # Products service
│   │   ├── Dockerfile    # Build products image
│   │   ├── ...
│   ├── shopping-cart/    # Shopping cart service
│   │   ├── Dockerfile    # Build shopping cart image
│   │   ├── ...
│   ├── .gitignore        # Ignore unnecessary files
│   ├── docker-compose.yaml  # Compose for app services
├── terraform/            # Infrastructure configs
│   ├── main.tf           # Main config
│   ├── variables.tf      # Input variables
│   ├── outputs.tf        # Output values
│   └── modules/          # Modular configs
│       ├── vpc/          # Network setup
│       │   └── main.tf
│       ├── compute/      # VMs or containers
│       │   └── main.tf
│       └── security/     # Security rules
│            └── main.tf
├── .gitlab-ci/           # CI/CD configs
│   ├── build.yml         # Build pipeline
│   ├── deploy.yml        # Deploy pipeline
├── .gitlab-ci.yml        # Main pipeline file
├── docker-compose.yml    # Local stack orchestration
├── README.md             # Project documentation

```


## Setup and Deployment

Follow these steps to set up and deploy your application:

### 1. Configure AWS Credentials

Configure your AWS CLI with your access key ID, secret access key, and default region:
```bash
aws configure
```

### 2. Set up Terraform

1.  Navigate to the `terraform/` directory:
    ```bash
    cd terraform
    ```
2.  Review and adjust the variables in `variables.tf` (e.g., region, instance type, AMI ID, SSH key name).
3.  Initialize Terraform:
    ```bash
    terraform init
    ```
4.  Create the infrastructure:
    ```bash
    terraform apply
    ```
    This will create your VPC, subnet, EC2 instance, and security groups.
5.  Take note of the public IP output for the next steps, or get it from the AWS console.

### 3. Set up Ansible

1.  Navigate to the `ansible/` directory:
    ```bash
    cd ../ansible
    ```
2.  Add the `public IP address` of your deployed server to the `inventory` file.
3.  Modify the `playbook.yml` file to ensure the correct SSH user and private key path are used.
4.  Run the Ansible playbook to configure your server:
    ```bash
    ansible-playbook -i inventory playbook.yml
    ```

### 4. Configure GitLab CI/CD

1.  Add the following CI/CD variables to your GitLab project under Settings -> CI/CD -> Variables:
    -   **`SSH_PRIVATE_KEY`**: Your private SSH key (base64 encoded).
    -   **`SERVER_IP`**: The public IP address of your server.
    -   **`CI_REGISTRY_USER`**: The username to log into GitLab's container registry.
    -   **`CI_REGISTRY_PASSWORD`**: The password to log into GitLab's container registry.
2.  Ensure a GitLab Runner is available to execute your pipelines.

### 5. Push Your Code and Trigger the Pipeline

1.  Commit your code, including the `.gitlab-ci.yml` file, to your repository:
    ```bash
    git add .
    git commit -m "Initial commit"
    git push origin main
    ```
2.  This will trigger the pipeline to deploy the application.

### 6. Access the Application

Once the CI/CD pipeline completes, your application should be running and accessible at:
```
http://<your-server-ip>:4000
```

## Application Architecture

The application is structured as follows:
-   The `frontend` service acts as the user interface for the application, communicating with `products` and `shopping-cart` services.
-   The `products` service manages product information.
-   The `shopping-cart` service handles shopping cart functionality.

The services interact via HTTP requests.

## Troubleshooting

-   **Network Issues**: Ensure security groups allow access to port `4000` for your IP.
-   **Docker Issues**: Verify Docker is running and your images are correctly built.
-   **Ansible Issues**: Check Ansible logs for errors in the server configuration.
-   **Terraform Issues**: Validate your Terraform configuration for any errors.

---

## Contributing  
We welcome contributions!  
Feel free to:  
- Submit pull requests.  
- Open issues.  
- Share suggestions for improvement.  

## Contributors  
The project is developed and maintained by:  
- [EHABFAtHY1](https://github.com/EHABFAtHY1)  
- [rawan-fawzy](https://github.com/rawan-fawzy)  
- [MohammedZayed1](https://github.com/MohammedZayed1)  
- [Mohamedelmahdy01](https://github.com/Mohamedelmahdy01)  

---

## License

This project is licensed under the MIT License.
