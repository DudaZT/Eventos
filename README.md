# 🎫 Sistema de Gestão de Eventos/Ingressos - DSW1

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-007396?style=for-the-badge&logo=java&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)

Sistema web completo para gestão de eventos, categorias, ingressos e usuários desenvolvido como trabalho prático da disciplina DSW1.

## 🎯 Sobre o Projeto

O **Sistema de Gestão de Eventos** é uma aplicação web desenvolvida em Java com JSP que permite o gerenciamento completo de eventos, desde o cadastro até a venda de ingressos. O sistema implementa controle de acesso por níveis de privilégio, garantindo que cada tipo de usuário tenha acesso apenas às funcionalidades pertinentes ao seu perfil.

### Objetivos do Projeto
- Desenvolver uma aplicação web completa utilizando padrões MVC
- Implementar autenticação segura com hash SHA-512
- Criar CRUDs completos para todas as entidades principais
- Utilizar FrontController para organização do código
- Implementar tratamento adequado de erros e sessões

## ✨ Funcionalidades

### 🔐 Sistema de Autenticação
- **Login/Logout** com controle de sessões
- **Senhas criptografadas** com SHA-512
- **Cookies** para persistência de sessão
- **3 Níveis de Acesso**: Administrador, Organizador e Cliente

### 👥 Gestão de Usuários (CRUD)
- Cadastro de novos usuários
- Atribuição de privilégios
- Edição e exclusão de contas
- Controle de acesso por módulos

### 🏷️ Gestão de Categorias (CRUD)
- Categorização de eventos
- Descrição detalhada de cada categoria
- Organização por tipos (Show, Teatro, Esporte, Conferência)

### 🎭 Gestão de Eventos (CRUD)
- Cadastro de eventos com múltiplas categorias
- Definição de local, data e capacidade
- Controle de preços e descrições
- Filtragem por categorias

### 🎫 Gestão de Ingressos (CRUD)
- Compra de ingressos para eventos
- Controle de quantidade e valor total
- Histórico de compras por usuário
- Limitação por capacidade do evento

### ⚙️ Funcionalidades Avançadas
- **Validação de Formulários** com Regex
- **Tratamento Global de Erros**
- **ContextListener** para inicialização/encerramento
- **Menu Dinâmico** baseado em privilégios
- **Interface Responsiva** com CSS customizado

## 🛠️ Tecnologias Utilizadas

### Backend
- **Java** - Linguagem principal
- **JSP (JavaServer Pages)** - Template engine
- **Servlet API** - Controle de requisições
- **FrontController** - Padrão arquitetural

### Banco de Dados
- **MySQL** - Sistema gerenciador
- **MySQL Workbench** - Modelagem e script
- **JDBC** - Conexão com banco

### Frontend
- **HTML5** - Estrutura das páginas
- **Bootstrap** - Estilização e design
- **JavaScript** - Interatividade

### Ferramentas
- **Git** - Controle de versão
- **Apache Tomcat** - Servidor de aplicação

## 🚀 Instalação e Configuração

### Pré-requisitos
- Java JDK 11 ou superior
- Apache Tomcat 9 ou superior
- MySQL 8.0 ou superior
- Git

### Passo a Passo

1. **Clone o repositório**
```bash
git clone https://github.com/seu-usuario/Eventos.git
cd Eventos
```

2. **Configure o banco de dados**
```sql
-- Execute o script SQL fornecido
mysql -u root -p < database/eventos_bd.sql
```

3. **Configure as conexões**
```properties
# Arquivo: src/main/resources/db.properties
db.url=jdbc:mysql://localhost:3306/eventos_bd
db.username=seu_usuario
db.password=sua_senha
```

4. **Configure o Tomcat**
- Adicione o projeto como Dynamic Web Project
- Configure o Context Path
- Inicie o servidor

5. **Acesse a aplicação**
```
http://localhost:8080/Eventos/
```

## 📊 Funcionalidades Técnicas Implementadas

### ✅ Requisitos Atendidos
- [x] FrontController Servlet + JSP
- [x] Banco de dados MySQL com script completo
- [x] Login/Logout com Sessões & Cookies
- [x] Hash SHA-512 para senhas
- [x] Menu dinâmico baseado em privilégios
- [x] CSS customizado
- [x] 4 CRUDs completos
- [x] Formulários com validação Regex
- [x] Tratamento geral de erros
- [x] ContextListener para inicialização/encerramento
- [x] Controle de versão com Git

## 👨‍💻 Desenvolvedor

**Maria Eduarda Zanetti**  
🎓 Disciplina: DSW1 - Desenvolvimento de Software Web 1  
🏫 Instituição: Instituto Federal de Educação, Ciência e Tecnologia de São Paulo   

## 📄 Licença

Este projeto foi desenvolvido para fins acadêmicos como parte da disciplina DSW1.

---

<div align="center">

### ⭐ Se este projeto te ajudou, não esqueça de dar uma estrela!

**Desenvolvido com ❤️ para a disciplina DSW1**

</div>
