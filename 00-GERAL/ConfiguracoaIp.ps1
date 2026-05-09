# Configurar o IP .10 na placa correta (Ethernet)
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 192.168.56.11 -PrefixLength 24 -DefaultGateway 192.168.56.1
#Outra forma  de definir Ip na maquina
netsh interface ip set address name="Ethernet" static 192.168.56.11 255.255.255.0 192.168.56.1
# Configurar o DNS para olhar para si mesmo nesta placa
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("127.0.0.1")