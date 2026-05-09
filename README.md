# 🖥️ systemAdminWindowsServer

Este repositório é um guia prático para a **administração e configuração de Windows Server**. A estrutura segue uma linha de aprendizagem lógica, começando pela base da rede até à gestão avançada de domínios.

---

##  Sumário

1. [Visão Geral](#1-visão-geral)
2. [Versões Suportadas](#2-versões-suportadas)
3. [Estrutura do Repositório](#3-estrutura-do-repositório)
4. [Trilha de Configuração (Passo a Passo)](#4-trilha-de-configuração-passo-a-passo)
    * [Fase 1: DHCP (Endereçamento)](#fase-1-dhcp-endereçamento)
    * [Fase 2: DNS (Resolução de Nomes)](#fase-2-dns-resolução-de-nomes)
    * [Fase 3: Active Directory (Identidade)](#fase-3-active-directory-identidade)
5. [Segurança e Hardening](#5-segurança-e-hardening)
6. [Guia de Uso](#6-guia-de-uso)
7. [Contribuição e Licença](#7-contribuição-e-licença)

---

## 1. Visão Geral

O projeto foca na automação via **PowerShell** para reduzir erros manuais. A metodologia aplicada aqui foca primeiro na base da rede para garantir que os serviços de identidade (AD) funcionem sobre uma base sólida.

---

## 2. Versões Suportadas

| Versão | Notas |
| :--- | :--- |
| **Windows Server 2022** | Recomendado para novas implementações. |
| **Windows Server 2019** | Padrão de mercado atual. |
| **Windows Server Core** | Scripts otimizados para gestão via linha de comando. |

---

## 3. Estrutura do Repositório

```text
├── /01-DHCP             # Escopos, Reservas e Políticas de IP.
├── /02-DNS              # Zonas Diretas/Inversas e Encaminhadores.
├── /03-Active-Directory # Domínios, GPOs e Gestão de Objetos.
├── /04-Security         # Hardening e Auditoria.
└── /Tools               # Utilitários de diagnóstico de rede.
