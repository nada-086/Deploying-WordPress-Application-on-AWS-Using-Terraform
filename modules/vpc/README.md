# 🌐 VPC Networking Module

This Terraform module provisions a basic VPC networking setup on AWS including:

- A custom VPC  
- Two public subnets  
- Two private subnets  
- An Internet Gateway  
- Route table and associations  


---

## 📄 File Descriptions

- **`main.tf`**  
  Creates all the networking infrastructure:
  - A VPC using a custom CIDR block  
  - Two public subnets in separate availability zones  
  - Two private subnets in separate availability zones  
  - An Internet Gateway attached to the VPC  
  - A route table for public subnets with a default route to the Internet Gateway  
  - Associations between the route table and public subnets  

- **`variables.tf`**  
  Declares input variables required to customize the module:
  - `myvpc_cidr_block` – The CIDR block for the VPC  
  - `subnet1_cidr_block` – CIDR for public subnet in AZ1  
  - `subnet2_cidr_block` – CIDR for public subnet in AZ2  
  - `private_subnet1_cidr_block` – CIDR for private subnet in AZ1  
  - `private_subnet2_cidr_block` – CIDR for private subnet in AZ2  

- **`outputs.tf`**  
  Exposes useful networking outputs:
  - `vpc_id` – The ID of the created VPC  
  - `public_subnet_ids` – A list of public subnet IDs  
  - `private_subnet_ids` – A list of private subnet IDs  

---

## 📌 Notes

- Public subnets are automatically assigned public IPs on launch.  
- Private subnets are created for use with resources like databases or internal services.  
- You may extend this module later to include NAT Gateway, NACLs, or VPN configuration.
