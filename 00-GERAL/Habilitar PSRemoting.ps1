# =========================================================
# CONFIGURAÇÃO NO PC REMOTO (SERVIDOR)
# Execute estes comandos no computador que será acessado remotamente
# Exemplo: 192.168.56.11
# =========================================================

# Ativa o PowerShell Remoting no computador remoto
# Configura automaticamente o WinRM e libera regras básicas do firewall
Enable-PSRemoting -Force

# Verifica se o serviço WinRM está em execução
Get-Service WinRM

# Configura o serviço WinRM para iniciar automaticamente com o Windows
Set-Service WinRM -StartupType Automatic

# Habilita as regras do Firewall do Windows para permitir gerenciamento remoto
Enable-NetFirewallRule -DisplayGroup "Windows Remote Management"

# Reinicia o serviço WinRM para aplicar alterações
Restart-Service WinRM

# =========================================================
# CONFIGURAÇÃO NO PC CLIENTE
# Execute estes comandos no computador que fará a conexão remota
# =========================================================

# Adiciona TODOS os computadores como confiáveis
# Use apenas em laboratório/testes
# NÃO recomendado em ambiente de produção
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*"

# Adiciona apenas o IP do computador remoto como confiável
# Mais seguro do que usar "*"
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "192.168.56.11"

# Mesmo comando acima, mas forçando sem pedir confirmação
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "192.168.56.11" -Force

# Executa PowerShell como Administrador e aplica a configuração TrustedHosts sem precisar abrir o PowerShell manualmente
#powershell -Command "Start-Process powershell -Verb RunAs -ArgumentList 'Set-Item WSMan:\localhost\Client\TrustedHosts -Value \"192.168.56.11\" -Force'"

# Reinicia o serviço WinRM no cliente
Restart-Service WinRM

# Ativa autenticação Basic no cliente WinRM
# Necessário em alguns cenários de autenticação remota
winrm set winrm/config/client/auth '@{Basic="true"}'

# Permite execução de scripts apenas nesta sessão atual do PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force

# =========================================================
# COMANDOS DE CONEXÃO REMOTA
# Execute no PC CLIENTE para acessar o PC REMOTO
# =========================================================

# Abre uma sessão remota interativa no computador remoto
# Será solicitado usuário e senha
Enter-PSSession -ComputerName 192.168.56.11 -Credential Administrador

# Executa um comando remotamente sem abrir sessão interativa
# Neste caso, mostra o nome do computador remoto
Invoke-Command -ComputerName 192.168.56.11 `
  -ScriptBlock { hostname }