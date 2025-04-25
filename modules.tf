module "vpc" {
    source = "./modules/vpc"
    region                     = "us-east-1"
    myvpc_cidr_block           = "10.0.0.0/16"
    public_subnet_cidr_block         = "10.0.1.0/24"
    private_subnet1_cidr_block = "10.0.10.0/24"
    private_subnet2_cidr_block = "10.0.11.0/24"
}


module "ec2" {
    source = "./modules/ec2"
    public_subnet_id = module.vpc.public_subnet_1_id
    vpc_id = module.vpc.vpc_id
}


module "rds" {
    source = "./modules/rds"
    db_password = "wordpress"
    vpc_id = module.vpc.vpc_id
    ec2_sg_id = module.ec2.ec2_sg_id
    private_subnet_1_id = module.vpc.private_subnet_1_id
    private_subnet_2_id = module.vpc.private_subnet_2_id
}
