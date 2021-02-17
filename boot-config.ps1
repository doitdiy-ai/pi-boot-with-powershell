#---------------------------------------------------------[Initialisations]--------------------------------------------------------
# Init PowerShell Gui
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$script:SDCard = $true

#---------------------------------------------------------[Form]--------------------------------------------------------

[System.Windows.Forms.Application]::EnableVisualStyles()

$LocalBootConfigForm                    = New-Object system.Windows.Forms.Form
$LocalBootConfigForm.ClientSize         = '640,450'
$LocalBootConfigForm.text               = "Raspberry Pi First Boot Configuration"
$LocalBootConfigForm.BackColor          = "#ffffff"
$LocalBootConfigForm.TopMost            = $false

$Title                           = New-Object system.Windows.Forms.Label
$Title.text                      = "Configure SD Card for Raspberry Pi boot"
$Title.AutoSize                  = $true
$Title.width                     = 25
$Title.height                    = 10
$Title.location                  = New-Object System.Drawing.Point(20,20)
$Title.Font                      = 'Microsoft Sans Serif,13'

$Description                     = New-Object system.Windows.Forms.Label
$Description.text                = "To configure the SD card, make sure it has been freshly imaged with the Raspberry Pi Imager and that it has been re-inserted into the SD card reader and connected to this computer"
$Description.AutoSize            = $false
$Description.width               = 450
$Description.height              = 50
$Description.location            = New-Object System.Drawing.Point(20,50)
$Description.Font                = 'Microsoft Sans Serif,10'

$BootConfigStatus                   = New-Object system.Windows.Forms.Label
$BootConfigStatus.text              = "Status:"
$BootConfigStatus.AutoSize          = $true
$BootConfigStatus.width             = 25
$BootConfigStatus.height            = 10
$BootConfigStatus.location          = New-Object System.Drawing.Point(20,115)
$BootConfigStatus.Font              = 'Microsoft Sans Serif,10,style=Bold'

$BootConfigFound                    = New-Object system.Windows.Forms.Label
$BootConfigFound.text               = "Searching for BootConfig..."
$BootConfigFound.AutoSize           = $true
$BootConfigFound.width              = 25
$BootConfigFound.height             = 10
$BootConfigFound.location           = New-Object System.Drawing.Point(100,115)
$BootConfigFound.Font               = 'Microsoft Sans Serif,10'

$BootConfigDetails                  = New-Object system.Windows.Forms.Label
$BootConfigDetails.text             = "BootConfig details"
$BootConfigDetails.AutoSize         = $true
$BootConfigDetails.width            = 25
$BootConfigDetails.height           = 10
$BootConfigDetails.location         = New-Object System.Drawing.Point(20,170)
$BootConfigDetails.Font             = 'Microsoft Sans Serif,12'
$BootConfigDetails.Visible          = $false

$BootConfigDriveLabel                = New-Object system.Windows.Forms.Label
$BootConfigDriveLabel.text           = "SD Card Drive:"
$BootConfigDriveLabel.AutoSize       = $true
$BootConfigDriveLabel.width          = 25
$BootConfigDriveLabel.height         = 20
$BootConfigDriveLabel.location       = New-Object System.Drawing.Point(20,140)
$BootConfigDriveLabel.Font           = 'Microsoft Sans Serif,10,style=Bold'
$BootConfigDriveLabel.Visible        = $false

$BootConfigDrive                     = New-Object system.Windows.Forms.ComboBox
$BootConfigDrive.text                = ""
$BootConfigDrive.width               = 170
$BootConfigDrive.height              = 20
$BootConfigDrive.location            = New-Object System.Drawing.Point(150,140)
$BootConfigDrive.Font                = 'Microsoft Sans Serif,10'
$BootConfigDrive.Visible             = $false

$BootConfigPiPasswordLabel                = New-Object system.Windows.Forms.Label
$BootConfigPiPasswordLabel.text           = "Pi Password:"
$BootConfigPiPasswordLabel.AutoSize       = $true
$BootConfigPiPasswordLabel.width          = 25
$BootConfigPiPasswordLabel.height         = 20
$BootConfigPiPasswordLabel.location       = New-Object System.Drawing.Point(20,200)
$BootConfigPiPasswordLabel.Font           = 'Microsoft Sans Serif,10,style=Bold'
$BootConfigPiPasswordLabel.Visible        = $false
$BootConfigPiPasswordLabel.Enabled         = $false

$BootConfigPiPassword                     = New-Object system.Windows.Forms.TextBox
$BootConfigPiPassword.multiline           = $false
$BootConfigPiPassword.width               = 314
$BootConfigPiPassword.height              = 20
$BootConfigPiPassword.location            = New-Object System.Drawing.Point(150,200)
$BootConfigPiPassword.Font                = 'Microsoft Sans Serif,10'
$BootConfigPiPassword.Visible             = $false
$BootConfigPiPassword.Enabled         = $false

