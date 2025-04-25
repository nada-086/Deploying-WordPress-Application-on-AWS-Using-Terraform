# Launch an EC2 Instance with SSH/HTTP Access
This Module provisions an Amazon EC2 instance with SSH and HTTP access, using a custom key pair and security group.

├── ec2.tf              
├── security_group.tf    
├── ssh_key.tf           
├── variables.tf        
└── README.md           

## File Descriptions

- **`ec2.tf`**  
  Launches the EC2 instance using variables for the AMI, instance type, subnet, and key pair.

- **`security_group.tf`**  
  Creates a security group that:
  - Allows incoming SSH (port 22) and HTTP (port 80) traffic from any IP.
  - Allows all outbound traffic.

- **`ssh_key.tf`**  
  - Generates a secure RSA key pair using Terraform.
  - Uploads the public key to AWS as a key pair for EC2 access.
  - Saves the private key locally as a `.pem` file with secure permissions.

- **`variables.tf`**  
  Declares required variables such as:
  - `ami` – The Amazon Machine Image ID.
  - `instance_type` – The EC2 instance type.
  - `vpc_id` – The VPC where the instance and security group will be created.
  - `public_subnet_id` – The subnet ID to place the EC2 instance.
