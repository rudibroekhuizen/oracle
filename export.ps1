[Environment]::SetEnvironmentVariable("ORACLE_SID", "NBCPROD", "Process")


foreach ($arg in $args) {
    write-host $arg
}
    #$bla = $args[0]
  
    Function Export {
     
        Param (
          $Date         = (Get-Date -Format yyyyMMdd),
          $DmpFileName  = "$env:ORACLE_SID$Date.dmp",
          $Oracle_Home  = "C:\Oracle_Sys\nbcprod\product\11.2\db\",  
          $FilePath     = (Join-Path $Oracle_Home \bin\expdp.exe),
          $ArgumentList = "USERID='/ as sysdba' FULL=Y DIRECTORY=DMPDIR DUMPFILE=$DmpFileName LOGFILE=dumplog.txt"
        )

        Write-Host $Date
        Write-Host $DmpFileName
        Write-Host $env:ORACLE_SID
        Get-ChildItem Env:ORACLE_SID
        Write-Host $ArgumentList
        Write-Host $bla
        
        #Start-Process -FilePath $FilePath -ArgumentList $ArgumentList
    }

    #Write-Host $bla
Export