$BootConfigSSIDLabel                = New-Object system.Windows.Forms.Label
$BootConfigSSIDLabel.text           = "WiFi Name:"
$BootConfigSSIDLabel.AutoSize       = $true
$BootConfigSSIDLabel.width          = 25
$BootConfigSSIDLabel.height         = 20
$BootConfigSSIDLabel.location       = New-Object System.Drawing.Point(20,230)
$BootConfigSSIDLabel.Font           = 'Microsoft Sans Serif,10,style=Bold'
$BootConfigSSIDLabel.Visible        = $false

$BootConfigSSID                     = New-Object system.Windows.Forms.TextBox
$BootConfigSSID.multiline           = $false
$BootConfigSSID.width               = 314
$BootConfigSSID.height              = 20
$BootConfigSSID.location            = New-Object System.Drawing.Point(150,230)
$BootConfigSSID.Font                = 'Microsoft Sans Serif,10'
$BootConfigSSID.Visible             = $false

$BootConfigSSIDPWLabel                = New-Object system.Windows.Forms.Label
$BootConfigSSIDPWLabel.text           = "WiFi Password:"
$BootConfigSSIDPWLabel.AutoSize       = $true
$BootConfigSSIDPWLabel.width          = 25
$BootConfigSSIDPWLabel.height         = 20
$BootConfigSSIDPWLabel.location       = New-Object System.Drawing.Point(20,260)
$BootConfigSSIDPWLabel.Font           = 'Microsoft Sans Serif,10,style=Bold'
$BootConfigSSIDPWLabel.Visible        = $false

$BootConfigSSIDPW                     = New-Object system.Windows.Forms.TextBox
$BootConfigSSIDPW.multiline           = $false
$BootConfigSSIDPW.width               = 314
$BootConfigSSIDPW.height              = 20
$BootConfigSSIDPW.location            = New-Object System.Drawing.Point(150,260)
$BootConfigSSIDPW.Font                = 'Microsoft Sans Serif,10'
$BootConfigSSIDPW.Visible             = $false

$BootConfigHostnameLabel                = New-Object system.Windows.Forms.Label
$BootConfigHostnameLabel.text           = "Hostname:"
$BootConfigHostnameLabel.AutoSize       = $true
$BootConfigHostnameLabel.width          = 25
$BootConfigHostnameLabel.height         = 20
$BootConfigHostnameLabel.location       = New-Object System.Drawing.Point(20,290)
$BootConfigHostnameLabel.Font           = 'Microsoft Sans Serif,10,style=Bold'
$BootConfigHostnameLabel.Visible        = $false

$BootConfigHostname                     = New-Object system.Windows.Forms.TextBox
$BootConfigHostname.multiline           = $false
$BootConfigHostname.width               = 314
$BootConfigHostname.height              = 20
$BootConfigHostname.location            = New-Object System.Drawing.Point(150,290)
$BootConfigHostname.Font                = 'Microsoft Sans Serif,10'
$BootConfigHostname.Visible             = $false

$BootConfigModifyPWLabel                = New-Object system.Windows.Forms.Label
$BootConfigModifyPWLabel.text           = "Modify Pi Password:"
$BootConfigModifyPWLabel.AutoSize       = $true
$BootConfigModifyPWLabel.width          = 25
$BootConfigModifyPWLabel.height         = 20
$BootConfigModifyPWLabel.location       = New-Object System.Drawing.Point(20,320)
$BootConfigModifyPWLabel.Font           = 'Microsoft Sans Serif,10,style=Bold'
$BootConfigModifyPWLabel.Visible        = $false

$BootConfigModifyPW                     = New-Object system.Windows.Forms.CheckBox
$BootConfigModifyPW.location            = New-Object System.Drawing.Point(180,317)
$BootConfigModifyPW.Visible             = $false

$AddBootConfigBtn                   = New-Object system.Windows.Forms.Button
$AddBootConfigBtn.BackColor         = "#ff7b00"
$AddBootConfigBtn.text              = "Configure"
$AddBootConfigBtn.width             = 90
$AddBootConfigBtn.height            = 30
$AddBootConfigBtn.location          = New-Object System.Drawing.Point(510,400)
$AddBootConfigBtn.Font              = 'Microsoft Sans Serif,10'
$AddBootConfigBtn.ForeColor         = "#ffffff"
$AddBootConfigBtn.Visible           = $false
$AddBootConfigBtn.Enabled           = $false

