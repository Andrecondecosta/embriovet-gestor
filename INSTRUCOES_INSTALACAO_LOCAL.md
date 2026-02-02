# 🚀 INSTRUÇÕES DE INSTALAÇÃO NO SEU COMPUTADOR

## 📋 PRÉ-REQUISITOS

### 1. Instalar Python 3.11+
**Windows:**
- Baixe de: https://www.python.org/downloads/
- Durante instalação, marque "Add Python to PATH"

**macOS:**
```bash
brew install python@3.11
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install python3.11 python3.11-venv python3-pip
```

### 2. Instalar PostgreSQL

**Windows:**
- Baixe de: https://www.postgresql.org/download/windows/
- Durante instalação:
  - Senha do postgres: `123` (ou outra que você escolher)
  - Porta: `5432`

**macOS:**
```bash
brew install postgresql@15
brew services start postgresql@15
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

---

## 📥 PASSO 1: BAIXAR ARQUIVOS CORRIGIDOS

### Opção A: Substituir arquivos no seu projeto

1. Baixe estes arquivos do container:
   - `app.py` (aplicação principal corrigida)
   - `requirements_streamlit.txt` (dependências)
   - `.env` (configurações)
   - `README.md` (documentação)

2. Substitua no seu projeto local

### Opção B: Copiar diretamente (se tem acesso ao container)

```bash
# No seu computador, dentro da pasta do projeto:
# Copie os arquivos corrigidos
cp /caminho/do/container/app/app.py ./
cp /caminho/do/container/app/requirements_streamlit.txt ./
cp /caminho/do/container/app/.env ./
```

---

## 🗄️ PASSO 2: CONFIGURAR POSTGRESQL

### Windows / macOS / Linux

1. **Abrir terminal/cmd e acessar PostgreSQL:**

**Windows:**
```cmd
psql -U postgres
```

**macOS/Linux:**
```bash
sudo -u postgres psql
```

2. **Criar banco de dados e tabelas:**

```sql
-- Criar banco
CREATE DATABASE embriovet;

-- Conectar ao banco
\c embriovet

-- Criar tabela de donos
CREATE TABLE dono (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    contato VARCHAR(255),
    email VARCHAR(255)
);

-- Criar tabela de estoque
CREATE TABLE estoque_dono (
    id SERIAL PRIMARY KEY,
    garanhao VARCHAR(255) NOT NULL,
    dono_id INTEGER REFERENCES dono(id),
    data_embriovet VARCHAR(100),
    origem_externa VARCHAR(255),
    palhetas_produzidas INTEGER,
    qualidade NUMERIC(5,2),
    concentracao NUMERIC(10,2),
    motilidade NUMERIC(5,2),
    local_armazenagem VARCHAR(255),
    certificado VARCHAR(10),
    dose VARCHAR(100),
    observacoes TEXT,
    quantidade_inicial INTEGER,
    existencia_atual INTEGER
);

-- Criar tabela de inseminações
CREATE TABLE inseminacoes (
    id SERIAL PRIMARY KEY,
    garanhao VARCHAR(255) NOT NULL,
    dono_id INTEGER REFERENCES dono(id),
    data_inseminacao DATE,
    egua VARCHAR(255),
    protocolo VARCHAR(255),
    palhetas_gastas INTEGER
);

-- Inserir donos de exemplo
INSERT INTO dono (nome, contato, email) VALUES 
    ('Embriovet', '00000000', 'embriovet@embriovet.pt'),
    ('André', '912345678', 'andre@example.com'),
    ('Filipe', '913456789', 'filipe@example.com');

-- Inserir stock de exemplo (Retoque)
INSERT INTO estoque_dono (
    garanhao, dono_id, data_embriovet, 
    palhetas_produzidas, qualidade, concentracao, motilidade,
    local_armazenagem, certificado, dose, observacoes,
    quantidade_inicial, existencia_atual
) VALUES 
    ('Retoque', 2, '2025-01-15', 50, 85.0, 250.0, 75.0,
     'Tanque A', 'Sim', '1 dose', 'Sémen do André', 50, 50),
    ('Retoque', 3, '2025-01-20', 60, 88.0, 260.0, 78.0,
     'Tanque B', 'Sim', '1 dose', 'Sémen do Filipe', 60, 60);

