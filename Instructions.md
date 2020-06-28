1-      Create a VM and configure as HPV,
2-      Download 2012R2 vhd to that HPV. (the reason is uploading 40GB will be faster from a VM on azure than on your comp )
3-      Configure your guest VM (2012) to work
a.       Don’t bother with them  just go to my GitHub and
                                                               i.      Run this script on bash this will create a 2019 server on azure
                                                             ii.      Connect to that 2019 via RDP, username is cem, and password is 1q2w3e4r5t6y*
                                                           iii.      Run this script on PowerShell of win2019 server
This will download chrome, configure sets and download 2012-R2 and start that VM
                                                           iv.      Close all open PowerShell console windows on 2019
                                                             v.      Follow steps on 2012R2 to complete setup (choose lang and set pwd)
                                                           vi.      Go to 2012R2 and run the guest.ps1 inside the 2012R2.. C:\guest.ps it is 
                                                          vii.      This will prepare your 2012.
4-      Install AZ-Copy and Azure PowerShell to your 2019
a.       IMPORTANT: When you download AZ-copy. Extract the AZ-Copy file to C:\VMS folder.
5-      After 2012R2 is ready, sysprep and shutdown.
6-      Convert the 2012R2 dynamically expanding disk to fixed size disk. (This may take 5-10 mins)
7-      Time to go for creating the empty managed disk on Azure.
a.       You will use the size of your fixed size disk and create an empty disk space to upload your own disk
Run this on 2019 PowerShell console
b.        You will allow azure PowerShell to access the empty managed disk
Run this on 2019 PowerShell Console to create access token to empty managed disk
c.       Time to upload your 40GB disk to azure
Run this on 2019 PowerShell Console to upload the content and release the disk. Remember this may take a while
8-      Now everything is ready to create the vm
a.       Run this on 2019 PowerShell Console
9-      When created, go to visit the public Ip of the newly created vm, you will see something like that.
 
<image001.png>
 
 
 
All of the above are doing the steps on the link down below
 
https://docs.microsoft.com/en-us/azure/virtual-machines/windows/create-vm-specialized-portal
https://docs.microsoft.com/en-us/azure/virtual-machines/windows/upload-generalized-managed#generalize-the-source-vm-by-using-sysprep
https://docs.microsoft.com/en-us/azure/virtual-machines/windows/disks-upload-vhd-to-managed-disk-powershell
https://docs.microsoft.com/en-us/powershell/azure/install-Az-ps?view=azps-4.3.0#code-try-1
https://docs.microsoft.com/en-us/rest/api/compute/disks/createorupdate
https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10
https://docs.microsoft.com/en-us/powershell/module/hyper-v/convert-vhd?view=win10-ps
