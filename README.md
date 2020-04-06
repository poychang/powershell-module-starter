# Powershell Module Starter

PowerShell 提供兩種模式，**指令檔**和**模組檔**，前者使用 `.ps1` 附檔名，後者使用 `.psm1`。

## Powershell Script 指令檔

使用 PowerShellGet 的 `New-ScriptFileInfo` cmdlet 在 `scripts` 資料夾中建立 `sample-script.ps1` PowerShell 指令碼檔：

```powershell
New-ScriptFileInfo -Path sample-script.ps1
```

所建立的檔案內容會包含指令檔的說明資訊註解區塊 `<#PSScriptInfo#>`，可以在這區塊中增加作者、描述等資訊。

## Powershell Script Module 指令碼模組檔

若要建立指令碼模組檔，我們可以在 `modules` 資料夾中，只要將 PowerShell 檔案的副檔名從 `.ps1` 修改成 `.psm1`，這樣就是指令碼模組檔，例如 `sample-module.psm1`。

另外，你可以針對該模組建立模組資訊檔（選用），透過 `New-ModuleManifest` cmdlet 為相同檔案名稱的模組檔，新增模組資訊：

```powershell
New-ModuleManifest -Path .\modules\sample-module.psd1
```

透過修改所建立的 `.psd1` 檔案，顯示該模組的相關資訊。

## 發行至 Powershell Gallery

將所建立的指令檔/指令碼模組檔發行至 [Powershell Gallery](https://www.powershellgallery.com/)，必須要到 Powershell Gallery 網站中取得 API 金鑰，並使用下列指令發行：

```powershell
Publish-Script -Path <scriptPath> -NuGetApiKey <apiKey> -WhatIf -Verbose
Publish-Module -Name <moduleName> -NuGetApiKey <apiKey> -WhatIf -Verbose
```

>上述指令使用 `WhatIf` 來模擬執行發行命令，若要正式執行，請將該參數移除。

## 指令碼分析工具

[PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer) 是 PowerShell 指令碼和模組的靜態程式碼檢查器，使用 PowerShell 團隊與社群所的最佳做法當作規則，檢查程式碼以維持程式碼的品質。此工具可產生 DiagnosticResults（錯誤和警告），以告知開發者潛在的程式碼缺陷，並提出可能的改進方案。

可使用 `tests` 資料夾下的 `InvokeScriptAnalyzer.ps1` 來檢查指定檔案是否符合品質規範，執行命令範例如下：

```powershell
InvokeScriptAnalyzer.ps1 -path .\scripts\sample-script.ps1
```
