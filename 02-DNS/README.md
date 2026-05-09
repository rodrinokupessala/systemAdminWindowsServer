###  Fase 1: DHCP (Dynamic Host Configuration Protocol)

O **DHCP** é o serviço fundamental que automatiza e centraliza a atribuição de endereços IP e outras informações de configuração de rede para os dispositivos. Sem este serviço, a gestão de uma rede exigiria configurações manuais em cada máquina, o que é ineficiente e propenso a erros de duplicação.

Nesta fase do repositório, exploramos a configuração via **PowerShell**, focando nos seguintes pilares:

*   **Instalação da Role:** Adição do serviço DHCP Server no Windows Server utilizando módulos de automação.
*   **Escopos (Scopes):** Definição do intervalo de IPs (Pool) que o servidor está autorizado a distribuir na rede local .
*   **Opções de Escopo (Scope Options):** Configuração automática de parâmetros essenciais para o cliente, como o **Gateway** (Roteador), servidores **DNS** e sufixos de domínio .
*   **Reservas:** Atribuição de IPs fixos a dispositivos específicos (como servidores e impressoras) com base no seu endereço físico (MAC Address) .
*   **Autorização:** Procedimento de segurança para autorizar o servidor DHCP no Active Directory, evitando servidores não autorizados (rogue) na rede .

> **💡 Por que começar pelo DHCP?**
> A comunicação a nível de IP é a base de toda a infraestrutura. Antes de um servidor poder resolver nomes via DNS ou de um utilizador se autenticar no Active Directory, o dispositivo precisa de uma identidade na rede e de saber qual o caminho para o resto da infraestrutura .