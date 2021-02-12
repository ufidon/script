# add required assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# create a form or Windows
$form = New-Object System.Windows.Forms.Form
$form.Text = 'A Service Viewer'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

# create an OK button then add to the form
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

# create a cancel button then add to the form
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

# create a label then add to the form
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,40)
#$label.AutoSize = $true
$label.Text = 'Please enter the name of the service you want to view in the space below:'
$form.Controls.Add($label)

# create a textbox then add to the form
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,80)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

# show the form above all other windows
$form.Topmost = $true

# set the focus to the textbox
$form.Add_Shown({$textBox.Select()})

# show the form
$result = $form.ShowDialog()

# if the user supplied a service name and clicked OK
if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    # get the service name from the textbox
    $x = $textBox.Text
    # $x

    # ask the user to confirm viewing the service
    $res = [System.Windows.Forms.MessageBox]::Show("You want to view the service $x","Confirmation",[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Warning)

    # $res.GetType()

    # user confirmed, show the service in a GridView
    if ($res -eq [System.Windows.Forms.DialogResult]::OK)
    {
        Get-Service -Name $x | Out-GridView -Title "$x is here:" -Wait
    }
}