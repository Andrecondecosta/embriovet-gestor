#!/bin/bash
# Script para enviar código corrigido para o GitHub
# Execute este script na pasta do seu projeto

echo "🚀 SCRIPT DE DEPLOY PARA GITHUB"
echo "================================"
echo ""

# Verificar se está na pasta correta
if [ ! -d ".git" ]; then
    echo "❌ ERRO: Não encontrado repositório Git (.git)"
    echo "Execute este script na pasta raiz do projeto embriovet-gestor"
    exit 1
fi

echo "✅ Repositório Git encontrado"
echo ""

# Backup arquivos antigos
echo "📦 Fazendo backup dos arquivos antigos..."
mkdir -p backup_antigo
mv app_drive.py backup_antigo/ 2>/dev/null
mv importar_csvs.py backup_antigo/ 2>/dev/null
mv importar_csvs_novo.py backup_antigo/ 2>/dev/null
mv INSTRUCOES_DEPLOY.txt backup_antigo/ 2>/dev/null
mv *.csv backup_antigo/ 2>/dev/null
echo "✅ Backup concluído"
echo ""

# Status atual
echo "📋 Status atual do repositório:"
git status --short
echo ""

# Remover arquivos antigos do Git
echo "🗑️  Removendo arquivos antigos do Git..."
git rm -f app_drive.py 2>/dev/null
git rm -f importar_csvs.py 2>/dev/null
git rm -f importar_csvs_novo.py 2>/dev/null
git rm -f INSTRUCOES_DEPLOY.txt 2>/dev/null
git rm -f base_stock_inicial.csv 2>/dev/null
git rm -f inseminacoes_iniciais.csv 2>/dev/null
echo "✅ Arquivos antigos removidos"
echo ""

# Adicionar novos arquivos
echo "➕ Adicionando arquivos corrigidos..."
git add app.py
git add requirements_streamlit.txt
git add criar_banco.sql
git add .gitignore
git add .env.example
git add README.md
git add LEIA_ME_PRIMEIRO.md
git add INSTRUCOES_INSTALACAO_LOCAL.md
git add GUIA_RAPIDO.md
git add GUIA_MULTIPLOS_DONOS.md
git add CORRECOES_APLICADAS.md
git add COMO_ENVIAR_GITHUB.md
echo "✅ Arquivos adicionados"
echo ""

# Mostrar o que será commitado
echo "📋 Arquivos que serão commitados:"
git status --short
echo ""

# Perguntar confirmação
read -p "❓ Deseja continuar com o commit? (s/n): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Ss]$ ]]; then
    echo "❌ Operação cancelada"
    exit 1
fi

# Fazer commit
echo "💾 Fazendo commit..."
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

if [ $? -eq 0 ]; then
    echo "✅ Commit realizado com sucesso"
else
    echo "❌ Erro ao fazer commit"
    exit 1
fi
echo ""

# Push para GitHub
echo "🚀 Enviando para GitHub..."
read -p "❓ Confirma push para origin main? (s/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Ss]$ ]]; then
    git push origin main
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "🎉 ================================"
        echo "🎉 SUCESSO!"
        echo "🎉 ================================"
        echo ""
        echo "✅ Código enviado para GitHub"
        echo "🌐 Veja em: https://github.com/Andrecondecosta/embriovet-gestor"
        echo ""
    else
        echo ""
        echo "❌ Erro ao fazer push"
        echo "💡 Tente:"
        echo "   git push origin master"
        echo "   ou"
        echo "   git push origin main --force (se necessário)"
    fi
else
    echo "❌ Push cancelado"
    echo "💡 Você pode fazer push manualmente depois com:"
    echo "   git push origin main"
fi
