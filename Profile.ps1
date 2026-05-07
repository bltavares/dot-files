$Env:SHELL = 'pwsh'

Try {
  if (-not $ENV:X_MISE_GLOBAL)  {
    $ENV:X_MISE_GLOBAL = $True
    $ENV:MISE_GITHUB_USE_GIT_CREDENTIALS = $True
    $ENV:MISE_SYSTEM_CONFIG_DIR = "${ENV:USERPROFILE}\.config\mise\hosts\$($ENV:COMPUTERNAME.ToLower())"
    mise en -s 'pwsh -NoLogo'
    return
  }
}
Catch {

}

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })

New-Alias -Name vim -Value nvim

function x {
  param (
  [string[]]$MiseEnv
  )

  if ($MiseEnv.Length -eq 0) {
    echo "Available envs:`n"
    $local_mise = mise cfg ls --silent --no-header | Select-String -NotMatch -SimpleMatch -Pattern "${ENV:USERPROFILE}\.config\mise" | Measure-Object -Line
    if ($local_mise.Lines -gt 0) {
      echo "(local)"
    }
    Get-ChildItem ~/.config/mise/mise.*.toml | % {
      echo $_.Name.Replace("mise.", "").Replace(".toml", "")
    }
    return
  }

  $env = [System.Collections.Generic.HashSet[string]]@()
  if ($ENV:MISE_ENV) {
  $curr = $ENV:MISE_ENV.split(",")
  $curr | % {
    $null = $env.Add($_)
  }
  }
  $MiseEnv | % {
    $null = $env.Add($_)
  }
  mise en -s 'pwsh -NoLogo' -E ($env -Join ",")
}


function xo {
  param(
    [string]$MiseEnv
  )

  if (-not $MiseEnv) {
    echo "Available envs:`n"
    Get-ChildItem ~/.config/mise/mise.*.toml | % {
      echo $_.Name.Replace("mise.", "").Replace(".toml", "")
    }
    return
  }

	cp ~/.config/mise/mise.$MiseEnv.toml mise.local.toml
}

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

  Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58
