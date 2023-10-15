# Install Arch

## Reference

- [Arch Installation guide](https://wiki.archlinux.org/title/Installation_guide)
- [Import any Linux distribution to use with WSL](https://docs.microsoft.com/en-us/windows/wsl/use-custom-distro)

## How to use

### Virtual Machine

```zsh
git clone https://github.com/lewwcom/arch-install
cd arch-install
bash arch-install.sh
```

### WSL

Integrate Docker with Ubuntu WSL. In Bash of Ubuntu WSL run:

```bash
# cd to Windows location (/mnt/c/...)
CONTAINER_NAME=archlinux
docker run --name $CONTAINER_NAME archlinux
docker export $CONTAINER_NAME > $(pwd)/arch.tar
docker rm --force $CONTAINER_NAME
```

Import `arch.tar` to wsl in PowerShell:

```powershell
$TarLocation = "$(Get-Location)\arch.tar"
$InstallLocation = "~\WSL Distros\Arch Linux"
wsl --import archlinux $InstallLocation $TarLocation
wsl -d archlinux
```

Run `arch-install.sh` script
