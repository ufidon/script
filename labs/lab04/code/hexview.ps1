param($filename)

# Add types for the MessageBox
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# filename parameter is required
# test filename exist
$res = Test-Path $filename -PathType Leaf

# $res

# show a warning if file not exist
if ($res -eq $false){
    [System.Windows.Forms.MessageBox]::Show("$filename NOT exist","Warning",[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Warning)
    exit 1
}

# $filename

# file exist, show as Hex format
Get-Content -Path $filename | Format-hex
