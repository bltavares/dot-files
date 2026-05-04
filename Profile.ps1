
Try {
  if (-not $ENV:X_MISE_GLOBAL)  {
    $ENV:X_MISE_GLOBAL = $True
    $ENV:MISE_GITHUB_USE_GIT_CREDENTIALS = $True
    $ENV:MISE_SYSTEM_CONFIG_DIR = "${ENV:USERPROFILE}\.config\mise\hosts\$($ENV:COMPUTERNAME.ToLower())"
    mise en -s pwsh
    return
  }
}
Catch {

}

Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

  Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58