-- Sair
\q
```

---

## 🔧 PASSO 3: CONFIGURAR .ENV

Edite o arquivo `.env` no seu projeto:

```bash
# Database Configuration
DB_NAME=embriovet
DB_USER=postgres
DB_PASSWORD=123          # ⚠️ Use a senha que você definiu na instalação!
DB_HOST=localhost
DB_PORT=5432

# App Configuration
APP_TITLE=Gestor de Sémen - Embriovet
APP_LAYOUT=wide
```

**⚠️ IMPORTANTE:** Se você usou senha diferente de `123` no PostgreSQL, altere aqui!

---

## 📦 PASSO 4: INSTALAR DEPENDÊNCIAS PYTHON

No terminal, dentro da pasta do projeto:

**Windows:**
```cmd
python -m venv venv
venv\Scripts\activate
pip install -r requirements_streamlit.txt
```

**macOS/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements_streamlit.txt
```

---

## 🚀 PASSO 5: EXECUTAR APLICAÇÃO

Com o ambiente virtual ativado:

```bash
streamlit run app.py
```

**Deve aparecer:**
```
You can now view your Streamlit app in your browser.
Local URL: http://localhost:8501
```

Abra o navegador em: **http://localhost:8501**

---

## ✅ PASSO 6: TESTAR

1. **Ver Estoque:**
   - Menu: "📦 Ver Estoque"
   - Selecione: "Retoque"
   - Deve mostrar:
     - André: 50 palhetas
     - Filipe: 60 palhetas

2. **Adicionar Stock:**
   - Menu: "➕ Adicionar Stock"
   - Preencha dados de teste
   - Verifique se aparece no estoque

3. **Registrar Inseminação:**
   - Menu: "📝 Registrar Inseminação"
   - Selecione garanhão
   - Escolha de qual dono usar
   - Registre

4. **Ver Relatórios:**
   - Menu: "📈 Relatórios"
   - Pesquise por garanhão ou dono

---

## 🆘 PROBLEMAS COMUNS

### Erro: "ModuleNotFoundError: No module named 'streamlit'"
**Solução:**
```bash
pip install streamlit
```

### Erro: "could not connect to server"
**Solução:**
1. Verifique se PostgreSQL está rodando:
   - **Windows:** Serviços → PostgreSQL
   - **macOS:** `brew services list`
   - **Linux:** `sudo systemctl status postgresql`

2. Se não estiver, inicie:
   - **Windows:** Inicie o serviço manualmente
   - **macOS:** `brew services start postgresql@15`
   - **Linux:** `sudo systemctl start postgresql`

### Erro: "password authentication failed"
**Solução:**
- Edite `.env` e coloque a senha correta do PostgreSQL

### Erro: "relation 'dono' does not exist"
**Solução:**
- Execute novamente os comandos SQL do PASSO 2

### Aplicação não abre no navegador
**Solução:**
- Abra manualmente: http://localhost:8501
- Ou tente: http://127.0.0.1:8501

---

## 📚 DOCUMENTAÇÃO

Após instalação, consulte:
- `README.md` - Documentação completa
- `GUIA_RAPIDO.md` - Como usar o sistema
- `GUIA_MULTIPLOS_DONOS.md` - Como funciona múltiplos donos
- `CORRECOES_APLICADAS.md` - O que foi corrigido

---

## 🔄 BACKUP

Para fazer backup do banco:

**Windows:**
```cmd
pg_dump -U postgres embriovet > backup.sql
```

**macOS/Linux:**
```bash
pg_dump -U postgres embriovet > backup.sql
```

Para restaurar:
```bash
psql -U postgres embriovet < backup.sql
```

---

## 📞 SUPORTE

Se continuar com problemas, envie:
1. Sistema operativo (Windows/macOS/Linux)
2. Mensagem de erro completa
3. Output do comando: `pip list | grep streamlit`
4. Output do comando: `psql --version`

**Email:** [seu email de suporte]

---

**Versão:** 2.0  
**Data:** Fevereiro 2025  
**Status:** ✅ Testado e funcional
