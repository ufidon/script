# its372
Course materials and demos for labs


## Lab01: Setup lab environment

**1.Description**

In this lab,  setup two virtual machines and put them in a NAT network of VMWare Workstation Player/VirtualBox:
Windows server and Ubuntu, both use the latest stable versions.

In the following cases, you may NOT need to install all VMs:

1. *If your host is Windows 10, you may use it in this course instead of the Windows server VM, so you only need to install a Ubuntu VM*
2. *If your host is Ubuntu, you only need to install a Windows 10, or 2012, or 2016, or 2019, or 2022 VM*
3. *If your host is MacOS, you need to install both Ubuntu VM and Windows VM*
4. *If you have double-boot system of Windows and Ubuntu, you don't need any VMs*

**2.Steps**

**Note: no credits for installing VMs, since you have done that many times.**

1. Create VMs, NAT network, download and install ISOs and guest tools,
   1. Setup Windows server then 
      1. (20%, each 5%) install chrome browser, visual studio code, ConEmu and Powershell
   2. Setup Ubuntu, 
      1. (20%, each 5%) open a terminal run the following commands then install guest tools and visual studio code

```bash
# Inside Ubuntu, open a terminal, run the following commands
sudo apt update
sudo apt upgrade
sudo apt install apt-transport-https dirmngr vim geany okular
sudo apt install terminator p7zip-full build-essential gcc perl cmake automake curl git vim linux-headers-$(uname -r)
```

2. (60%) download and run the script files
   1. (20%, 10% each) On the Windows Server VM or your Windows host, open Command Prompt or ConEmu and run the following scripts inside it: zip2barcode.cmd,  onedigit.bat
   2. (20%) open Powershell and run the following script inside it: chineseyear.ps1
   3. (20%) On the Ubuntu Linux VM, open a terminal and run the following script: add2nums.sh

**Demo video**
* Using VirtualBox:
  * [Lab01: Install Windows server 2022 in VirtualBox 6.1](https://youtu.be/iqyK9QqGyo0)
  * [Lab01: Create shared folder between Windows 10 host and Windows Server 2022 guest VM in VirtualBox 6.1](https://youtu.be/S1x7I8kUcBU)
  * [Lab01: Install Ubuntu mate 20.04 LTS in VirtualBox 6.1](https://youtu.be/ZGJi20F2eqA)
  * [Lab01: Create shared folder between Ubuntu 20.04 guest and Windows 10 host](https://youtu.be/t0r4RIwPo60)
  * [Lab01: Execute scripts](https://youtu.be/qGcXxuWe7y0)

* Using VMWare Player:
  * [Lab01: Setup lab environment Part I](https://youtu.be/C1196ysEem4)
  * [Lab01: Setup lab environment Part II](https://youtu.be/qGcXxuWe7y0)

## References
**Problems and solutions**
  * [VirtualBox shared folder is accessible but not workable](https://askubuntu.com/questions/287216/virtualbox-shared-folder-is-accessible-but-not-workable)
**Where are the OSes and tools?**
  * [VMware Workstation Player](https://www.vmware.com/products/workstation-player.html)
  * [VirtualBox](https://www.virtualbox.org/)
  * [Ubuntu Mate LTS](https://ubuntu-mate.org/)
  * [Windows server](https://www.microsoft.com/en-us/cloud-platform/windows-server)
  * [Visual Studio code](https://code.visualstudio.com/)
  * [PowerShell](https://github.com/PowerShell/PowerShell)
  * [ConEmu](https://conemu.github.io/)

**Check virtualization availability**
  * [Linux Find Out If CPU Support Intel VT/AMD-V Virtualization For KVM](https://www.cyberciti.biz/faq/linux-xen-vmware-kvm-intel-vt-amd-v-support/)
  * [Easy Ways to Check If Your Processor Supports Virtualization](https://www.technorms.com/8208/check-if-processor-supports-virtualization)
  * [How to find out if Intel VT-x or AMD-V virtualization technology is supported?](https://www.auslogics.com/en/articles/how-to-find-out-if-intel-vt-x-or-amd-v-virtualization-technology-is-supported/)
  * [How to check if Intel Virtualization is enabled without going to BIOS in Windows 10](https://stackoverflow.com/questions/49005791/how-to-check-if-intel-virtualization-is-enabled-without-going-to-bios-in-windows)
  * [How to Enable Intel VT-x in Your Computer’s BIOS or UEFI Firmware](https://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/)
  * [Virtualization (VT-x/AMD-V) - Enabling virtualization on your computer for running 2N® Access Commander](https://2nwiki.2n.cz/pages/viewpage.action?pageId=75202968)

**Youtube Videos** 
  * [Create empty virtual machines for Ubuntu & Windows Server 2019 in VirtualBox 6](https://youtu.be/3PbnBVNWXpk)
  * [Install Ubuntu 18.04LTS in VirtualBox 6](https://youtu.be/3BHsizTRUg0)
  * [Install Windows Server 2019 in VirtualBox 6](https://youtu.be/fQZFoSTSuPM)
  * [Create SEED Ubuntu 16.04 virtual machines and NAT network](https://youtu.be/pwSlVJSCpu0)
  * [How to run VirtualBox virtual machines on other computers with VirtualBox?](https://youtu.be/Ps30RJ1MzgQ)


