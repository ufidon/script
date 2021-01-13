# its372
Course materials and demos for labs


## Lab01: Setup lab environment

**1.Description**

In this lab,  setup two virtual machines and put them in a NAT network of VMWare Workstation Player/VirtualBox:
Windows server and Ubuntu, both use the latest stable versions.

*If your host is Windows 10, you may use it in this course instead of the Windows server VM.*

**2.Steps**

1. (40%) Create VMs, NAT network, download and install ISOs and software
   1. (20%) Setup Windows server then install guest tools, chrome browser, visual studio code, ConEmu and Powershell
   2. (20%) Setup Ubuntu, open a terminal run the following commands then install guest tools and visual studio code

```bash
# Inside Ubuntu, open a terminal, run the following commands
sudo apt update
sudo apt upgrade
sudo apt install apt-transport-https dirmngr vim geany okular
sudo apt install terminator p7zip-full build-essential gcc perl cmake automake curl git vim
```

2. (60%) download and run the script files
   1. (20%, 10% each) On the Windows Server VM or your Windows host, open Command Prompt or ConEmu and run the following scripts inside it: zip2barcode.cmd,  onedigit.bat
   2. (20%) open Powershell and run the following script inside it: chineseyear.ps1
   3. (20%) On the Ubuntu Linux VM, open a terminal and run the following script: add2nums.sh


## References
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


