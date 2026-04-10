# Aplica o Passo 4c no foxpro.plist (escopos para ; e , dentro de round-brackets).
# Execute na pasta vscode-foxpro-then: .\aplicar-4c-round-brackets.ps1
# Ou no PowerShell: cd $env:USERPROFILE\Desktop\vscode-foxpro-then; & "C:\Omar\BackOffice\CERTTUS v2025_04_Spool\Certtus Plus\.vscode\aplicar-4c-round-brackets.ps1"

$ErrorActionPreference = "Stop"
# Execute na pasta vscode-foxpro-then (Desktop), onde fica syntaxes\foxpro.plist
$plistPath = "syntaxes\foxpro.plist"
if (-not (Test-Path $plistPath)) {
    Write-Host "Erro: foxpro.plist nao encontrado. Cd para a pasta vscode-foxpro-then (Desktop) e rode de novo."
    exit 1
}

$content = Get-Content -Path $plistPath -Raw
if ($content -notmatch 'meta\.round-brackets') {
    Write-Host "Erro: arquivo nao parece ser o foxpro.plist esperado (sem meta.round-brackets)."
    exit 1
}

# Opcao A: trocar include $self por include $base dentro de round-brackets (mais simples)
# Assim o conteudo dentro de () usa os padroes da raiz, incluindo ; e ,
$old = $content
$content = $content -replace '(\s+include\s+)\$self\b', '${1}$base'
if ($content -eq $old) {
    Write-Host "Nenhuma substituicao (include \$self) feita. Tentando inserir blocos match..."
    # Opcao B: inserir os dois match antes de include $self
    $block = @"

 match 
;
 name 
 punctuation.terminator.foxpro 
 
 
 match 
,
 name 
 punctuation.separator.comma.foxpro 


"@
    $content = $content -replace '(\s+meta\.round-brackets\s+patterns\s+)(\s+include\s+\$self)', "`$1$block`n`n `$2"
}
if ($content -eq $old) {
    Write-Host "Nenhuma alteracao aplicada. Edite syntaxes\foxpro.plist manualmente:"
    Write-Host "  Em 'round-brackets' -> 'patterns', troque 'include' de '\$self' para '\$base',"
    Write-Host "  OU acrescente os blocos match para ; e , antes de 'include \$self'."
    exit 1
}

Set-Content -Path $plistPath -Value $content -NoNewline
Write-Host "OK. foxpro.plist alterado. Rode: npx vsce package"
Write-Host "Depois: Cursor -> Ctrl+Shift+P -> Install from VSIX... -> Reload Window"
