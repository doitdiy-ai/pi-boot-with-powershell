#---------------------------------------------------------[Initialisations]--------------------------------------------------------
# Init PowerShell Gui
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$script:SDCard = $true


$TZtoOlson = @"
W. Central Africa Standard Time = Africa/Bangui
Egypt Standard Time = Africa/Cairo
Morocco Standard Time = Africa/Casablanca
South Africa Standard Time = Africa/Harare
Greenwich Standard Time = Africa/Monrovia
E. Africa Standard Time = Africa/Nairobi
Namibia Standard Time = Africa/Windhoek
Alaskan Standard Time = America/Anchorage
Argentina Standard Time = America/Argentina/San_Juan
Paraguay Standard Time = America/Asuncion
Bahia Standard Time = America/Bahia
SA Pacific Standard Time = America/Bogota
Venezuela Standard Time = America/Caracas
SA Eastern Standard Time = America/Cayenne
Central Standard Time = America/Chicago
Mountain Standard Time (Mexico) = America/Chihuahua
Central Brazilian Standard Time = America/Cuiaba
Mountain Standard Time = America/Denver
Greenland Standard Time = America/Godthab
Central America Standard Time = America/Guatemala
Atlantic Standard Time = America/Halifax
US Eastern Standard Time = America/Indianapolis
SA Western Standard Time = America/La_Paz
Pacific Standard Time = America/Los_Angeles
Mexico Standard Time = America/Mexico_City
Montevideo Standard Time = America/Montevideo
Eastern Standard Time = America/New_York
UTC-02 = America/Noronha
US Mountain Standard Time = America/Phoenix
Canada Central Standard Time = America/Regina
Pacific Standard Time (Mexico) = America/Santa_Isabel
Pacific SA Standard Time = America/Santiago
E. South America Standard Time = America/Sao_Paulo
Newfoundland Standard Time = America/St_Johns
New Zealand Standard Time = Antarctica/McMurdo
Central Asia Standard Time = Asia/Almaty
Jordan Standard Time = Asia/Amman
Arabic Standard Time = Asia/Baghdad
Azerbaijan Standard Time = Asia/Baku
SE Asia Standard Time = Asia/Bangkok
Middle East Standard Time = Asia/Beirut
India Standard Time = Asia/Calcutta
Sri Lanka Standard Time = Asia/Colombo
Syria Standard Time = Asia/Damascus
Bangladesh Standard Time = Asia/Dhaka
Arabian Standard Time = Asia/Dubai
North Asia East Standard Time = Asia/Irkutsk
Israel Standard Time = Asia/Jerusalem
Afghanistan Standard Time = Asia/Kabul
Kamchatka Standard Time = Asia/Kamchatka
Pakistan Standard Time = Asia/Karachi
Nepal Standard Time = Asia/Katmandu
North Asia Standard Time = Asia/Krasnoyarsk
Singapore Standard Time = Asia/Kuala_Lumpur
Arab Standard Time = Asia/Kuwait
Magadan Standard Time = Asia/Magadan
N. Central Asia Standard Time = Asia/Novosibirsk
West Asia Standard Time = Asia/Oral
Myanmar Standard Time = Asia/Rangoon
Korea Standard Time = Asia/Seoul
China Standard Time = Asia/Shanghai
Taipei Standard Time = Asia/Taipei
Georgian Standard Time = Asia/Tbilisi
Iran Standard Time = Asia/Tehran
Tokyo Standard Time = Asia/Tokyo
Ulaanbaatar Standard Time = Asia/Ulaanbaatar
Vladivostok Standard Time = Asia/Vladivostok
Yakutsk Standard Time = Asia/Yakutsk
Ekaterinburg Standard Time = Asia/Yekaterinburg
Armenian Standard Time = Asia/Yerevan
Azores Standard Time = Atlantic/Azores
Cape Verde Standard Time = Atlantic/Cape_Verde
Cen. Australia Standard Time = Australia/Adelaide
E. Australia Standard Time = Australia/Brisbane
AUS Central Standard Time = Australia/Darwin
Tasmania Standard Time = Australia/Hobart
W. Australia Standard Time = Australia/Perth
AUS Eastern Standard Time = Australia/Sydney
UTC = Etc/GMT
UTC-11 = Etc/GMT+11
Dateline Standard Time = Etc/GMT+12
UTC+12 = Etc/GMT-12
W. Europe Standard Time = Europe/Amsterdam
GTB Standard Time = Europe/Athens
Central Europe Standard Time = Europe/Belgrade
Romance Standard Time = Europe/Brussels
GMT Standard Time = Europe/Dublin
FLE Standard Time = Europe/Helsinki
E. Europe Standard Time = Europe/Minsk
Russian Standard Time = Europe/Moscow
Central European Standard Time = Europe/Sarajevo
Mauritius Standard Time = Indian/Mauritius
Samoa Standard Time = Pacific/Apia
Fiji Standard Time = Pacific/Fiji
Central Pacific Standard Time = Pacific/Guadalcanal
West Pacific Standard Time = Pacific/Guam
Hawaiian Standard Time = Pacific/Honolulu
Tonga Standard Time = Pacific/Tongatapu
"@
$TZtoOlsonHash = ConvertFrom-StringData $TZtoOlson

