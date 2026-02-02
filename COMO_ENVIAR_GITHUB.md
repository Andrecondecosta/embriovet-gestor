# 📤 GUIA: Como Enviar para o GitHub

## 🎯 Objetivo

Enviar o código corrigido para o seu repositório GitHub: `https://github.com/Andrecondecosta/embriovet-gestor`

---

## 📋 Arquivos que Deve Enviar

### ✅ **ARQUIVOS PRINCIPAIS (Obrigatórios):**

```
embriovet-gestor/
├── app.py                              ✅ SUBSTITUIR
├── requirements_streamlit.txt          ✅ SUBSTITUIR  
├── .env                                ✅ ADICIONAR (mas não commitá-lo!)
├── .gitignore                          ✅ ADICIONAR
├── criar_banco.sql                     ✅ ADICIONAR
└── README.md                           ✅ SUBSTITUIR
```

### ✅ **DOCUMENTAÇÃO (Recomendado):**

```
├── LEIA_ME_PRIMEIRO.md                ✅ ADICIONAR
├── INSTRUCOES_INSTALACAO_LOCAL.md     ✅ ADICIONAR
├── GUIA_RAPIDO.md                     ✅ ADICIONAR
├── GUIA_MULTIPLOS_DONOS.md            ✅ ADICIONAR
└── CORRECOES_APLICADAS.md             ✅ ADICIONAR
```

### ❌ **ARQUIVOS QUE DEVE REMOVER:**

```
❌ app_drive.py                 (código antigo)
❌ importar_csvs.py             (código antigo)
❌ importar_csvs_novo.py        (código antigo)
❌ INSTRUCOES_DEPLOY.txt        (instruções antigas)
❌ base_stock_inicial.csv       (não é mais necessário)
❌ inseminacoes_iniciais.csv    (não é mais necessário)
```

---

## 🚀 PASSO A PASSO

### **OPÇÃO 1: Substituição Limpa (Recomendado)**

Este método cria uma estrutura limpa no GitHub.

#### 1. **No seu computador, vá para a pasta do projeto:**

```bash
cd /caminho/para/embriovet-gestor
```

#### 2. **Faça backup dos arquivos antigos:**

```bash
mkdir backup_antigo
mv *.py backup_antigo/
mv *.csv backup_antigo/
mv *.txt backup_antigo/
```

#### 3. **Copie os arquivos corrigidos:**

Copie todos os arquivos da pasta `github_release` para a raiz do projeto:

```bash
# Copie todos estes arquivos para a pasta do seu projeto:
app.py
requirements_streamlit.txt
.env
.gitignore
criar_banco.sql
README.md
LEIA_ME_PRIMEIRO.md
INSTRUCOES_INSTALACAO_LOCAL.md
GUIA_RAPIDO.md
GUIA_MULTIPLOS_DONOS.md
CORRECOES_APLICADAS.md
```

#### 4. **Edite o .env (IMPORTANTE!):**

⚠️ **NÃO commite senhas reais!**

Edite `.env` e coloque valores genéricos:

```bash
# Database Configuration
DB_NAME=embriovet
DB_USER=postgres
DB_PASSWORD=sua_senha_aqui   # ⚠️ Deixe genérico!
DB_HOST=localhost
DB_PORT=5432

# App Configuration
APP_TITLE=Gestor de Sémen - Embriovet
APP_LAYOUT=wide
```

#### 5. **Verificar o que vai ser commitado:**

```bash
git status
```

Deve mostrar:
```
modified:   app.py
modified:   requirements_streamlit.txt
modified:   README.md
new file:   .gitignore
new file:   .env
new file:   criar_banco.sql
new file:   LEIA_ME_PRIMEIRO.md
new file:   INSTRUCOES_INSTALACAO_LOCAL.md
new file:   GUIA_RAPIDO.md
new file:   GUIA_MULTIPLOS_DONOS.md
new file:   CORRECOES_APLICADAS.md
```

#### 6. **Adicionar arquivos ao Git:**

```bash
# Adicionar todos os arquivos novos e modificados
git add app.py
git add requirements_streamlit.txt
git add criar_banco.sql
git add .gitignore
git add README.md
git add LEIA_ME_PRIMEIRO.md
git add INSTRUCOES_INSTALACAO_LOCAL.md
git add GUIA_RAPIDO.md
git add GUIA_MULTIPLOS_DONOS.md
git add CORRECOES_APLICADAS.md

# ⚠️ NÃO adicione .env com senhas reais!
# Se quiser adicionar um .env.example:
cp .env .env.example
# Edite .env.example e remova senhas
git add .env.example
```

#### 7. **Remover arquivos antigos:**

```bash
git rm app_drive.py
git rm importar_csvs.py
git rm importar_csvs_novo.py
git rm INSTRUCOES_DEPLOY.txt
git rm base_stock_inicial.csv
git rm inseminacoes_iniciais.csv
```

#### 8. **Fazer commit:**

