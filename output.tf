output "private_subnets" {
  value = module.vpc.private_subnets
}
output "public_subnets" {
  value = module.vpc.public_subnets
}
output "security_group" {
  value = module.default_security_group.security_group_id
}
output "vpc_id" {
  value = module.vpc.vpc_id
}