$Locales = "ar-AE","ar-BH","ar-DZ","ar-EG","ar-IQ","ar-JO","ar-KW","ar-LB","ar-LY","ar-MA","ar-OM","ar-QA","ar-SA","ar-SD","ar-SY","ar-TN","ar-YE","be-BY","bg-BG","bn-BD","bn-IN","ca-ES","cs-CZ","da-DK","de-AT","de-CH","de-DE","de-LU","el-CY","el-GR","en-AU","en-CA","en-GB","en-IE","en-IN","en-MT","en-NZ","en-PH","en-SG","en-US","en-ZA","es-AR","es-BO","es-CL","es-CO","es-CR","es-DO","es-EC","es-ES","es-GT","es-HN","es-MX","es-NI","es-PA","es-PE","es-PR","es-PY","es-SV","es-US","es-UY","es-VE","et-EE","fi-FI","fr-BE","fr-CA","fr-CH","fr-FR","fr-LU","ga-IE","hi-IN","hr-HR","hu-HU","in-ID","is-IS","it-CH","it-IT","iw-IL","ja-JP","ja-JP-JP","ko-KR","lt-LT","lv-LV","mk-MK","ms-MY","mt-MT","nl-BE","nl-NL","no-NO","no-NO-NY","pl-PL","pt-BR","pt-PT","ro-RO","ru-RU","sk-SK","sl-SI","sq-AL","sr-BA","sr-CS","sr-ME","sr-RS","sv-SE","th-TH","th-TH-TH","tr-TR","uk-UA","vi-VN","zh-CN","zh-HK","zh-SG","zh-TW"

$Countries = "AE","AL","AR","AT","AU","BA","BD","BE","BG","BH","BO","BR","BY","CA","CH","CL","CN","CO","CR","CS","CY","CZ","DE","DK","DO","DZ","EC","EE","EG","ES","FI","FR","GB","GR","GT","HK","HN","HR","HU","ID","IE","IL","IN","IQ","IS","IT","JO","JP","KR","KW","LB","LT","LU","LV","LY","MA","ME","MK","MT","MX","MY","NI","NL","NO","NY","NZ","OM","PA","PE","PH","PL","PR","PT","PY","QA","RO","RS","RU","SA","SD","SE","SG","SI","SK","SV","SY","TH","TN","TR","TW","UA","US","UY","VE","VN","YE","ZA"

#---------------------------------------------------------[Form]--------------------------------------------------------

[System.Windows.Forms.Application]::EnableVisualStyles()

$LocalBootConfigForm                    = New-Object system.Windows.Forms.Form
$LocalBootConfigForm.ClientSize         = '940,450'
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

