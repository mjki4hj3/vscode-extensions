$extensions = 
"vscode-aws-console.vscode-aws-console",
"amazonwebservices.aws-toolkit-vscode",
"hashicorp.terraform",
"4ops.terraform",
"tomoki1207.pdf",
"ms-vscode-remote.remote-wsl"



$cmd = "code --list-extensions"
Invoke-Expression $cmd -OutVariable output | Out-Null
$installed = $output -split "\s"

foreach ($ext in $extensions) {
    if ($installed.Contains($ext)) {
        Write-Host $ext "already installed." -ForegroundColor Gray
    } else {
        Write-Host "Installing" $ext "..." -ForegroundColor White
        code --install-extension $ext
    }
}