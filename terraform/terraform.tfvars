env_name           = "paver"
region             = "us-east-2"
availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
#ops_manager_ami    = "ami-00f06699d85b08c53"
rds_instance_count = 0
dns_suffix         = "pivotal-poc.solutions"
vpc_cidr           = "10.10.0.0/16"
use_route53        = true
use_ssh_routes     = true
use_tcp_routes     = true

tags = {
    Team = "Dev"
    Project = "WebApp3"
}