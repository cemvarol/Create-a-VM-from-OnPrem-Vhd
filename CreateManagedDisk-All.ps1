
$vhdSizeBytes = (Get-Item "C:\VMs\2012C.vhd").length

$diskconfig = New-AzDiskConfig -SkuName 'Standard_LRS' -OsType 'Windows' -UploadSizeInBytes $vhdSizeBytes -Location 'EastUs' -CreateOption 'Upload'

New-AzDisk -ResourceGroupName "Migrator" -DiskName "cems2.vhd" -Disk $diskconfig




$diskSas = Grant-AzDiskAccess -ResourceGroupName 'Migrator' -DiskName 'cems2.vhd' -DurationInSecond 86400 -Access 'Write'


 $disk = Get-AzDisk -ResourceGroupName 'Migrator' -DiskName 'cems2.vhd'

 .\azcopy.exe copy "2012C.vhd" $diskSas.AccessSAS --blob-type PageBlob
 

 Revoke-AzDiskAccess -ResourceGroupName 'Migrator' -DiskName 'cems2.vhd'
