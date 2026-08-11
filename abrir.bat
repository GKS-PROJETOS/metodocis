@echo off
REM Abre a pagina servida em http, que e o unico jeito de o player do YouTube
REM rodar dentro do site. Aberta direto do disco (file://) o YouTube recusa o
REM embed e mostra "Erro 153".
REM Deixe esta janela aberta enquanto estiver usando o site. Para encerrar,
REM feche a janela ou aperte Ctrl+C.

cd /d "%~dp0"
title Metodo CIS - servidor local (nao feche enquanto usar o site)

where python >nul 2>nul
if errorlevel 1 (
  echo.
  echo  Python nao foi encontrado no PATH.
  echo  Instale em https://python.org ou abra a pagina por outro servidor local.
  echo.
  pause
  exit /b 1
)

echo.
echo  Servindo em http://localhost:8760
echo  Abrindo o navegador...
echo.

start "" http://localhost:8760/
python -m http.server 8760
