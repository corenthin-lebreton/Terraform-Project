module "vpc-ecoshop" {
  source         = "./modules/vpc"
  vpc_cidr       = var.vpc_cidr
  az1            = var.az1
  az2            = var.az2
  publicwebtier  = var.publicwebtier
  publicwebtier2 = var.publicwebtier2
  privateapp1    = var.privateapp1
  privateapp2    = var.privateapp2
  privatedb1     = var.privatedb1
  privatedb2     = var.privatedb2

}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc-ecoshop.vpc_id
}


module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0360c520857e3138f"
  publicsubnet  = module.vpc-ecoshop.public_subnets
  privatesubnet = module.vpc-ecoshop.private_app_subnets
  ssh-key       = "ecoshop"
  SG-Bastion    = module.security.sg_bastion_id
  SG-App        = module.security.sg_app_id
}

module "rds" {
  source      = "./modules/rds"
  subnets     = module.vpc-ecoshop.db_subnets
  vpc_id      = module.vpc-ecoshop.vpc_id
  SG-DB       = module.security.sg_db_id
  db_username = var.db_username
  db_password = var.db_password
}

module "lb" {
  source        = "./modules/lb"
  vpc_id        = module.vpc-ecoshop.vpc_id
  publicsubnets = module.vpc-ecoshop.public_subnets
  appinstance   = module.ec2.appinstance_ids
  SG-Web        = module.security.sg_web_id
}