$cancelBtn                       = New-Object system.Windows.Forms.Button
$cancelBtn.BackColor             = "#ffffff"
$cancelBtn.text                  = "Cancel"
$cancelBtn.width                 = 90
$cancelBtn.height                = 30
$cancelBtn.location              = New-Object System.Drawing.Point(400,400)
$cancelBtn.Font                  = 'Microsoft Sans Serif,10'
$cancelBtn.ForeColor             = "#000"
$cancelBtn.DialogResult          = [System.Windows.Forms.DialogResult]::Cancel
$LocalBootConfigForm.CancelButton   = $cancelBtn
$LocalBootConfigForm.Controls.Add($cancelBtn)

$LocalBootConfigForm.controls.AddRange(@($Title,$Description,$BootConfigStatus,$BootConfigFound,$BootConfigPiPassword,$BootConfigPiPasswordLabel,$BootConfigDrive,$AddBootConfigBtn,$cancelBtn,$BootConfigDriveLabel,$BootConfigDetails, $BootConfigSSIDLabel, $BootConfigSSID, $BootConfigSSIDPWLabel, $BootConfigSSIDPW, $BootConfigModifyPWLabel, $BootConfigModifyPW, $BootConfigHostnameLabel, $BootConfigHostname ))

#-----------------------------------------------------------[Functions]------------------------------------------------------------

# .Net methods for hiding/showing the console in the background
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'

function Show-Console
{
    $consolePtr = [Console.Window]::GetConsoleWindow()

    # Hide = 0,
    # ShowNormal = 1,
    # ShowMinimized = 2,
    # ShowMaximized = 3,
    # Maximize = 3,
    # ShowNormalNoActivate = 4,
    # Show = 5,
    # Minimize = 6,
    # ShowMinNoActivate = 7,
    # ShowNoActivate = 8,
    # Restore = 9,
    # ShowDefault = 10,
    # ForceMinimized = 11

    [Console.Window]::ShowWindow($consolePtr, 4)
}

function Hide-Console
{
    $consolePtr = [Console.Window]::GetConsoleWindow()
    #0 hide
    [Console.Window]::ShowWindow($consolePtr, 0)
}

function AddBootConfig {
  $BootConfigFound.ForeColor = "#000000"
  $BootConfigFound.Text = 'Adding BootConfig...'
  $PiPW = $BootConfigPiPassword.Text
  $PiPWChecked = $BootConfigModifyPW
  $SSID = $BootConfigSSID.Text
  $WifiPW = $BootConfigSSIDPW.Text
  $Hostname = $BootConfigHostname.Text
  $SDCard = $BootConfigDrive.SelectedItem

#--------------[cmdline.txt]----------------------
  $Cmdline = ($SDCard + "cmdline.txt")
  $PiPWFile = ($SDCard + "pipassword")
  $unattended = ($SDCard + "unattended")
  $wpasupplicant = ($SDCard +"wpa_supplicant.conf")
  $Inittext =  " init=/bin/bash -c `"mount -t proc proc /proc; mount -t sysfs sys /sys; mount /boot; sed -i 's/\r$//' /boot/unattended; source /boot/unattended`""
  If (Test-Path ($Cmdline)) {
    $CmdlineContent = (((Get-Content $Cmdline) -csplit "( init)")[0] + $Inittext)
    Move-Item -Path $Cmdline -Destination ($SDCard + "cmdline.bak") -Force
    Set-Content -Path $Cmdline -Value $CmdlineContent -NoNewLine

#--------------[pipassword file]-----------------
    If ($PiPWChecked.Checked) {Set-Content -Path $PiPWFile -Value $PiPW -NoNewLine}

#--------------[unattended file]-----------------
  $unattendedtext = "# 1. MAKING THE SYSTEM WORK. DO NOT REMOVE
mount -t tmpfs tmp /run
mkdir -p /run/systemd
mount / -o remount,rw
sed -i `'s| init=.*||`' /boot/cmdline.txt

# 2. THE USEFUL PART OF THE SCRIPT
# Enable SSH
raspi-config nonint do_ssh 0
# Enable VNC
raspi-config nonint do_vnc 0
# Change the hostname to something recognizable
raspi-config nonint do_hostname $($BootConfigHostname.Text)
# Set the screen resolution to 1920 x 1080, especially important for VNC to work if running headless
raspi-config nonint do_resolution 2 82
# enable the camera (optional)
raspi-config nonint do_camera 0
# Set timezone
raspi-config nonint do_change_timezone America/Chicago
# Set locale
raspi-config nonint do_change_locale en_US.UTF.8
# Set keyboard
raspi-config nonint do_configure_keyboard us
# Set password, uncomment (remove pound sign) if you want to set the pi password here
sed -i 's/\r$//' /boot/pipassword
$(if (-not $PiPWChecked.Checked){"#"})usermod --password `$(openssl passwd -1 `$(cat /boot/pipassword)) pi
rm /boot/pipassword
# Remove autostart of welcome to raspberry pi
rm /etc/xdg/autostart/piwiz.desktop
# Expand file system
canexpand=``raspi-config nonint get_can_expand``; if [ `"`$canexpand`" -eq `"0`" ]; then raspi-config nonint do_expand_rootfs; fi
echo `"Completed custom configuration`"
sleep 5