$BootConfigTZLabel                = New-Object system.Windows.Forms.Label
$BootConfigTZLabel.text           = "Timezone:"
$BootConfigTZLabel.AutoSize       = $true
$BootConfigTZLabel.width          = 25
$BootConfigTZLabel.height         = 20
$BootConfigTZLabel.location       = New-Object System.Drawing.Point(490,200)
$BootConfigTZLabel.Font           = 'Microsoft Sans Serif,10,style=Bold'
$BootConfigTZLabel.Visible        = $false

$BootConfigTZ                     = New-Object system.Windows.Forms.ComboBox
$BootConfigTZ.width               = 214
$BootConfigTZ.height              = 20
$BootConfigTZ.location            = New-Object System.Drawing.Point(650,197)
$BootConfigTZ.Font                = 'Microsoft Sans Serif,10'
$BootConfigTZ.Visible             = $false
ForEach ($Item in $($TZtoOlsonHash.GetEnumerator() | sort -Property Value)) {
 [void] $BootConfigTZ.Items.Add($Item.Value)
}
$BootConfigTZ.SelectedItem = $BootConfigTZ.Items[$BootConfigTZ.FindString($TZtoOlsonHash[(Get-Timezone).StandardName])]

$BootConfigLocaleLabel                = New-Object system.Windows.Forms.Label
$BootConfigLocaleLabel.text           = "Language and Country:"
$BootConfigLocaleLabel.AutoSize       = $true
$BootConfigLocaleLabel.width          = 25
$BootConfigLocaleLabel.height         = 20
$BootConfigLocaleLabel.location       = New-Object System.Drawing.Point(490,230)
$BootConfigLocaleLabel.Font           = 'Microsoft Sans Serif,10,style=Bold'
$BootConfigLocaleLabel.Visible        = $false

$BootConfigLocale                     = New-Object system.Windows.Forms.ComboBox
$BootConfigLocale.width               = 214
$BootConfigLocale.height              = 20
$BootConfigLocale.location            = New-Object System.Drawing.Point(650,227)
$BootConfigLocale.Font                = 'Microsoft Sans Serif,10'
$BootConfigLocale.Visible             = $false
ForEach ($Item in $Locales) {
 [void] $BootConfigLocale.Items.Add($Item)
}
$BootConfigLocale.SelectedItem = $BootConfigLocale.Items[$BootConfigLocale.FindString((Get-WinSystemLocale).Name)]

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

$LocalBootConfigForm.controls.AddRange(@($Title,$Description,$BootConfigStatus,$BootConfigFound,$BootConfigDriveLabel,$BootConfigDrive,$BootConfigDetails,$BootConfigPiPasswordLabel,$BootConfigPiPassword, $BootConfigSSIDLabel, $BootConfigSSID, $BootConfigSSIDPWLabel, $BootConfigSSIDPW, $BootConfigHostnameLabel, $BootConfigHostname, $BootConfigModifyPWLabel, $BootConfigModifyPW, $BootConfigTZLabel, $BootConfigTZ, $BootConfigLocaleLabel, $BootConfigLocale, $AddBootConfigBtn,$cancelBtn ))

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
    [Console.Window]::ShowWindow($consolePtr, 4)
}

function Hide-Console
{
    $consolePtr = [Console.Window]::GetConsoleWindow()
    [Console.Window]::ShowWindow($consolePtr, 0)
}

