# 🚀 GUIA COMPLETO: Push → Pull → VS Code

## ✅ STATUS ATUAL

**Commit criado com sucesso!**
- ✅ 14 arquivos prontos para push
- ✅ Localização: `/tmp/embriovet_clean`
- ✅ Branch: `main`
- ✅ Commit: "v2.0 - Código corrigido e melhorado"

---

## 📤 PARTE 1: FAZER PUSH PARA O GITHUB (NO CONTAINER)

### Você precisa fazer isso AQUI no container/terminal atual:

```bash
cd /tmp/embriovet_clean

# Adicionar remote do seu GitHub
git remote add origin https://github.com/Andrecondecosta/embriovet-gestor.git

# Fazer push (você vai precisar do seu token/senha do GitHub)
git push -u origin main --force
```

### 🔐 **Autenticação GitHub:**

Quando pedir credenciais:
- **Username:** Andrecondecosta
- **Password:** Use um **Personal Access Token** (não a senha normal!)

**Como criar token:**
1. Va em: https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Selecione: `repo` (todos os checkboxes)
4. Click "Generate token"
5. **COPIE O TOKEN** (só aparece uma vez!)
6. Use esse token como senha

---

## 📥 PARTE 2: FAZER PULL NO SEU COMPUTADOR

### 1. **Abrir Terminal/CMD no seu computador**

**Windows:** CMD ou PowerShell  
**Mac/Linux:** Terminal

### 2. **Ir para onde quer o projeto**

```bash
cd C:\Users\SeuNome\Documents\Projetos
# ou
cd ~/Documents/Projetos
```

### 3. **Clonar o repositório**

```bash
git clone https://github.com/Andrecondecosta/embriovet-gestor.git
cd embriovet-gestor
```

**OU se já tem a pasta:**

```bash
cd embriovet-gestor
git pull origin main
```

---

## 💻 PARTE 3: CONFIGURAR NO VS CODE

### 1. **Abrir projeto no VS Code**

```bash
cd embriovet-gestor
code .
```

Ou abra VS Code → File → Open Folder → Selecione `embriovet-gestor`

### 2. **Instalar Extensões Recomendadas**

No VS Code, instale:
- ✅ **Python** (Microsoft)
- ✅ **Pylance** (Microsoft)  
- ✅ **GitLens** (para Git)
- ✅ **PostgreSQL** (Chris Kolkman) - opcional

### 3. **Criar Ambiente Virtual Python**

