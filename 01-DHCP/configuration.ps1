# Configuração do Servidor DHCP no Windows Server 2012 ou superior
# 2. Criar Grupos de Segurança e Reiniciar o Serviço (Essencial para o Windows Server 2012)
netsh dhcp add securitygroups
Restart-Service dhcpserver

# 3. Autorizar o Servidor no Domínio Rosoft
# Ajustado para o nome do seu domínio e IP do servidor somente setive o dns ja configurado no servidor para o ip do servidor e o dns do dominio
Add-DhcpServerInDC -DnsName "servidor.rosoft.local" -IPAddress 192.168.56.11

# 4. Criar o Escopo IPv4
Add-DhcpServerv4Scope -Name "Rede Local Rosoft" `
                      -StartRange 192.168.56.50 `
                      -EndRange 192.168.56.200 `
                      -SubnetMask 255.255.255.0 `
                      -State Active

# 5. Configurar Gateway (Opção 003)
Set-DhcpServerv4OptionValue -ScopeId 192.168.56.0 -OptionId 3 -Value 192.168.56.1

# 6. Configurar DNS Temporário (Opção 006)
Set-DhcpServerv4OptionValue -ScopeId 192.168.56.0 -OptionId 6 -Value 8.8.8.8, 8.8.4.4

# 7. Configurar Sufixo DNS do Domínio (Opção 015)
Set-DhcpServerv4OptionValue -ScopeId 192.168.56.0 -OptionId 15 -Value "rosoft.local"

# --- Verificação Final ---
Write-Host "Verificando Escopo..." -ForegroundColor Green
Get-DhcpServerv4Scope

Write-Host "Verificando Opções de Escopo..." -ForegroundColor Green
Get-DhcpServerv4OptionValue -ScopeId 192.168.56.0