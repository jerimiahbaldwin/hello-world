

Polaris documentation is available [here](https://powershell.github.io/Polaris/)

The following must be run in PowerShell as administrator. This does not like to run in Docker. Also, it does not run when saved as a script called with `powershell ./script.ps1`

```powershell
Install-Module -Name Polaris -Scope CurrentUser -Force

New-PolarisGetRoute -Path "/hello-world" -Scriptblock {
  $html = Get-Content -Path './index.html'
  $Response.ContentType = 'text/html'
  $Response.Send($html)
}

New-PolarisGetRoute -Path "/hi" -Scriptblock {
  $Response.Send('Hi!')
}

New-PolarisStaticRoute -FolderPath './static'

Start-Polaris -Port 8080 -UseJsonBodyParserMiddleware -Verbose
```

# Routes

Routes include
* http://localhost:8080/hello-world
* http://localhost:8080/favicon.ico
* http://localhost:8080/hi

The `/hi` route above is not working.

# Notes

You can check to see that the `System.Net.HttpListener` is listening on port `8080` by running the following command:
```powershell
netstat -ano | Select-String "8080"
```

The following are other `Polaris` commands that can be run:

```powershell
Start-Polaris
Stop-Polaris
Get-Polaris
Clear-Polaris
```