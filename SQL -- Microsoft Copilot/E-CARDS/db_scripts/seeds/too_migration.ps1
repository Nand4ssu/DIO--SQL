# Pegar o diretorio atual
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Arquivo de saida com todos sql 

$outputFile = Join-Path -Path $scriptDirectory -ChildPath "migration.sql"

# Verifica se o arquivo ja existe, se existir deleta
if (Test-Path $outputFile){
    Remove-Item $outputFile
}

# Pega conteudo dos arquivos 
$sqlFiles = Get-ChildItem -Path $scriptDirectory -Filter *.sql 
-File | Sort-Object Name 

#Concatena arquivos 
foreach($file in $sqlFiles){
    Get-Content $file.FullName | Out-File -Append -FilePath $outputFile
    "GO" | Out-File -Append -FilePath $outputFile 
}

Write-Host "Todos Arquivos foram combinados em $outputFile"
C:\Users\karla\OneDrive\Área de Trabalho\Aulas_DIO\DIO - SQL\SQL -- Microsoft Copilot\E-CARDS\db_scripts\seeds\too_migration.ps