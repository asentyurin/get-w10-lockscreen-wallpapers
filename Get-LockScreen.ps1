# Current user assets folder path
$LSPath = $env:USERPROFILE + "\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"

# Create (if not exist) LockScreens folder in user MyPictures folder
$LSWPath = [Environment]::GetFolderPath("MyPictures")
$TARGETDIR = "$LSWPath\LockScreens"
if(!(Test-Path -Path $TARGETDIR)){
   New-Item -ItemType directory -Path $LSWPath\LockScreens
}
$LSWFolder = $TARGETDIR

# Desirable wallpaper width size
$WPWidth = "1920"

# Get files greater than 100KB
$WPfiles = Get-ChildItem -path $LSPath -recurse | Where-Object  {($_.Length /1KB) -gt 100}

# Check wallpaper width and copy to LockScreens folder
$WPFiles | ForEach-Object {
    add-type -AssemblyName System.Drawing
    $image = New-Object System.Drawing.Bitmap $_.FullName
    $imageWidth = $image.Width
    if ($imageWidth -eq $WPWidth)
    {
    $dst = $LSWFolder + "\" + $_.Name + ".jpg"
    Copy-Item $_.FullName -Destination $dst
    }
}