**No terminal integrado do VS Code (Ctrl+`):**

**Windows:**
```cmd
python -m venv venv
venv\Scripts\activate
```

**Mac/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
```

### 4. **Instalar Dependências**

```bash
pip install -r requirements_streamlit.txt
```

### 5. **Configurar .env**

Crie arquivo `.env` (copie do .env.example):

```bash
cp .env.example .env
```

Edite `.env` com suas credenciais:

```bash
DB_NAME=embriovet
DB_USER=postgres
DB_PASSWORD=sua_senha_real
DB_HOST=localhost
DB_PORT=5432
```

### 6. **Configurar PostgreSQL Local**

#### Windows:
- Instale: https://www.postgresql.org/download/windows/
- Inicie o serviço PostgreSQL

#### Mac:
```bash
brew install postgresql@15
brew services start postgresql@15
```

#### Linux:
```bash
sudo apt install postgresql
sudo systemctl start postgresql
```

#### Criar Banco de Dados:
```bash
psql -U postgres
CREATE DATABASE embriovet;
\c embriovet
\i criar_banco.sql
\q
```

### 7. **Executar Aplicação**

No terminal do VS Code:

```bash
streamlit run app.py
```

Abre automaticamente em: http://localhost:8501

---

## 🛠️ CONFIGURAÇÃO DO VS CODE (Settings.json)

### Criar `.vscode/settings.json`:

```json
{
  "python.defaultInterpreterPath": "${workspaceFolder}/venv/bin/python",
  "python.terminal.activateEnvironment": true,
  "python.linting.enabled": true,
  "python.linting.pylintEnabled": true,
  "python.formatting.provider": "black",
  "editor.formatOnSave": true,
  "files.exclude": {
    "**/__pycache__": true,
    "**/*.pyc": true,
    "**/.pytest_cache": true
  }
}
```

---

## 🔄 WORKFLOW DE DESENVOLVIMENTO

### **Fazer mudanças e commitar:**

```bash
# 1. Fazer mudanças no código

# 2. Ver o que mudou
git status

# 3. Adicionar mudanças
git add .

# 4. Commit
git commit -m "Descrição das mudanças"

# 5. Push para GitHub
git push origin main

# 6. No container, fazer pull para atualizar
git pull origin main
```

### **Atualizar do GitHub (se alguém fez mudanças):**

```bash
git pull origin main
```

---

## 🚀 ATALHOS DO VS CODE

| Atalho | Ação |
|--------|------|
| `Ctrl + `  | Abrir terminal |
| `Ctrl + P` | Buscar arquivo |
| `Ctrl + Shift + F` | Buscar em todos arquivos |
| `F5` | Debug (se configurar) |
| `Ctrl + /` | Comentar linha |
| `Ctrl + D` | Selecionar próxima ocorrência |

---

## 🧪 TESTAR NO VS CODE

### 1. **Teste Rápido:**

```bash
# No terminal do VS Code
python -c "import streamlit; print('Streamlit OK!')"
```

### 2. **Rodar aplicação:**

```bash
streamlit run app.py
```

### 3. **Testar banco de dados:**

```bash
python
>>> import psycopg2
>>> conn = psycopg2.connect("dbname=embriovet user=postgres password=sua_senha")
>>> print("DB OK!")
```

---

## 📦 ESTRUTURA NO VS CODE

```
embriovet-gestor/          <- Pasta raiz
├── .vscode/
│   └── settings.json      <- Configurações do VS Code
├── venv/                  <- Ambiente virtual Python
├── .env                   <- Suas credenciais (NÃO commitar!)
├── .gitignore            
├── app.py                 <- Arquivo principal
├── requirements_streamlit.txt
├── criar_banco.sql
└── README.md
```

---

## 🔍 DEBUG NO VS CODE

### Criar `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Python: Streamlit",
      "type": "python",
      "request": "launch",
      "module": "streamlit",
      "args": [
        "run",
        "app.py"
      ],
      "console": "integratedTerminal"
    }
  ]
}
```

Agora pode usar F5 para debug!

---

## 🆘 PROBLEMAS COMUNS

### **"Python not found"**
```bash
# Windows: Instale Python de python.org
# Mac: brew install python
# Linux: sudo apt install python3
```

### **"pip not found"**
```bash
python -m pip install --upgrade pip
```

### **"streamlit not found"**
```bash
pip install streamlit
```

### **"psycopg2 install failed"**
```bash
# Windows:
pip install psycopg2-binary

# Mac/Linux:
pip install psycopg2-binary
```

### **Porta 8501 ocupada**
```bash
streamlit run app.py --server.port 8502
```

---

## 📋 CHECKLIST FINAL

Antes de começar a trabalhar:

- [ ] Git push feito do container
- [ ] Git clone/pull feito no computador
- [ ] VS Code aberto no projeto
- [ ] Ambiente virtual criado e ativado
- [ ] Dependências instaladas
- [ ] PostgreSQL instalado e rodando
- [ ] Banco de dados criado
- [ ] .env configurado com suas credenciais
- [ ] `streamlit run app.py` funcionando
- [ ] http://localhost:8501 abrindo

---

## 🎉 PRONTO PARA DESENVOLVER!

Agora você tem:
- ✅ Código no GitHub
- ✅ Ambiente local configurado
- ✅ VS Code pronto
- ✅ Pode fazer mudanças e commitar

**Workflow:**
1. Edita código no VS Code
2. Testa com `streamlit run app.py`
3. Commit: `git commit -am "Mudança X"`
4. Push: `git push origin main`
5. No container: `git pull` para atualizar

Bom desenvolvimento! 🚀
