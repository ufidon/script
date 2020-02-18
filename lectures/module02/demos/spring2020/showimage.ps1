Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object system.Windows.Forms.Form

$Form.Text = "Show Images"
$Form.Width = 800
$Form.Height = 600
$Form.AutoScroll = $True
$Form.AutoSize = $false
$Form.AutoSizeMode = "GrowAndShrink"
$Form.MinimizeBox = $False
$Form.MaximizeBox = $true
$Form.WindowState = "Normal"
    # Maximized, Minimized, Normal
$Form.SizeGripStyle = "Hide"
    # Auto, Hide, Show
$Form.ShowInTaskbar = $False
$Form.Opacity = 0.7
    # 1.0 is fully opaque; 0.0 is invisible
$Form.StartPosition = "CenterScreen"
$Form.BackColor = "Lime"
    # color names are static properties of System.Drawing.Color
    # you can also use ARGB values, such as "#FFFFEBCD"


$Image = [system.drawing.image]::FromFile("C:\Users\Administrator\Pictures\eagle.jpg")
$Form.BackgroundImage = $Image
$Form.BackgroundImageLayout = "None"
    # None, Tile, Center, Stretch, Zoom
$Form.Width = $Image.Width
$Form.Height = $Image.Height

$Icon = New-Object system.drawing.icon ("C:\Users\Administrator\AppData\Local\Google\Chrome\User Data\Default\Google Profile.ico")
$Form.Icon = $Icon


$Font = New-Object System.Drawing.Font("Times New Roman",18,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$Form.Font = $Font

$Label = New-Object System.Windows.Forms.Label
$Label.Text = "This form is very simple."
$Label.AutoSize = $True
$Form.Controls.Add($Label)

$Form.ShowDialog()