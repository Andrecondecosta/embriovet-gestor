# 🐴 Embriovet Gestor - Sistema de Gestão de Sémen

[![Python](https://img.shields.io/badge/Python-3.11+-blue.svg)](https://www.python.org/)
[![Streamlit](https://img.shields.io/badge/Streamlit-1.53+-red.svg)](https://streamlit.io/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15+-blue.svg)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/License-Proprietary-yellow.svg)]()

Sistema profissional de gestão de sémen para clínicas veterinárias especializadas em reprodução equina.

---

## ✨ Funcionalidades Principais

### 📦 Gestão de Stock
- ✅ Controlo de palhetas de sémen por garanhão
- ✅ **Suporte a múltiplos donos para o mesmo garanhão**
- ✅ Rastreamento de qualidade, concentração e motilidade
- ✅ Gestão de locais de armazenagem
- ✅ Certificação e documentação

### 📝 Registro de Inseminações
- ✅ Registro completo de procedimentos
- ✅ **Escolha de qual dono usar o sémen**
- ✅ Atualização automática de stock
- ✅ Histórico detalhado por égua

### 🔄 Transferências entre Donos
- ✅ Transferir palhetas entre proprietários
- ✅ Rastreamento completo de movimentações
- ✅ Histórico de transferências

### 📈 Relatórios e Análises
- ✅ Consumo por garanhão e dono
- ✅ Histórico de inseminações
- ✅ Pesquisa avançada
- ✅ Filtros por múltiplos critérios
- ✅ Estatísticas em tempo real

---

## 🚀 Instalação Rápida

### Pré-requisitos

- Python 3.11 ou superior
- PostgreSQL 15 ou superior
- pip (gerenciador de pacotes Python)

### Passo 1: Clonar Repositório

```bash
git clone https://github.com/Andrecondecosta/embriovet-gestor.git
cd embriovet-gestor
```

### Passo 2: Instalar PostgreSQL

**Windows:** [Download PostgreSQL](https://www.postgresql.org/download/windows/)  
**macOS:** `brew install postgresql@15 && brew services start postgresql@15`  
**Linux:** `sudo apt install postgresql postgresql-contrib && sudo systemctl start postgresql`

### Passo 3: Criar Banco de Dados

```bash
# Conectar ao PostgreSQL
psql -U postgres

# Dentro do psql:
CREATE DATABASE embriovet;
\c embriovet
\i criar_banco.sql
\q
```

### Passo 4: Configurar Ambiente Python

```bash
# Criar ambiente virtual
python -m venv venv

# Ativar ambiente virtual
# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate

# Instalar dependências
pip install -r requirements_streamlit.txt
```

### Passo 5: Configurar Credenciais

Edite o arquivo `.env`:

```bash
DB_NAME=embriovet
DB_USER=postgres
DB_PASSWORD=sua_senha_aqui  # ⚠️ ALTERE PARA SUA SENHA!
DB_HOST=localhost
DB_PORT=5432
```

### Passo 6: Executar Aplicação

```bash
streamlit run app.py
```

Abra o navegador em: **http://localhost:8501**

---

## 📖 Documentação

- **[LEIA_ME_PRIMEIRO.md](LEIA_ME_PRIMEIRO.md)** - Início rápido
- **[INSTRUCOES_INSTALACAO_LOCAL.md](INSTRUCOES_INSTALACAO_LOCAL.md)** - Guia completo de instalação
- **[GUIA_RAPIDO.md](GUIA_RAPIDO.md)** - Como usar o sistema
- **[GUIA_MULTIPLOS_DONOS.md](GUIA_MULTIPLOS_DONOS.md)** - Como funciona múltiplos donos
- **[CORRECOES_APLICADAS.md](CORRECOES_APLICADAS.md)** - Histórico de correções

---

## 🎯 Caso de Uso Especial: Múltiplos Donos

O sistema suporta **o mesmo garanhão com sémen de vários donos diferentes**.

**Exemplo:**
- 🐴 Garanhão: **Retoque**
  - 👤 André: 50 palhetas (Tanque A)
  - 👤 Filipe: 60 palhetas (Tanque B)

**Funcionalidades:**
- ✅ Ver stock separado por dono
- ✅ Escolher de qual dono usar na inseminação
- ✅ Transferir palhetas entre donos
- ✅ Rastrear consumo por garanhão E por dono
- ✅ Histórico completo de movimentações

Veja detalhes em: [GUIA_MULTIPLOS_DONOS.md](GUIA_MULTIPLOS_DONOS.md)

---

## 🗄️ Estrutura do Banco de Dados

```sql
-- Proprietários do sémen
dono (id, nome, contato, email)

-- Estoque de sémen
estoque_dono (
  id, garanhao, dono_id, 
  data_embriovet, origem_externa,
  palhetas_produzidas, qualidade, concentracao, motilidade,
  local_armazenagem, certificado, dose, observacoes,
  quantidade_inicial, existencia_atual
)

-- Histórico de inseminações
inseminacoes (
  id, garanhao, dono_id, 
  data_inseminacao, egua, protocolo, palhetas_gastas
)
```

---

## 🧪 Dados de Teste

O script `criar_banco.sql` já inclui dados de teste:

- **3 Donos:** Embriovet, André, Filipe
- **2 Lotes de Sémen:** Retoque do André (50 palhetas) + Retoque do Filipe (60 palhetas)

---

## ✅ Correções Aplicadas (v2.0)

Esta versão corrige **8 problemas críticos** da versão anterior:

1. ✅ **Segurança:** Credenciais hardcoded → Agora usa `.env`
2. ✅ **Bug:** `st.experimental_rerun()` deprecated → Corrigido
3. ✅ **Performance:** Gestão de conexões → Padronizado com pool
4. ✅ **Estabilidade:** Tratamento de erros → Implementado
5. ✅ **Validação:** Dados não validados → Validações completas
6. ✅ **Dependências:** requirements.txt incompleto → Corrigido
7. ✅ **Bug:** Problema no Pandas index → Resolvido
8. ✅ **UX:** Interface confusa → Melhorada com resumos visuais

Veja detalhes em: [CORRECOES_APLICADAS.md](CORRECOES_APLICADAS.md)

---

## 🆘 Solução de Problemas

### Erro: "ModuleNotFoundError"
```bash
pip install streamlit pandas psycopg2-binary python-dotenv
```

### Erro: "could not connect to server"
PostgreSQL não está rodando. Inicie o serviço:
- **Windows:** Serviços → PostgreSQL → Iniciar
- **macOS:** `brew services start postgresql@15`
- **Linux:** `sudo systemctl start postgresql`

### Erro: "password authentication failed"
Edite `.env` e configure a senha correta do PostgreSQL.

### Erro: "relation 'dono' does not exist"
Execute o script SQL:
```bash
psql -U postgres -d embriovet -f criar_banco.sql
```

---

## 🔒 Segurança

⚠️ **IMPORTANTE:**
- Nunca commite o arquivo `.env` com senhas reais
- Use senhas fortes em produção
- Configure firewall do PostgreSQL adequadamente
- Faça backups regulares do banco de dados

---

## 💾 Backup

```bash
# Fazer backup
pg_dump -U postgres embriovet > backup_$(date +%Y%m%d).sql

# Restaurar backup
psql -U postgres embriovet < backup_20250202.sql
```

---

## 🛠️ Tecnologias

- **Python 3.11+** - Linguagem principal
- **Streamlit 1.53+** - Framework web
- **PostgreSQL 15+** - Banco de dados
- **Pandas 2.0+** - Manipulação de dados
- **psycopg2** - Driver PostgreSQL
- **python-dotenv** - Gestão de variáveis de ambiente

---

## 📊 Estrutura do Projeto

```
embriovet-gestor/
├── app.py                              # Aplicação principal
├── requirements_streamlit.txt          # Dependências Python
├── .env                                # Configurações (NÃO commitado)
├── .gitignore                          # Arquivos ignorados pelo Git
├── criar_banco.sql                     # Script de criação do banco
├── README.md                           # Este arquivo
├── LEIA_ME_PRIMEIRO.md                # Guia de início rápido
├── INSTRUCOES_INSTALACAO_LOCAL.md     # Instalação detalhada
├── GUIA_RAPIDO.md                     # Como usar
├── GUIA_MULTIPLOS_DONOS.md            # Caso de uso especial
└── CORRECOES_APLICADAS.md             # Histórico de correções
```

---

## 📝 Licença

Sistema proprietário - Embriovet © 2025

---

## 👨‍💻 Autor

**André Conde Costa**
- GitHub: [@Andrecondecosta](https://github.com/Andrecondecosta)

---

## 🎉 Status do Projeto

**Versão:** 2.0  
**Data:** Fevereiro 2025  
**Status:** ✅ Produção - Totalmente funcional e testado

---

## 🚀 Próximos Passos (Roadmap)

- [ ] Transferência parcial de palhetas
- [ ] Histórico de transferências em aba dedicada
- [ ] Alertas de estoque baixo
- [ ] Sistema de reservas
- [ ] Export de relatórios (PDF/Excel)
- [ ] Dashboard com gráficos
- [ ] Autenticação de usuários
- [ ] Backup automático

---

## 💬 Contribuições

Este é um projeto proprietário. Para sugestões ou report de bugs, abra uma issue.

---

**Desenvolvido com ❤️ para a comunidade veterinária equina**
