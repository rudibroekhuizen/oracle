[Environment]::SetEnvironmentVariable("ORACLE_SID", $args[0], "Process")
#[Environment]::SetEnvironmentVariable("NLS_LANG", "AMERICAN_AMERICAN.AL32UTF8", "Process")

foreach ($arg in $args) {
    write-host $arg
}
 
    Function Export {
     
        Param (
          $Date         = (Get-Date -Format yyyyMMdd),
          $DmpFileName  = "$env:ORACLE_SID$Date-5",
          $Oracle_Home  = "C:\Oracle_Sys\$env:ORACLE_SID\product\11.2\db\",  
          $FilePath     = (Join-Path $Oracle_Home \bin\expdp.exe),
          $FlashBack    = '\"TO_TIMESTAMP(TO_CHAR(SYSDATE,''YYYY-MM-DD HH24:MI:SS''),''YYYY-MM-DD HH24:MI:SS'')\"',
          $ArgumentList = "USERID='/ as sysdba' FULL=Y DIRECTORY=DMPDIR DUMPFILE=$DmpFileName.dmp LOGFILE=$DmpFileName.txt FLASHBACK_TIME=$FlashBack"
        )

        # Write parameters for troubleshooting
        Write-Host "Date:" $Date
        Write-Host "DmpFileName:" $DmpFileName
        Write-Host "Oracle_Home": $Oracle_Home
        Write-Host "Environment variable ORACLE_SID:" $env:ORACLE_SID
        Get-ChildItem Env:ORACLE_SID
        Write-Host $ArgumentList
        
        # Start the expdp        
        Start-Process -FilePath $FilePath -ArgumentList $ArgumentList #-NoNewWindow -PassThru -Wait -RedirectStandardOutput stdout.txt -RedirectStandardError stderr.txt
        
        # Zip the .dmp file
        zip -m $DmpFileName.DMP.zip $DmpFileName.DMP
    }

Export
