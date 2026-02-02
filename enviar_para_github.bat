@echo off
REM Script para enviar código corrigido para o GitHub (Windows)
REM Execute este script na pasta do seu projeto

echo ========================================
echo   SCRIPT DE DEPLOY PARA GITHUB
echo ========================================
echo.

REM Verificar se está na pasta correta
if not exist ".git" (
    echo [ERRO] Nao encontrado repositorio Git (.git^)
    echo Execute este script na pasta raiz do projeto embriovet-gestor
    pause
    exit /b 1
)

echo [OK] Repositorio Git encontrado
echo.

REM Backup arquivos antigos
echo Fazendo backup dos arquivos antigos...
if not exist "backup_antigo" mkdir backup_antigo
move app_drive.py backup_antigo\ 2>nul
move importar_csvs.py backup_antigo\ 2>nul
move importar_csvs_novo.py backup_antigo\ 2>nul
move INSTRUCOES_DEPLOY.txt backup_antigo\ 2>nul
move *.csv backup_antigo\ 2>nul
echo [OK] Backup concluido
echo.

REM Status atual
echo Status atual do repositorio:
git status --short
echo.

REM Remover arquivos antigos do Git
echo Removendo arquivos antigos do Git...
git rm -f app_drive.py 2>nul
git rm -f importar_csvs.py 2>nul
git rm -f importar_csvs_novo.py 2>nul
git rm -f INSTRUCOES_DEPLOY.txt 2>nul
git rm -f base_stock_inicial.csv 2>nul
git rm -f inseminacoes_iniciais.csv 2>nul
echo [OK] Arquivos antigos removidos
echo.

REM Adicionar novos arquivos
echo Adicionando arquivos corrigidos...
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
echo [OK] Arquivos adicionados
echo.

REM Mostrar o que será commitado
echo Arquivos que serao commitados:
git status --short
echo.

REM Perguntar confirmação
set /p confirm="Deseja continuar com o commit? (S/N): "
if /i not "%confirm%"=="S" (
    echo [CANCELADO] Operacao cancelada
    pause
    exit /b 1
)

REM Fazer commit
echo.
echo Fazendo commit...
git commit -m "v2.0 - Codigo corrigido e melhorado - Corrigidos 8 bugs criticos - Implementado suporte a multiplos donos por garanhao - Adicionado sistema de validacoes - Melhorada seguranca (credenciais em .env) - Interface reformulada com resumos visuais - Documentacao completa adicionada - Script SQL para criacao do banco - Testes implementados"

if %errorlevel% equ 0 (
    echo [OK] Commit realizado com sucesso
) else (
    echo [ERRO] Erro ao fazer commit
    pause
    exit /b 1
)
echo.

REM Push para GitHub
set /p push="Confirma push para origin main? (S/N): "
if /i "%push%"=="S" (
    echo.
    echo Enviando para GitHub...
    git push origin main
    
    if %errorlevel% equ 0 (
        echo.
        echo ========================================
        echo           SUCESSO!
        echo ========================================
        echo.
        echo [OK] Codigo enviado para GitHub
        echo Veja em: https://github.com/Andrecondecosta/embriovet-gestor
        echo.
    ) else (
        echo.
        echo [ERRO] Erro ao fazer push
        echo Tente:
        echo   git push origin master
        echo   ou
        echo   git push origin main --force ^(se necessario^)
    )
) else (
    echo [CANCELADO] Push cancelado
    echo Voce pode fazer push manualmente depois com:
    echo   git push origin main
)

echo.
pause