function AddBootConfig {
  $BootConfigFound.ForeColor = "#000000"
  $BootConfigFound.Text = 'Boot configuration completed...'
  $PiPW = $BootConfigPiPassword.Text
  $PiPWChecked = $BootConfigModifyPW
  $SSID = $BootConfigSSID.Text
  $WifiPW = $BootConfigSSIDPW.Text
  $Hostname = $BootConfigHostname.Text
  $SDCard = $BootConfigDrive.SelectedItem

  function Get-Md5Crypt {
    <#
    .DESCRIPTION
        Generate a md5crypt string ($1$salt$hash)
    .PARAMETER String
        The string to hash
    .PARAMETER Salt
        The salt to use (can be a crypt string)
    .PARAMETER SaltSize
        In case no salt is provided generate one with length SaltSize (default: 10)
    .NOTES
        Thanks to Aaron Toponce explanation: https://pthree.org/2015/08/07/md5crypt-explained/
    #>
    param (
        [Parameter(Position=0,ValueFromPipeline)]
        [string]
        $String,

        [string]
        $Salt,

        [ValidateRange(3,100)]
        [int]
        $SaltSize = 10
    )

    if($String.Length -eq 0) {
        $pass = [System.Net.NetworkCredential]::new("", (Read-Host -AsSecureString -Prompt "Enter Password")).Password
        $repeat = [System.Net.NetworkCredential]::new("", (Read-Host -AsSecureString -Prompt "Repeat Password")).Password
        if(-not $pass.Equals($repeat)) {
            throw "Passwords didn't match!"
        }
        $String = $pass
    }

    if($Salt.Length -eq 0) {
        $Salt = (-join ((48..57) +(65..90) + (97..122) | Get-Random -Count $SaltSize | ForEach-Object {[char]$_}))
    }elseif($Salt.StartsWith('$1$')) {
        $Salt = ($Salt -split '\$')[2]
    }

    $md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $utf8 = new-object -TypeName System.Text.UTF8Encoding

    $pw = [byte[]]$utf8.GetBytes($String)
    $magic = [byte[]]$utf8.GetBytes('$1$')
    $bsalt = $utf8.GetBytes($Salt)

    $itoa64 = "./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

    $tmp = [System.Collections.ArrayList]@()
    $tmp.AddRange($pw)
    $tmp.AddRange($bsalt)
    $tmp.AddRange($pw)
    $db = $md5.ComputeHash([byte[]]$tmp)

    $da_bytes = [System.Collections.ArrayList]@()
    $da_bytes.AddRange($pw)
    $da_bytes.AddRange($magic)
    $da_bytes.AddRange($bsalt)
    $i = $pw.Length
    while($i -gt 0) {
        if($i -gt 16) {
            $da_bytes.AddRange($db)
        }else{
            $da_bytes.AddRange($db[0..$($i-1)])
        }
        $i -= 16
    }

    $i = $pw.Length
    while($i -gt 0) {
        if($i -band 1) {
            $da_bytes.Add([byte]0) | Out-Null
        }else{
            $da_bytes.Add($pw[0]) | Out-Null
        }
        $i = $i -shr 1
    }

    $dc = [byte[]]$md5.ComputeHash([byte[]]$da_bytes)

    for($i = 0; $i -lt 1000; $i++) {
        $tmp = [System.Collections.ArrayList]@()
        if($i -band 1) {
            $tmp.AddRange($pw)
        }else{
            $tmp.AddRange($dc)
        }
        if($i%3) { $tmp.AddRange($bsalt) }
        if($i%7) { $tmp.AddRange($pw) }
        if($i -band 1) {
            $tmp.AddRange($dc)
        }else{
            $tmp.AddRange($pw)
        }
        $dc = [byte[]]$md5.ComputeHash([byte[]]$tmp)
    }

    $final = ''
    @(@(0,6,12),@(1,7,13),@(2,8,14),@(3,9,15),@(4,10,5)) | ForEach-Object {
        $x, $y, $z = $_
        $v = ([int]$dc[$x] -shl 16) -bor ([int]$dc[$y] -shl 8) -bor [int]$dc[$z]
        1..4 | ForEach-Object {
            $final += $itoa64[ $v -band 0x3f ]
            $v = $v -shr 6
        }
    }
    $v = [int]$dc[11]
    1..2 | ForEach-Object {
        $final += $itoa64[$v -band 0x3f]
        $v = $v -shr 6
    }

    '{0}{1}${2}' -f $utf8.GetString($magic),$salt,$final
  }
  if ($PiPWChecked.Checked){$PiPWCrypt = Get-Md5Crypt -String $PiPW -SaltSize 8}


#--------------[cmdline.txt]----------------------
  $Cmdline = ($SDCard + "cmdline.txt")
  $unattended = ($SDCard + "unattended")
  $wpasupplicant = ($SDCard +"wpa_supplicant.conf")
  $Inittext =  " init=/bin/bash -c `"mount -t proc proc /proc; mount -t sysfs sys /sys; mount /boot; sed -i 's/\r$//' /boot/unattended; source /boot/unattended`""
  If (Test-Path ($Cmdline)) {
    $CmdlineContent = (((Get-Content $Cmdline) -csplit "( init)")[0] + $Inittext)
    Move-Item -Path $Cmdline -Destination ($SDCard + "cmdline.bak") -Force
    Set-Content -Path $Cmdline -Value $CmdlineContent -NoNewLine

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
raspi-config nonint do_change_timezone $($BootConfigTZ.Text)
# Set locale
raspi-config nonint do_change_locale $($BootConfigLocale.Text).UTF.8
# Set keyboard
raspi-config nonint do_configure_keyboard $(($BootConfigLocale.Text).Substring(($BootConfigLocale.Text).Length - 2))
# Set password, uncomment (remove pound sign) if you want to set the pi password here
sed -i 's/\r$//' /boot/pipassword
$(if ($PiPWChecked.Checked){"usermod --password `'"+$PiPWCrypt+"`' pi"})
passwd --expire pi
raspi-config nonint do_boot_behaviour B3
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
country=$(($BootConfigLocale.Text).Substring(($BootConfigLocale.Text).Length - 2))

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
  $BootConfigTZLabel.Visible = $false
  $BootConfigTZ.Visible = $false
  $BootConfigLocaleLabel.Visible = $false
  $BootConfigLocale.Visible = $false
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
  $BootConfigTZLabel.Visible = $true
  $BootConfigTZ.Visible = $true
  $BootConfigLocaleLabel.Visible = $true
  $BootConfigLocale.Visible = $true
}else{
  $BootConfigFound.text = "No SD Cards found"
  $BootConfigFound.ForeColor = "#D0021B"
  $cancelBtn.text = "Close"
}

