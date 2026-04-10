# Aplica Passo 4b e 4c no foxpro.plist em formato XML.
# Execute na pasta vscode-foxpro-then: cd $env:USERPROFILE\Desktop\vscode-foxpro-then
# Depois rode este script passando o caminho do plist ou deixe ele usar .\syntaxes\foxpro.plist

param([string]$PlistPath = "syntaxes\foxpro.plist")

$ErrorActionPreference = "Stop"
if (-not (Test-Path $PlistPath)) {
    Write-Host "Erro: $PlistPath nao encontrado. Execute na pasta vscode-foxpro-then."
    exit 1
}

$content = Get-Content -Path $PlistPath -Raw

# 4c: trocar $self por $base dentro de round-brackets (; e , passam a ser coloridos dentro de ())
$content = $content -replace '<string>\$self</string>', '<string>$base</string>'

# 4b: inserir escopos para ; e , no nivel raiz (apos keyword.operator.foxpro, antes de </array>)
$insert = @'
		<dict>
			<key>match</key>
			<string>;</string>
			<key>name</key>
			<string>punctuation.terminator.foxpro</string>
		</dict>
		<dict>
			<key>match</key>
			<string>,</string>
			<key>name</key>
			<string>punctuation.separator.comma.foxpro</string>
		</dict>
'@
$content = $content -replace '(<string>keyword\.operator\.foxpro</string>\s*</dict>)(\s*</array>\s*<key>repository</key>)', "`$1`n$insert`$2"

Set-Content -Path $PlistPath -Value $content -NoNewline
Write-Host "OK. foxpro.plist (XML) alterado. Rode: npx vsce package"
Write-Host "Depois: Cursor -> Ctrl+Shift+P -> Install from VSIX... -> Reload Window"