```bash
git commit -m "✅ v2.0 - Código corrigido e melhorado

- Corrigidos 8 bugs críticos
- Implementado suporte a múltiplos donos por garanhão
- Adicionado sistema de validações
- Melhorada segurança (credenciais em .env)
- Interface reformulada com resumos visuais
- Documentação completa adicionada
- Script SQL para criação do banco
- Testes implementados

Funcionalidades principais:
- Gestão de stock por garanhão e dono
- Registro de inseminações
- Transferências entre donos
- Relatórios e análises avançadas
- Rastreamento completo

Ver CORRECOES_APLICADAS.md para detalhes completos."
```

#### 9. **Enviar para GitHub:**

```bash
git push origin main
```

Se der erro de branch, tente:
```bash
git push origin master
```

---

### **OPÇÃO 2: Atualização Incremental**

Se preferir manter histórico completo:

```bash
# 1. Pull das últimas mudanças
git pull origin main

# 2. Copiar arquivos corrigidos
# (copie os arquivos manualmente)

# 3. Adicionar mudanças
git add -A

# 4. Commit
git commit -m "✅ v2.0 - Código corrigido"

# 5. Push
git push origin main
```

---

## ✅ **Verificar se Funcionou**

Após o push, vá até: `https://github.com/Andrecondecosta/embriovet-gestor`

Deve ver:

✅ **README.md** atualizado com badges e documentação completa  
✅ **app.py** com código corrigido  
✅ **criar_banco.sql** disponível  
✅ Todos os guias de documentação  
✅ **.gitignore** configurado  

---

## 📝 **Criar .env.example para o GitHub**

Para ajudar outros desenvolvedores, crie um arquivo de exemplo:

```bash
# Copiar .env
cp .env .env.example

# Editar e remover informações sensíveis
nano .env.example
```

Conteúdo do `.env.example`:

```bash
# Database Configuration
DB_NAME=embriovet
DB_USER=postgres
DB_PASSWORD=sua_senha_aqui
DB_HOST=localhost
DB_PORT=5432

# App Configuration
APP_TITLE=Gestor de Sémen - Embriovet
APP_LAYOUT=wide
```

Adicionar ao Git:
```bash
git add .env.example
git commit -m "Adiciona arquivo de exemplo .env"
git push origin main
```

---

## 🏷️ **Criar Release (Opcional)**

Para marcar esta versão como v2.0:

### No GitHub:

1. Vá em: `https://github.com/Andrecondecosta/embriovet-gestor/releases`
2. Clique em "Create a new release"
3. Tag: `v2.0.0`
4. Title: `Versão 2.0 - Código Corrigido`
5. Description:
   ```
   ## 🎉 Versão 2.0 - Código Completamente Corrigido
   
   ### ✅ Correções Críticas:
   - 8 bugs críticos resolvidos
   - Segurança melhorada (credenciais em .env)
   - Validações implementadas
   - Interface redesenhada
   
   ### 🚀 Novas Funcionalidades:
   - Suporte a múltiplos donos por garanhão
   - Transferências entre donos
   - Relatórios avançados com filtros
   - Pesquisa rápida
   
   ### 📖 Documentação:
   - Guias completos de instalação
   - Documentação técnica detalhada
   - Exemplos de uso
   
   Ver CORRECOES_APLICADAS.md para lista completa de mudanças.
   ```

6. Clique em "Publish release"

---

## 🔒 **IMPORTANTE: Segurança**

### ⚠️ **NUNCA commite:**

- ❌ `.env` com senhas reais
- ❌ Backups de banco de dados
- ❌ Arquivos de log
- ❌ Credenciais de produção

### ✅ **Sempre:**

- ✅ Use `.env.example` com valores genéricos
- ✅ Mantenha `.gitignore` atualizado
- ✅ Revise o que está sendo commitado com `git status`

---

## 🆘 **Problemas Comuns**

### "fatal: remote origin already exists"
```bash
git remote remove origin
git remote add origin https://github.com/Andrecondecosta/embriovet-gestor.git
```

### "Your branch is behind 'origin/main'"
```bash
git pull origin main --rebase
git push origin main
```

### "Permission denied (publickey)"
Configure SSH ou use HTTPS:
```bash
git remote set-url origin https://github.com/Andrecondecosta/embriovet-gestor.git
```

### Conflitos ao fazer pull
```bash
# Resolver conflitos manualmente, depois:
git add .
git commit -m "Resolve conflicts"
git push origin main
```

---

## 📋 **Checklist Final**

Antes de fazer push, verifique:

- [ ] `.env` não contém senhas reais
- [ ] `.gitignore` está configurado
- [ ] README.md está atualizado
- [ ] Arquivos antigos foram removidos
- [ ] Todos os guias estão incluídos
- [ ] `criar_banco.sql` está presente
- [ ] Fez commit com mensagem descritiva

---

## 🎉 **Pronto!**

Seu código corrigido agora está no GitHub!

**Próximos passos:**
1. ✅ Compartilhe o link do repositório
2. ✅ Outros podem clonar e usar
3. ✅ Mantenha atualizado com `git pull`

**Link do projeto:**  
`https://github.com/Andrecondecosta/embriovet-gestor`

---

**Dúvidas?** Consulte a documentação do Git: https://git-scm.com/doc
