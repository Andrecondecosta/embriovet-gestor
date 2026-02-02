# 🐴 GUIA: Como Funciona - Múltiplos Donos para o Mesmo Garanhão

## 📖 Exemplo: Retoque com Sémen do André e do Filipe

### ✅ O QUE JÁ ESTÁ FUNCIONANDO:

O sistema **JÁ SUPORTA COMPLETAMENTE** ter o mesmo garanhão (ex: Retoque) com sémen de vários donos diferentes!

---

## 🎯 CENÁRIO ATUAL (Dados de Teste Criados):

### **Garanhão: RETOQUE**

| Dono   | Palhetas | Local    | Status |
|--------|----------|----------|--------|
| André  | 45       | Tanque A | ✅ Ativo |
| Filipe | 60       | Tanque B | ✅ Ativo |

**Total Retoque:** 105 palhetas (divididas entre 2 donos)

---

## 📦 1. VER ESTOQUE - Como Funciona

### Quando pesquisar "Retoque":

1. **Resumo por Dono** (no topo):
   ```
   👤 André: 45 palhetas
   👤 Filipe: 60 palhetas
   ```

2. **Lotes Detalhados** (expandíveis):
   ```
   📦 2025-01-15 — André — 45 palhetas
      📍 Local: Tanque A
      ✨ Qualidade: 85%
      🔄 Pode transferir para outro dono
   
   📦 2025-01-20 — Filipe — 60 palhetas
      📍 Local: Tanque B
      ✨ Qualidade: 88%
      🔄 Pode transferir para outro dono
   ```

**📌 IMPORTANTE:** Cada lote mostra claramente DE QUEM é o sémen!

---

## 📝 2. REGISTRAR INSEMINAÇÃO - Como Funciona

### Quando vai usar sémen do Retoque:

1. **Seleciona o Garanhão:** Retoque

2. **Sistema mostra resumo:**
   ```
   📊 Sémen Disponível por Dono
   👤 André: 45 palhetas
   👤 Filipe: 60 palhetas
   ```

3. **Seleciona DE QUAL DONO quer usar:**
   ```
   🎯 Selecionar Lote (DE QUAL DONO)
   
   Opções:
   ○ 👤 André | 📦 2025-01-15 | 📍 Tanque A (45 palhetas)
   ○ 👤 Filipe | 📦 2025-01-20 | 📍 Tanque B (60 palhetas)
   ```

4. **Sistema confirma:**
   ```
   🎯 Você vai usar sémen do André | Disponível: 45 palhetas
   ```

5. **Preenche os dados:**
   - Data: 02/02/2025
   - Égua: Maria
   - Palhetas: 5

6. **Registra:**
   ```
   ✅ Inseminação registrada! 
   Usado sémen do André (5 palhetas)
   ```

**📌 RESULTADO:**
- Sémen do André: 45 → 40 palhetas
- Sémen do Filipe: 60 palhetas (não mexe!)

---

## 🔄 3. TRANSFERIR ENTRE DONOS - Como Funciona

### Exemplo: André quer dar 10 palhetas para Filipe

1. **Vai em "📦 Ver Estoque"**

2. **Seleciona garanhão:** Retoque

3. **Abre o lote do André:**
   ```
   📦 2025-01-15 — André — 45 palhetas
   ```

4. **Na seção "🔄 Transferir Dono":**
   - Seleciona: Filipe (no dropdown)
   - Clica: "🔄 Transferir para Novo Dono"

5. **Sistema transfere:**
   ```
   ✅ 45 palhetas transferidas de André para Filipe!
   ```

**📌 RESULTADO:**
- Sémen do André: 45 → 0 palhetas (lote transferido)
- Sémen do Filipe: 60 → 105 palhetas (recebeu lote)

**⚠️ NOTA:** A transferência move o LOTE INTEIRO. Se quiser transferir apenas parte, precisa:
1. Primeiro usar as palhetas que NÃO vai transferir
2. Depois transferir o que sobrar

OU (melhor): Criar funcionalidade de "transferência parcial" (ver seção Melhorias abaixo)

---

## 📈 4. RELATÓRIOS - Como Funciona

### Quando pesquisar histórico do Retoque:

1. **Consumo por Garanhão e Dono:**
   ```
   | Garanhão | Dono   | Palhetas Gastas |
   |----------|--------|-----------------|
   | Retoque  | André  | 5               |
   | Retoque  | Filipe | 0               |
   ```

