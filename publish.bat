@echo off
setlocal

cd /d "%~dp0"

echo ==========================================
echo RozBot Website Publish Script
echo ==========================================
echo.
echo Current branch:
git branch --show-current
echo.
echo Current status:
git status --short
echo.

set /p MSG=Commit message (leave blank for default): 
if "%MSG%"=="" set MSG=Update website content

echo.
echo Staging files...
git add .

echo.
echo Creating commit...
git commit -m "%MSG%"
if errorlevel 1 (
  echo.
  echo No new commit created - possibly no file changes.
)

echo.
echo Pushing to GitHub...
git push
if errorlevel 1 (
  echo.
  echo Push failed. Resolve any git errors and run again.
  pause
  exit /b 1
)

echo.
echo Publish complete.
echo GitHub Pages will auto-rebuild from main.
echo.
echo Live site:
echo https://rozbot420.github.io/RozBot-Website/
echo.
pause
