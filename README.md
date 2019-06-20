# get-w10-lockscreen-wallpapers
Script gets Windows 10 lockscreen wallpapers from "\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets" and put to "MyPictures\LockScreens" folder. So it can be used as a source for desktop wallpaper.
Script tested on FullHD (1920x1080) in horizontal (landscape) orientation. It uses 1920 as image width constant to filter only horizontal images, and >100K file size to filter off icons.