2. **Histórico Detalhado:**
   ```
   | Garanhão | Dono do Sémen | Data       | Égua  | Palhetas |
   |----------|---------------|------------|-------|----------|
   | Retoque  | André         | 02/02/2025 | Maria | 5        |
   ```

3. **Pesquisa Rápida:**
   - Digita "Retoque" → Mostra TODAS as inseminações do Retoque
   - Digita "André" → Mostra inseminações usando sémen do André
   - Digita "Filipe" → Mostra inseminações usando sémen do Filipe

**📌 RESULTADO:** Você consegue rastrear exatamente:
- Quanto sémen de cada dono foi usado
- Para onde foi cada palheta
- Histórico completo por garanhão E por dono

---

## ✅ RESUMO - O QUE O SISTEMA FAZ:

### ✅ Suporta múltiplos donos para o mesmo garanhão
- ✅ Retoque do André (50 palhetas)
- ✅ Retoque do Filipe (60 palhetas)

### ✅ Diferencia claramente de qual dono é o sémen
- ✅ No estoque (mostra dono em cada lote)
- ✅ Na inseminação (escolhe de qual dono usar)
- ✅ Nos relatórios (rastreia por garanhão E dono)

### ✅ Permite transferir palhetas entre donos
- ✅ André pode transferir para Filipe
- ✅ Sistema registra a mudança
- ✅ Histórico mantido

### ✅ Rastreia tudo
- ✅ Pesquisa por garanhão → Ver todos os donos
- ✅ Pesquisa por dono → Ver todos os garanhões dele
- ✅ Histórico completo de uso

---

## 🎯 TESTE AGORA!

### Dados de Teste Prontos:

Acesse: http://localhost:8501

**Já criado no sistema:**
1. **Garanhão:** Retoque
2. **Donos:**
   - André (45 palhetas em Tanque A)
   - Filipe (60 palhetas em Tanque B)
3. **Inseminação de teste:**
   - Égua Maria usando 5 palhetas do André

**Teste você mesmo:**
1. Vá em "📦 Ver Estoque" → Selecione "Retoque"
   - ✅ Deve mostrar os 2 lotes (André e Filipe)
   
2. Vá em "📝 Registrar Inseminação" → Selecione "Retoque"
   - ✅ Deve mostrar resumo dos 2 donos
   - ✅ Pode escolher usar sémen do André OU do Filipe
   
3. Vá em "📈 Relatórios"
   - ✅ Pesquise "Retoque" → Ver histórico completo
   - ✅ Pesquise "André" → Ver só inseminações do sémen dele

---

## 🚀 MELHORIAS FUTURAS (Opcional):

### 1. Transferência Parcial
Atualmente transfere o lote inteiro. Poderia adicionar:
- Transferir apenas X palhetas (dividir lote)
- Exemplo: André tem 50, transfere 20 para Filipe
  - André fica com: 30
  - Filipe recebe: +20

### 2. Histórico de Transferências
Criar aba específica para ver transferências:
- Quem transferiu para quem
- Quantas palhetas
- Quando

### 3. Alertas de Estoque Baixo
Avisar quando estoque de algum dono estiver acabando:
- "⚠️ André tem apenas 5 palhetas do Retoque"

### 4. Reservas
Permitir "reservar" palhetas para inseminações futuras:
- Bloquear X palhetas para um procedimento específico

---

## ❓ PERGUNTAS FREQUENTES

**P: Posso ter o mesmo garanhão com 3, 4 ou mais donos?**
R: ✅ Sim! Não há limite. Cada dono é um lote separado.

**P: Como adiciono mais sémen do mesmo garanhão de outro dono?**
R: Em "➕ Adicionar Stock", escolhe o garanhão (ex: Retoque) e o novo dono. Sistema cria lote separado automaticamente.

**P: O que acontece se eu usar todo o sémen de um dono?**
R: O lote fica com 0 palhetas mas permanece no sistema (histórico). Só o sémen dos outros donos fica disponível.

**P: Posso ver quanto sémen do Retoque cada dono usou historicamente?**
R: ✅ Sim! Em "📈 Relatórios" → Ver tabela "Consumo por Garanhão e Dono"

**P: Como faço backup dos dados?**
R: Use o comando:
```bash
sudo -u postgres pg_dump embriovet > backup.sql
```

---

**🎉 Sistema 100% funcional para o seu caso de uso!**

Qualquer dúvida ou necessidade de ajuste, é só avisar!
