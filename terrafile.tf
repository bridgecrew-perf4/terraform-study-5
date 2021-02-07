#modulo para criação dos servidores
module "servers" {
  source  = "./servers"
  servers = 1
}

#output que chama a info configurada dentro do modulo filho module.servers.<output-configurado>
output "dns_name" {
  value = module.servers.dns_name
}
