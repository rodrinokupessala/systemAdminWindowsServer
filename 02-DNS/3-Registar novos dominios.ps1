# Cria a zona mbunga.local no seu servidor DNS (.11)
Add-DnsServerPrimaryZone -Name "mbunga.local" -ZoneFile "mbunga.local.dns"

# Cria o registro principal (em branco) que aponta para o IP .12
Add-DnsServerResourceRecordA -Name "@" -ZoneName "mbunga.local" -IPv4Address "192.168.56.12"

# Cria também o registro 'www' para que www.mbunga.local também funcione
Add-DnsServerResourceRecordA -Name "www" -ZoneName "mbunga.local" -IPv4Address "192.168.56.12"

# Limpa o cache para garantir que não pegue lixo
ipconfig /flushdns

# Testa a nova rota
Resolve-DnsName mbunga.local



#Set-DnsServerResourceRecordA -Name "@" -ZoneName "mbunga.local" -OldIPv4Address "192.168.56.12" -IPv4Address "192.168.56.106"