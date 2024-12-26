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
-   **GitLab Project Link**: [Gitlab Project](your-gitlab-repo-link)

## Repository Structure

```plaintext
Microservice_DevOps/
├── ansible/             # Ansible files for server setup
│   ├── ansible.cfg      # Ansible configuration file
│   ├── inventory        # Target hosts
│   ├── group_vars/      # Group variables
│   │   └── all.yml      # Variables for all hosts
│   ├── playbooks/       # Playbooks folder
│   │   └── main.yml     # Main playbook
│   └── roles/           # Reusable roles
│       ├── docker/      # Docker setup tasks
│       │   └── tasks/
│       │       └── main.yml
│       └── ssh/         # SSH setup
│           ├── tasks/
│           │   └── main.yml
│           └── vars/
│               └── main.yml
├── application/         # Microservices code
│   ├── frontend/        # Frontend service
│   │   ├── Dockerfile   # Build frontend image
│   │   ├── ...          # Frontend source code (HTML, CSS, JS)
│   ├── products/        # Products service
│   │   ├── Dockerfile   # Build products image
│   │   ├── ...          # Products service source code (e.g., Node.js, Python)
│   ├── shopping-cart/   # Shopping cart service
│   │   ├── Dockerfile   # Build shopping cart image
│   │   ├── ...          # Shopping cart service code (Node.js, Python)
│   ├── .gitignore       # Ignore unnecessary files
│   ├── docker-compose.yml # Local orchestration for app services
├── terraform/           # Infrastructure configurations
│   ├── main.tf          # Main Terraform config
│   ├── variables.tf     # Input variables
│   ├── outputs.tf       # Output values
│   └── modules/         # Modular Terraform configurations
│       ├── vpc/         # Network setup
│       │   └── main.tf
│       ├── compute/     # VM or container setup
│       │   └── main.tf
│       └── security/    # Security settings
│           └── main.tf
├── .gitlab-ci/          # CI/CD pipeline configuration
│   ├── build.yml        # Build pipeline configuration
│   ├── deploy.yml       # Deploy pipeline configuration
├── .gitlab-ci.yml       # Main CI/CD pipeline file
├── docker-compose.yml   # Local development stack orchestration
├── README.md            # Project documentation
```

## Setup and Deployment

### 1. Configure AWS Credentials

Set up your AWS CLI with the required credentials:

```bash
aws configure
```

### 2. Set up Terraform

To provision infrastructure on AWS, use Terraform:

-   Initialize the Terraform working directory:

```bash
terraform init
```

-   Create a plan to preview the infrastructure changes:

```bash
terraform plan
```

-   Apply the plan to provision the resources:

```bash
terraform apply
```

### 3. Ansible Configuration

Ansible is used for configuring the infrastructure and deploying Docker containers:

-   Set up the `inventory` file with the EC2 instance IP address.
-   Modify the `ansible/playbooks/main.yml` to ensure correct SSH user and private key settings.
-   Run the Ansible playbook to configure your server:

```bash
ansible-playbook -i inventory ansible/playbooks/main.yml
```

### 4. Docker Compose (Local Development)

Use Docker Compose to run the services locally:

```bash
docker-compose up -d
```

### 5. GitLab CI/CD Pipeline

Set up the GitLab CI/CD pipeline to automate build and deployment:

1.  Add the following CI/CD variables in your GitLab repository:
    -   **`SSH_PRIVATE_KEY`**: Your private SSH key (base64 encoded).
    -   **`SERVER_IP`**: The public IP address of your server.
    -   **`CI_REGISTRY_USER`**: GitLab container registry username.
    -   **`CI_REGISTRY_PASSWORD`**: GitLab container registry password.
   
2.  Push the code to trigger the pipeline:

```bash
git add .
git commit -m "Initial commit"
git push origin main
```

### 6. Access the Application

Once the pipeline completes, your application should be accessible at:

```
http://<your-server-ip>:4000
```

## Application Architecture

-   The `frontend` service provides the user interface.
-   The `products` service manages the product information.
-   The `shopping-cart` service handles the user's shopping cart functionality.

These services communicate over HTTP requests.

## Troubleshooting

-   **Network Issues**: Ensure security groups allow access to port `4000`.
-   **Docker Issues**: Verify Docker is running and the images are built correctly.
-   **Ansible Issues**: Check Ansible logs for errors.
-   **Terraform Issues**: Validate Terraform configurations for errors.

## Contributing

We welcome contributions! Feel free to:

- Submit pull requests.
- Open issues.
- Share suggestions for improvement.

## Contributors

This project is developed and maintained by:

- [EHABFAtHY1](https://github.com/EHABFAtHY1)
- [rawan-fawzy](https://github.com/rawan-fawzy)
- [MohammedZayed1](https://github.com/MohammedZayed1)
- [Mohamedelmahdy01](https://github.com/Mohamedelmahdy01)

## License

This project is licensed under the MIT [License](./LICENSE).