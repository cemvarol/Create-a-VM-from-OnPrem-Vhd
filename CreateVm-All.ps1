﻿$disk = Get-AzDisk -ResourceGroupName 'Migrator' -DiskName 'cems.vhd'
$location = 'East US'
$imageName = 'cems'
$rgName = 'Migrator'



$imageConfig = New-AzImageConfig `
   -Location $location
$imageConfig = Set-AzImageOsDisk `
   -Image $imageConfig `
   -OsState Generalized `
   -OsType Windows `
   -ManagedDiskId $disk.Id


   $image = New-AzImage `
   -ImageName $imageName `
   -ResourceGroupName $rgName `
   -Image $imageConfig


   New-AzVm `
    -ResourceGroupName $rgName `
    -Name "CemsVm" `
    -Image $image.Id `
    -Location $location `
    -VirtualNetworkName "Mig-VNet" `
    -SubnetName "SN01" `
    -SecurityGroupName "MigNSG" `
    -PublicIpAddressName "myPIP" 
#    -OpenPorts 3389