$AddBootConfigBtn.Add_Click({ AddBootConfig })

$BootConfigDrive.Add_SelectedIndexChanged({
    $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0) -and ($BootConfigTZ.Text.Length -gt 0) -and ($BootConfigLocale.Text.Length -gt 0))
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
    $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0) -and ($BootConfigTZ.Text.Length -gt 0) -and ($BootConfigLocale.Text.Length -gt 0))
})

$BootConfigPiPassword.Add_TextChanged({
  $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0) -and ($BootConfigTZ.Text.Length -gt 0) -and ($BootConfigLocale.Text.Length -gt 0))
})

$BootConfigSSID.Add_TextChanged({
  $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0) -and ($BootConfigTZ.Text.Length -gt 0) -and ($BootConfigLocale.Text.Length -gt 0))
})

$BootConfigSSIDPW.Add_TextChanged({
  $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0) -and ($BootConfigTZ.Text.Length -gt 0) -and ($BootConfigLocale.Text.Length -gt 0))
})

$BootConfigHostname.Add_TextChanged({
  $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0) -and ($BootConfigTZ.Text.Length -gt 0) -and ($BootConfigLocale.Text.Length -gt 0))
})

$BootConfigTZ.Add_TextChanged({
    $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0) -and ($BootConfigTZ.Text.Length -gt 0) -and ($BootConfigLocale.Text.Length -gt 0))
})

$BootConfigLocale.Add_TextChanged({
    $AddBootConfigBtn.Enabled = (!(($BootConfigPiPassword.Text.Length -gt 0) -xor $BootConfigModifyPW.Checked) -and ($BootConfigSSID.Text.Length -gt 0) -and ($BootConfigSSIDPW.Text.Length -gt 0) -and ($BootConfigHostname.Text.Length -gt 0) -and ($BootConfigDrive.SelectedItem.Length -gt 0) -and ($BootConfigTZ.Text.Length -gt 0) -and ($BootConfigLocale.Text.Length -gt 0))
})

[void]$LocalBootConfigForm.ShowDialog()
