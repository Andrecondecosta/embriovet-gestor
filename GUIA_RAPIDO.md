# 🚀 GUIA RÁPIDO DE USO - Embriovet Gestor

## 🌐 Acesso ao Sistema

**URL da Aplicação:** http://localhost:8501

---

## 📱 FUNCIONALIDADES PRINCIPAIS

### 1️⃣ 📦 VER ESTOQUE

**Como usar:**
1. No menu lateral, selecione "📦 Ver Estoque"
2. Escolha um garanhão no filtro
3. Veja todos os lotes disponíveis com detalhes:
   - Local de armazenagem
   - Certificado
   - Qualidade, concentração, motilidade
   - Dono atual

**Alterar Dono:**
- Dentro de cada lote, você pode alterar o dono
- Selecione o novo dono no dropdown
- Clique em "💾 Atualizar Dono"

---

### 2️⃣ ➕ ADICIONAR STOCK

**Como usar:**
1. No menu lateral, selecione "➕ Adicionar Stock"
2. Preencha o formulário:
   - **Garanhão*** (obrigatório)
   - **Dono do Sémen*** (obrigatório)
   - **Palhetas Produzidas*** (obrigatório, deve ser > 0)
   - Data de Produção
   - Origem Externa
   - Qualidade (%)
   - Concentração (milhões/mL)
   - Motilidade (%)
   - Local Armazenagem
   - Certificado (Sim/Não)
   - Dose
   - Observações

3. Clique em "💾 Salvar"

**Validações automáticas:**
- ✅ Verifica se garanhão foi preenchido
- ✅ Verifica se número de palhetas é positivo
- ✅ Impede valores negativos

---

### 3️⃣ 📝 REGISTRAR INSEMINAÇÃO

**Como usar:**
1. No menu lateral, selecione "📝 Registrar Inseminação"
2. Selecione o **Garanhão**
3. Selecione o **Lote** (mostra dono e estoque disponível)
4. Preencha:
   - **Data de Inseminação**
   - **Nome da Égua*** (obrigatório)
   - **Palhetas utilizadas** (não pode exceder estoque)

5. Clique em "📝 Registrar Inseminação"

**O que acontece:**
- ✅ Inseminação registrada no histórico
- ✅ Estoque automaticamente reduzido
- ✅ Validação de estoque insuficiente

---

### 4️⃣ 📈 RELATÓRIOS

**Como usar:**
1. No menu lateral, selecione "📈 Relatórios"
2. Veja estatísticas gerais:
   - Total de inseminações
   - Total de palhetas gastas
   - Garanhões utilizados

3. Use filtros:
   - Filtrar por Garanhão
   - Filtrar por Dono

4. Visualize tabela completa com:
   - Garanhão
   - Dono
   - Data
   - Égua
   - Protocolo
   - Palhetas gastas

---

## 🛠️ ADMINISTRAÇÃO

### Verificar Status dos Serviços

```bash
# Ver todos os serviços
sudo supervisorctl status

# Ver apenas Streamlit
sudo supervisorctl status streamlit

# Ver PostgreSQL
sudo service postgresql status
```

### Reiniciar Serviços

```bash
# Reiniciar Streamlit
sudo supervisorctl restart streamlit

# Reiniciar PostgreSQL
sudo service postgresql restart
```

### Ver Logs

```bash
# Logs do Streamlit
tail -f /var/log/supervisor/streamlit.out.log
tail -f /var/log/supervisor/streamlit.err.log

# Logs do PostgreSQL
tail -f /var/log/postgresql/postgresql-15-main.log
```

### Backup do Banco de Dados

```bash
# Fazer backup
sudo -u postgres pg_dump embriovet > /app/backup_$(date +%Y%m%d).sql

# Restaurar backup
sudo -u postgres psql embriovet < /app/backup_20250202.sql
```

---

## 🔧 MANUTENÇÃO

### Adicionar Novo Dono (via SQL)

```bash
sudo -u postgres psql -d embriovet

# No psql:
INSERT INTO dono (nome, contato, email) 
VALUES ('Nome do Novo Dono', '999999999', 'email@example.com');
```

### Limpar Dados de Teste

```bash
sudo -u postgres psql -d embriovet

# Cuidado! Isso apaga todos os dados:
TRUNCATE TABLE inseminacoes, estoque_dono RESTART IDENTITY CASCADE;
```

### Ver Estatísticas do Banco

```bash
sudo -u postgres psql -d embriovet

# Total de stock por garanhão:
SELECT garanhao, SUM(existencia_atual) as total_palhetas
FROM estoque_dono
GROUP BY garanhao
ORDER BY total_palhetas DESC;

# Inseminações por mês:
SELECT DATE_TRUNC('month', data_inseminacao) as mes, 
       COUNT(*) as total_inseminacoes,
       SUM(palhetas_gastas) as total_palhetas
FROM inseminacoes
GROUP BY mes
ORDER BY mes DESC;
```

---

## 🆘 SOLUÇÃO DE PROBLEMAS COMUNS

### Problema: "Erro de conexão com banco de dados"

**Solução:**
```bash
# 1. Verificar se PostgreSQL está rodando
sudo service postgresql status

# 2. Se não estiver, iniciar:
sudo service postgresql start

# 3. Verificar credenciais no .env
cat /app/.env
```

### Problema: "Aplicação não carrega"

**Solução:**
```bash
# 1. Verificar status do Streamlit
sudo supervisorctl status streamlit

# 2. Ver logs de erro
tail -20 /var/log/supervisor/streamlit.err.log

# 3. Reiniciar se necessário
sudo supervisorctl restart streamlit
```

### Problema: "Stock não atualiza após inseminação"

**Possíveis causas:**
- Erro no banco de dados (ver logs)
- Transaction não commitada
- Cache do navegador (fazer F5)

**Solução:**
```bash
# Verificar logs
tail -20 /var/log/supervisor/streamlit.err.log

# Verificar dados no banco
sudo -u postgres psql -d embriovet -c "SELECT * FROM estoque_dono;"
```

---

## 📞 CONTATOS DE SUPORTE

Para suporte técnico:
- 📧 Email: suporte@embriovet.pt
- 📱 Telefone: [adicionar telefone]
- 🌐 Website: https://embriovet.pt

---

## 📚 DOCUMENTAÇÃO ADICIONAL

- **README.md** - Documentação completa do sistema
- **CORRECOES_APLICADAS.md** - Relatório de todas as correções
- **/app/.env** - Configurações do sistema
- **/app/test_sistema.py** - Script de testes automatizados

---

**Versão:** 2.0  
**Última atualização:** Fevereiro 2025  
**Status:** ✅ Sistema operacional e testado
