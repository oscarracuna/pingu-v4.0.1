Write-Host "
 
  ____ ___ _   _  ____ _   _  __     _______ 
 |  _ \_ _| \ | |/ ___| | | | \ \   / /___ / 
 | |_) | ||  \| | |  _| | | |  \ \ / /  |_ \ 
 |  __/| || |\  | |_| | |_| |   \ V /  ___) |
 |_|  |___|_| \_|\____|\___/     \_/  |____/ 
                                             
                                              
                                             "

#This is what you'd be looking for in the csv file
$id = Read-Host "Enter ID"

$idCsv = Import-Csv -Path 'path/to/csv/file.csv' | Select-Object -Skip 1

$idRow = $ipScheme | Where-Object { $_.cap -eq $id }


if ($idRow) {
        #Change the idRow as needed
	$ip1 = [System.Net.IPAddress]::Parse($idRow.ip1)
        $ip2 = [System.Net.IPAddress]::Parse($idRow.ip2)
        $ip3 = [System.Net.IPAddress]::Parse($idRow.ip3)
        
}

#This opens the terminal split view
Start-Process -FilePath "wt.exe" -ArgumentList "--title --size 120,40 $id ping $ip1 -t; sp -H --title $id ping $ip2 -t; sp -V --title $id ping $ip3 -t"