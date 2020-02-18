# load assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


# create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(800,600)
$form.StartPosition = 'CenterScreen'

# add controls
# add an OK button
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,550)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

# add a cancel button
$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(150,550)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

# add a label
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please enter the file name:'
$form.Controls.Add($label)

# add a textBox for input
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

function onclick()
{
    [System.Windows.Forms.MessageBox]::Show("You clicked me")
    $x = $textBox.Text
    $c = Get-Content -Path $x
    $textBox2.Text = $c
}


$click=
{
    [System.Windows.Forms.MessageBox]::Show("You clicked me")
    $x = $textBox.Text
    $c = Get-Content -Path $x
    $textBox2.Text = $c
}

# add a showcontent button
$SButton = New-Object System.Windows.Forms.Button
$SButton.Location = New-Object System.Drawing.Point(300,40)
$SButton.Size = New-Object System.Drawing.Size(100,23)
$SButton.Text = 'Show Content'
$SButton.Add_Click($click)
    
$form.Controls.Add($SButton)

# add another textBox for output
$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox2.Location = New-Object System.Drawing.Point(10,100)
$textBox2.Multiline = $true
$textBox2.AcceptsReturn = $true
$textBox2.AcceptsTab = $true
$textBox2.Size = New-Object System.Drawing.Size(700,400)
$form.Controls.Add($textBox2)


# specify the behavior of the form
$form.Topmost = $true

#$form.Add_Shown({$textBox.Select()})

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textBox.Text
    $c = Get-Content -Path $x
    $form.Controls.Item(4).Text = "I get you"
}
else
{
	Write-Host "You cancelled this form."
}