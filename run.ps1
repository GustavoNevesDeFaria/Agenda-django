param (
    [string]$Action
)

$PYTHON = "venv/Scripts/python.exe"
$MANAGE = "$PYTHON manage.py"

function Show-Help {
    Write-Host "Comandos disponíveis:" -ForegroundColor Cyan
    Write-Host "  ./run.ps1 create_contacts  - Gera contatos ficticios usando o script utils/create_contact.py"
    Write-Host "  ./run.ps1 run              - Inicia o servidor de desenvolvimento"
    Write-Host "  ./run.ps1 migrate          - Aplica as migracoes no banco de dados"
    Write-Host "  ./run.ps1 shell            - Abre o shell interativo do Django"
}

if (-not $Action) {
    Show-Help
    exit
}

switch ($Action) {
    "create_contacts" { & $PYTHON utils/create_contact.py }
    "run" { & $PYTHON manage.py runserver }
    "migrate" { & $PYTHON manage.py migrate }
    "shell" { & $PYTHON manage.py shell }
    default { 
        Write-Host "Comando desconhecido: $Action" -ForegroundColor Red
        Show-Help 
    }
}