# 3. CLEANING UP AND REBOOTING
sync
umount /boot
mount / -o remount,ro
sync
echo 1 > /proc/sys/kernel/sysrq
echo b > /proc/sysrq-trigger
sleep 5"
  Set-Content -Path $unattended -Value $unattendedtext -NoNewLine

#--------------[wpa_supplicant.conf file]-----------------
  $wpasupplicanttext = "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=US

network={
        ssid=`"$($BootConfigSSID.Text)`"
        psk=`"$($BootConfigSSIDPW.Text)`"
}"
    Set-Content -Path $wpasupplicant -Value $wpasupplicanttext -NoNewLine
  }else{
    $BootConfigFound.Text = 'No cmdline.txt file found. This does not appear to be Raspberry Pi OS bootable SD Card.'
  }

  $BootConfigDrive.Visible = $false
  $AddBootConfigBtn.Visible = $false
  $BootConfigDetails.Visible = $false
  $BootConfigDriveLabel.Visible = $false
  $BootConfigPiPasswordLabel.Visible = $false
  $BootConfigPiPassword.Visible = $false
  $BootConfigSSIDLabel.Visible = $false
  $BootConfigSSID.Visible = $false
  $BootConfigSSIDPWLabel.Visible = $false
  $BootConfigSSIDPW.Visible = $false
  $BootConfigModifyPWLabel.Visible = $false
  $BootConfigModifyPW.Visible = $false
  $BootConfigHostnameLabel.Visible = $false
  $BootConfigHostname.Visible = $false
  $cancelBtn.text = "Close"
}

#---------------------------------------------------------[Script]--------------------------------------------------------

Hide-Console

# Get Connected Drives named Boot
$BootDrives = (
  Get-CimInstance -ClassName Win32_Volume | Select Name, Label |
  Where-Object {
    $_.Label -eq "boot"
  }
)

If ($BootDrives.length -ne 0) {
  if ($BootDrives.length -gt 1) { $BootConfigFound.text = "SD Cards found" } else {$BootConfigFound.text = "SD Card found"}
  $BootConfigFound.ForeColor = "#7ed321"
  $BootConfigPiPasswordLabel.Visible = $true
  $BootConfigPiPassword.Visible = $true
  ForEach ($BootDrive in $BootDrives) {
    $BootConfigDrive.Items.Add($BootDrive.Name)
  }
  $BootConfigDrive.Visible = $true
  $AddBootConfigBtn.Visible = $true
  $BootConfigDetails.Visible = $true
  $BootConfigDriveLabel.Visible = $true
  $BootConfigSSIDLabel.Visible = $true
  $BootConfigSSID.Visible = $true
  $BootConfigSSIDPWLabel.Visible = $true
  $BootConfigSSIDPW.Visible = $true
  $BootConfigModifyPWLabel.Visible = $true
  $BootConfigModifyPW.Visible = $true
  $BootConfigHostnameLabel.Visible = $true
  $BootConfigHostname.Visible = $true
}else{
  $BootConfigFound.text = "No SD Cards found"
  $BootConfigFound.ForeColor = "#D0021B"
  $cancelBtn.text = "Close"
}

$AddBootConfigBtn.Add_Click({ AddBootConfig })

$BootConfigDrive.Add_SelectedIndexChanged({
    $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0))
})

$BootConfigModifyPW.Add_CheckStateChanged({
    If ($BootConfigModifyPW.Checked) {
      $BootConfigPiPasswordLabel.Enabled = $true
      $BootConfigPiPassword.Enabled = $true
    } Else {
      $BootConfigPiPasswordLabel.Enabled = $false
      $BootConfigPiPassword.Enabled = $false
      $BootConfigPiPassword.Text = ""
    }
    $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0))
})

$BootConfigPiPassword.Add_TextChanged({
  $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0))
})

$BootConfigSSID.Add_TextChanged({
  $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0))
})

$BootConfigSSIDPW.Add_TextChanged({
  $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0))
})

$BootConfigHostname.Add_TextChanged({
  $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0))
})

[void]$LocalBootConfigForm.ShowDialog()
